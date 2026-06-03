;;; init-ui.el --- 界面设置（主题、字体、图标、tab、dashboard）

;; ─── 字体 ──────────────────────────────────────────────────────────────
;; 用 JetBrainsMono Nerd Font 14pt，需要先安装该字体
(set-face-attribute 'default nil
                    :family "JetBrainsMono Nerd Font"
                    :height 140
                    :weight 'normal)

;; ─── 主题 ──────────────────────────────────────────────────────────────
;; 使用 ef-themes 包，ef-night 是深蓝灰底的暗色主题，不刺眼
(use-package ef-themes
  :ensure nil              ;; 用 straight 安装，不从 ELPA 装
  :config
  (setq ef-themes-to-toggle '(ef-dark ef-light))  ;; 设置快速切换的浅/暗主题对
  (load-theme 'ef-night t))  ;; 默认加载 ef-night（深蓝灰底，不是纯黑）

;; ─── 图标字体 ──────────────────────────────────────────────────────
;; 为 treemacs、dashboard、centaur-tabs 等包提供图标支持
;; 首次使用需执行 M-x all-the-icons-install-fonts 安装字体文件
(use-package all-the-icons
  :if (display-graphic-p))           ;; 仅在 GUI 模式下加载，终端下不加载

;; ─── Emoji 显示 ──────────────────────────────────────────────────────
;; 让 Emacs 内显示彩色 emoji（默认是黑白的），支持 Unicode 和 GitHub 风格
(use-package emojify
  :hook (after-init . global-emojify-mode)  ;; 启动完成后全局启用
  :config
  (setq emojify-emoji-styles '(unicode github)))

;; ─── 顶部标签栏 ──────────────────────────────────────────────────────
;; 在 frame 顶部显示 buffer 标签页，类似浏览器的标签栏
(use-package centaur-tabs
  :demand                          ;; 启动时立即加载（不要延迟）
  :config
  (centaur-tabs-mode t)            ;; 开启 centaur-tabs
  :custom
  (centaur-tabs-set-icons t)       ;; 标签页前显示文件类型图标
  (centaur-tabs-style "wave")      ;; 标签页形状：wave（波浪形）
  :bind
  ("C-c t p" . centaur-tabs-backward)   ;; 切换到前一个标签页
  ("C-c t n" . centaur-tabs-forward))   ;; 切换到后一个标签页

;; ─── 透明度 ──────────────────────────────────────────────────────────
;; 设置 Emacs frame 的不透明度，100% 为完全不透明
(add-to-list 'default-frame-alist '(alpha-background . 100))

(provide 'init-ui)
;;; init-ui.el ends here
