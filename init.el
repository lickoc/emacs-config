;;; -*- lexical-binding: t -*-

;; 用法----------------------------------------------
;; M - alt键， S - windows键， S - shift键， C - ctrl键
;; C-f 前移一个字符， C-b 后移一个字符
;; C-p 上移一行， C-n 下移一行
;; C-a 移至行首， C-e 移至行尾
;; C-x C-f 打开目标文件
;; C-g 关闭当前指令
;; C-x C-s 保存当前缓冲区buffer
;; C-x 1 仅保留当前窗口
;; C-x 2 将当前窗口分到上边,水平分割
;; C-x 3 将当前窗口分到右边，垂直分割
;; C-x o 切换到下一个窗口
;; C-h f 输入函数描述，查找函数
;; C-x C-c 退出emacs
;; C-c SPC Mark功能标记，移动光标进行选中文本
;; M-w 复制选中文本
;; C-w 剪切选中文本
;; C-y 粘贴最近一次剪切/复制的内容
;; C-_ || C-x u 撤销操作
;; C-s swiper搜索
;; C-x b switch buffer
;; C-c s switch view
;; C-c v push view
;; C-c V pop view
;; C-x C-@ counsel-mark-ring
;; -------------------------------------------------

;; 初始化配置-----------------------------------------
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory)) ; 设置.emacs.d/lisp/ 为源码加载路径

(setq gc-cons-threshold (* 128 1024 1024)) ; 调整垃圾回收内存上限
;; -------------------------------------------------

;; 基础配置-------------------------------------------
(add-to-list 'default-frame-alist '(width . 72))
(add-to-list 'default-frame-alist '(height . 22)) ; 启动图形界面时的宽/高度

(tool-bar-mode -1) ; 关闭工具栏
(menu-bar-mode -1) ; 关闭菜单栏
(scroll-bar-mode -1) ; 关闭文件滑动控件
(global-display-line-numbers-mode 1) ; 在window上显示行号
(setq display-line-numbers-type 'relative) ; 显示相对行号
(column-number-mode t) ; 在mode line上显示列号
(setq-default cursor-type 'bar) ; 更改光标样式
(setq inhibit-splash-screen 1) ; 关闭启动帮助画面
(set-face-attribute 'default nil :height 160) ; 更改显示字体大小 16pt
(setq make-backup-files nil) ; 禁止emacs自动生成备份文件

(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el")) ; 快速打开配置文件
(global-set-key (kbd "<f2>") 'open-init-file) ; 将上面函数绑定到<f2>键

(require 'recentf) ; 最近打开的文件
(recentf-mode 1)
(setq recentf-max-menu-item 10)

(delete-selection-mode 1) ; 删除时，可以选中输入替代
(setq confirm-kill-emacs #'yes-or-no-p) ; 关闭emacs前，询问是否关闭
(electric-pair-mode t) ; 自动补全括号
(add-hook 'prog-mode-hook #'show-paren-mode) ; 高亮另一个括号
(global-auto-revert-mode t) ; 另一个程序修改文件时，emacs及时更新
(add-hook 'prog-mode-hook #'hs-minor-mode) ; 编程模式下，可以折叠代码块
(savehist-mode 1) ; buffer历史记录保存
(setq x-select-enable-clipboard t) ; 图形页面下共享剪贴板
;; -------------------------------------------------

;; 编程模式配置---------------------------------------
(add-hook 'prog-mode-hook 'prettify-symbols-mode) ; 会将lambda等符号美化

;; -------------------------------------------------


;; 快捷键配置-----------------------------------------
(global-set-key (kbd "C-c SPC") 'set-mark-command) ; 更改mark功能快捷键为C-c SPC
(global-set-key (kbd "M-/") 'hippie-expand) ; 输入字符前缀后，按键M-/自动匹配补全后面的内容

;; -------------------------------------------------

;; 主题配置-------------------------------------------
(require 'init-theme)

;; -------------------------------------------------



;; 插件管理-------------------------------------------
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize) ; 配置插件仓库

(require 'init-ivy)
(require 'init-company)
(require 'init-flycheck)
(require 'init-treesit)
(require 'init-eglot)
(require 'init-ace-window)
(require 'init-good-scroll)
;; -------------------------------------------------

(provide 'init)

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
