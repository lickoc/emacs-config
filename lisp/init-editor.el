;;; init-editor.el --- 基础编辑行为

;; ─── 缩进 ──────────────────────────────────────────────────────────────
(setq-default indent-tabs-mode nil)     ;; 缩进用空格，不用 tab
(setq-default tab-width 4)              ;; tab/缩进宽度 4
(setq-default c-basic-offset 4)         ;; C 系语言缩进 4
(setq-default fill-column 80)           ;; 自动换行宽度

;; ─── 行号 ──────────────────────────────────────────────────────────────
(global-display-line-numbers-mode 1)    ;; 开启行号（比旧的 linum-mode 更好）
(setq display-line-numbers-type 'relative)  ;; 相对行号（更接近 vim 风格）

;; ─── 光标 ──────────────────────────────────────────────────────────────
(setq-default cursor-type '(bar . 2))   ;; 竖线光标（I-beam），宽度 2
(blink-cursor-mode -1)                  ;; 光标不闪烁

;; ─── 括号匹配 ──────────────────────────────────────────────────────────
(electric-pair-mode 1)                  ;; 自动插入闭合括号和引号
(show-paren-mode 1)                     ;; 光标在括号上时高亮其配对括号
(setq show-paren-delay 0)               ;; 不延迟，光标移到括号上立即高亮
(setq show-paren-style 'parenthesis)    ;; 只高亮括号字符本身（不高亮包含的区域）

;; ─── 设置标记 ─────────────────────────────────────────────────────────
;; C-SPC 被输入法切换占用了，改用 C-@ 设置标记
(global-set-key (kbd "C-@") 'set-mark-command)

;; ─── 剪贴板 ──────────────────────────────────────────────────────────
;; Emacs 30 会自动检测 Wayland (wl-copy/wl-paste) 或 X11 (xclip)
(setq select-enable-clipboard t)            ;; 让 Emacs 感知系统剪贴板（与外部程序互通）
(setq save-interprogram-paste-before-kill t) ;; 从外部粘贴的内容不进入 kill ring，避免覆盖历史
(setq mouse-yank-at-point t)                ;; 鼠标中键粘贴到光标当前位置（而不是点击位置）

;; ─── 编码 ────────────────────────────────────────────────────────────
;; 全线 UTF-8，确保中文不乱码
(set-language-environment "utf-8")          ;; 设置语言环境为 UTF-8
(set-default-coding-systems 'utf-8)         ;; 默认编码
(set-terminal-coding-system 'utf-8)         ;; 终端编码
(set-keyboard-coding-system 'utf-8)         ;; 键盘输入编码
(set-clipboard-coding-system 'utf-8)        ;; 剪贴板编码
(set-buffer-file-coding-system 'utf-8)      ;; 文件编码
(set-selection-coding-system 'utf-8)        ;; 选区（X11 selection）编码
(modify-coding-system-alist 'process "*" 'utf-8)  ;; 子进程通信用 UTF-8
(prefer-coding-system 'utf-8)               ;; 遇到编码选择时优先 UTF-8
(setq-default
  pathname-coding-system 'utf-8             ;; 文件名编码
  locale-coding-system 'utf-8               ;; 区域编码
  file-name-coding-system 'utf-8
  default-process-coding-system '(utf-8 . utf-8))  ;; 进程数据的输入输出编码
;; 设置系统环境变量确保外部命令也走 UTF-8
;; locale 已在 early-init.el 中强制设为 C.utf8，这里只留 LC_CTYPE
(setenv "LC_CTYPE" "C.utf8")

;; ─── C-x C-f 在新 tab 中打开文件 ────────────────────────────────────
;; 默认 C-x C-f 会覆盖当前 buffer，改为在新 tab 中打开
(global-set-key (kbd "C-x C-f") 'find-file-other-tab)

;; ─── 文件操作 ──────────────────────────────────────────────────────────
(setq auto-save-default t)              ;; 启用自动保存（M-x recover-file 可恢复）
(setq auto-save-file-name-transforms
      '((".*" "~/.emacs.d/data/backup/" t))) ;; 自动保存文件统一存到 backup 目录
(setq backup-directory-alist
      '(("." . "~/.emacs.d/data/backup/")))  ;; 备份文件也统一存到 backup 目录
(setq delete-by-moving-to-trash t)      ;; 删除文件时移到回收站，而不是直接删
(setq create-lockfiles nil)             ;; 不创建 .# 锁文件（你只有一个 Emacs 实例）
(setq delete-old-versions t             ;; 备份文件保留过多时自动删除旧的
      kept-new-versions 3               ;; 保留最近 3 个版本
      kept-old-versions 2               ;; 保留最旧的 2 个版本
      version-control t)                ;; 开启带版本号的备份（文件名.~1~、.~2~）
(setq undo-limit 80000000)              ;; 撤销历史内存限制提高到 80MB，够 undo 上千步

;; ─── 界面行为 ──────────────────────────────────────────────────────────
;; GUI 模式下关闭菜单栏、工具栏、滚动条（这些在 early-init.el 中也设了一次，双重保险）
(menu-bar-mode -1)
(when (display-graphic-p)
  (scroll-bar-mode -1)
  (tool-bar-mode -1))

(global-hl-line-mode 1)                 ;; 高亮当前光标所在行
(setq truncate-string-ellipsis "…")     ;; 文本截断时用 … 代替原来的 ...
(setq-default truncate-lines t)         ;; 不自动断行（超出窗口宽度的内容水平滚动查看）
(global-font-lock-mode t)               ;; 启用语法高亮着色
(auto-compression-mode 1)               ;; 打开 .gz/.bz2 等压缩文件时自动解压
(global-auto-revert-mode 1)             ;; 文件被外部程序修改后自动重新加载
(fset 'yes-or-no-p 'y-or-n-p)          ;; 将 yes/no 全拼简化为 y/n 简写

;; ─── 滚动 ──────────────────────────────────────────────────────────────
(setq scroll-margin 5                   ;; 光标距离窗口顶部/底部 5 行时就开始滚动
      scroll-conservatively 10000       ;; 尽量少跳转页面，逐行滚动更平滑
      mouse-wheel-scroll-amount '(3 ((shift) . 3))) ;; 鼠标滚轮一次滚 3 行，Shift+滚轮也一样

;; ─── 搜索 ──────────────────────────────────────────────────────────────
(setq isearch-allow-scroll t)           ;; 在增量搜索 (C-s) 过程中允许滚动窗口
(setq isearch-lazy-count t)             ;; 显示当前匹配是第几个 / 总匹配数
(setq lazy-highlight-initial-delay 0)   ;; 不延迟，立即高亮所有匹配项

;; ─── 记忆 / Buffer ─────────────────────────────────────────────────────
(setq save-place-mode 1)                ;; 记住每个文件退出时光标的位置，下次打开时跳回
(setq kill-ring-max 200)                ;; 剪贴板历史最多保存 200 条
(setq enable-recursive-minibuffers t)   ;; 允许在 minibuffer 中再输入命令（如 C-x b 时再 M-x）
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
;; 同名 buffer 时用 <dirname> 后缀区分，如 main.c <src>/ main.c <test>
(setq window-combination-resize t)      ;; 新窗口分割时平均分配空间

;; ─── 扩展功能 ──────────────────────────────────────────────────────────
(global-subword-mode 1)                 ;; 驼峰拆字：CamelCaseWord 按大写字母拆成单词
(toggle-truncate-lines -1)              ;; 取消自动换行（兼容旧设定，保持行不自动断）
(electric-pair-mode -1)                 ;; 关闭 electric-pair（已在前面用括号段统一管理）
(show-paren-mode -1)                    ;; 关闭内置括号高亮（已在前面用括号段统一开启）

;; ─── expand-region：增量选择 ──────────────────────────────────────
;; 按 C-= 逐次扩大选中区域：单词 → 表达式 → 句子 → 函数 → 整个 buffer
;; 如果选过了，可以按 C-g 取消然后用更小范围重新选择
(use-package expand-region
  :bind ("C-=" . er/expand-region))   ;; 绑定到 C-=

(provide 'init-editor)
;;; init-editor.el ends here
