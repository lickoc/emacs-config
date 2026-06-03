;;; init.el --- Emacs 主入口
;; 所有配置模块通过 require 按顺序加载，模块文件放在 lisp/ 目录下

;; ─── 加载路径 ──────────────────────────────────────────────────────────
;; 将 lisp/ 目录加入 load-path，方便 require 时直接找到对应的 .el 文件
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; ─── 模块加载顺序 ────────────────────────────────────────────────────
;; 顺序有讲究：包管理先于一切，界面和编辑行为优先于补全和快捷键
(require 'init-packages)   ;; 包管理 —— 初始化 straight.el + use-package
(require 'init-ui)         ;; 界面 —— 主题、字体、状态栏、tab、dashboard
(require 'init-editor)     ;; 编辑行为 —— 缩进、行号、编码、文件操作、搜索等
(require 'init-completion) ;; 补全框架 —— vertico + consult + orderless
(require 'init-keybinds)   ;; 快捷键 —— which-key、自定义键位
(require 'init-lsp)        ;; LSP —— 语言服务器协议（编辑 init-lsp.el 启用）
(require 'init-prog)       ;; 编程语言 —— 括号高亮、TODO 高亮等通用编程设置
(require 'init-org)        ;; Org-mode —— 笔记、GTD、文档（编辑 init-org.el 启用）
(require 'init-misc)       ;; 杂项 —— magit、dired、eshell、vterm 等

;; ─── 恢复 GC 阈值 ────────────────────────────────────────────────────
;; early-init.el 中临时调高了 GC 阈值来加速启动，这里恢复正常值
(setq gc-cons-threshold 800000
      gc-cons-percentage 0.1)

;; ─── Customize 文件 ──────────────────────────────────────────────────
;; M-x customize 保存的设置会写入 separate 的 custom.el，不污染 init.el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; ─── consult 手动加载 ─────────────────────────────────────────────
;; straight 的 native-comp 在 Fedora 44 + Emacs 30 下有兼容问题，
;; 在 GUI 启动时 consult 的 load-path 可能未正确设置。
;; 这里在 straight 就绪后手动添加 build 目录并加载 consult
(let ((consult-dir (expand-file-name "straight/build/consult" user-emacs-directory)))
  (when (and (file-directory-p consult-dir)
             (not (featurep 'consult)))
    (add-to-list 'load-path consult-dir)
    (condition-case err
        (require 'consult)
      (error
       (message "consult 加载失败: %S" err)))))

(provide 'init)
;;; init.el ends here
