;;; init-org.el --- Org-mode 配置（笔记、GTD、文档）
;; Org-mode 是 Emacs 最强的笔记和任务管理工具
;;
;; 注意：由于 Fedora 44 下 Emacs 30 的 native-comp 在宏展开时
;; 与 org-id 的 shell 调用有兼容问题，此模块改用手动加载方式。
;; 需要用 org-capture/org-agenda 时在 emacs 中手动 M-x org-capture。

;; 使用 Emacs 内置的 org（不从 straight 拉取）
(eval-after-load 'org
  '(progn
     ;; ── 快捷键 ──
     (define-key global-map (kbd "C-c c") #'org-capture)         ;; 快速捕获笔记
     (define-key global-map (kbd "C-c a o") #'org-agenda)        ;; 打开 Org Agenda
     (define-key global-map (kbd "C-c C-.") #'org-mark-ring-goto) ;; 跳回之前编辑位置

     ;; ── 显示 ──
     (setq org-startup-indented t)        ;; 打开文件时缩进显示
     (setq org-hide-leading-stars t)      ;; 隐藏前导星号
     (setq org-odd-level-only nil)        ;; 不限制标题用奇数星号
     (setq org-ellipsis " ▼")             ;; 折叠用 ▼ 代替 ...
     (setq org-startup-truncated nil)     ;; 不自动换行
     (setq org-tags-column 1)             ;; 标签靠右对齐

     ;; ── 编辑行为 ──
     (setq org-special-ctrl-a/e t)        ;; C-a/e 跳过标题前缀
     (setq org-return-follows-link nil)   ;; 回车不跟链接
     (setq org-insert-heading-respect-content nil)  ;; 新标题插在当前位置
     (setq org-M-RET-may-split-line '((item) (default . t)))
     (setq org-use-speed-commands t)      ;; 标题上按字母执行操作

     ;; ── 其他 ──
     (setq org-startup-align-all-tables nil)
     (setq org-log-into-drawer nil)
     (setq org-blank-before-new-entry '((heading . nil) (plain-list-item . nil)))

     ;; ── 外观 ──
     (custom-set-faces
      '(org-headline-done ((t (:strike-through t)))))))

;; org-superstar 改用手动加载，避开 use-package 宏展开阶段的问题
(when (require 'org-superstar nil 'noerror)
  (add-hook 'org-mode-hook #'org-superstar-mode))

(provide 'init-org)
;;; init-org.el ends here
