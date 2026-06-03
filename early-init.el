;;; early-init.el --- 最早期的启动配置（Emacs 在加载 init.el 前先执行此文件）

;; ─── 垃圾回收 ──────────────────────────────────────────────────────────
;; 启动时临时调高 GC 阈值，避免初始化期间频繁 GC 拖慢速度
;; 启动完成后（在 init.el 末尾）会恢复为正常值
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)

;; ─── 禁用多余 UI 元素 ────────────────────────────────────────────────
;; 在 frame 参数层面直接禁止菜单栏、工具栏、滚动条（比 mode 命令更早生效）
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

;; ─── 启动画面 ──────────────────────────────────────────────────────────
;; 不显示 GNU Emacs 启动画面和初始消息，*scratch* buffer 设为空内容
(setq inhibit-startup-screen t
      inhibit-startup-echo-area-message t
      initial-scratch-message nil)

;; ─── 文件对话框 ──────────────────────────────────────────────────────
;; 禁止 Emacs 调用系统原生打开文件对话框（统一用 minibuffer 输路径）
(setq use-file-dialog nil)

;; ─── 包管理器 ──────────────────────────────────────────────────────────
;; 禁用内置的 package.el（我们全部用 straight.el 管理包）
(setq package-enable-at-startup nil)

;; ─── Locale 环境 ──────────────────────────────────────────────────────
;; 强制设置 locale 为 C.utf8（注意 Fedora 44 上 locale 名小写 u），
;; 避免找不到 en_US.UTF-8 时 /usr/bin/sh 的 setlocale warning 被
;; Emacs Lisp 读取器错误解析为变量符号
(setenv "LC_ALL" "C.utf8")
(setenv "LANG" "C.utf8")

;; ─── 本机编译 ──────────────────────────────────────────────────────────
;; Emacs 29+ 特性：将 Elisp 编译为原生机器码，大幅提升性能
(when (native-comp-available-p)
  (setq native-comp-jit-compilation t       ;; 启用即时编译
        native-comp-compiler-options '("-O2" "-march=x86-64-v3")
        native-comp-async-report-warnings-errors 'silent  ;; 静默编译警告
        native-comp-eln-load-path (list (expand-file-name "eln-cache" user-emacs-directory)))
  ;; 修复 /usr/bin/sh 环境问题：确保 subr.el 在编译时的 shell 调用正常
  ;; Fedora 44 上需要设置正确的 locale
  (setenv "LC_ALL" "C.utf8")
  (setenv "LANG" "C.utf8"))

;;; early-init.el ends here
