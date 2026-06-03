;;; init-misc.el --- 杂项包配置（magit / dired / eshell / vterm 等）
;; 这里放不属于其他模块的包，需要用时取消注释即可

;; ─── magit：Git 界面 ──────────────────────────────────────────────────
;; Emacs 最强的 Git 客户端，装上基本告别命令行 git
(use-package magit
  :bind
  ("C-c m s" . magit-status)              ;; 打开 Magit 状态界面
  ("C-c m p" . magit-push-current)         ;; 推送当前分支
  ("C-c m c" . magit-branch-checkout)      ;; 切换分支（可输入或选择）
  ("C-c m b" . magit-branch-and-checkout)  ;; 创建新分支并切换过去
  ("C-c m f" . magit-fetch)                ;; 拉取远程更新
  ("C-c m m" . magit-merge)                ;; 合并分支
  ("C-c m r" . magit-rebase))              ;; rebase 当前分支

;; ─── vterm：终端模拟器 ───────────────────────────────────────────────
;; 需要编译本地模块（安装 cmake 和 libvterm）
;; (use-package vterm
;;   :bind (("C-c t" . vterm)))

;; ─── dired 增强 ───────────────────────────────────────────────────────
;; (use-package dired
;;   :config
;;   (setq dired-recursive-copies 'always       ;; 复制目录时自动递归复制
;;         dired-recursive-deletes 'always      ;; 删除目录时自动递归删除
;;         dired-dwim-target t))                ;; 复制/移动文件时推测目标目录

;; ─── projectile：项目文件管理 ───────────────────────────────────────
;; 快速切换项目内的文件、在项目内搜索、执行项目命令（编译/测试/运行）
(use-package projectile
  :custom
  (projectile-enable-caching t)     ;; 缓存项目文件列表，加速切换
  :init
  (projectile-mode +1)              ;; 全局启用 projectile
  :config
  ;; 配置忽略的目录（不索引这些目录，加快搜索速度）
  (setq projectile-globally-ignored-directories
        (append '(".git" ".svn" ".tox" ".venv" ".gradle"
                  ".meghanada" ".clangd" "eln-cache"
                  "out" "repl" "target" "venv")
                projectile-globally-ignored-directories))
  ;; 配置忽略的文件类型
  (setq projectile-globally-ignored-files
        (append '(".DS_Store" "*.gz" "*.pyc" "*.jar"
                  "*.tar.gz" "*.tgz" "*.zip" "*.eln" "*.elc")
                projectile-globally-ignored-files))
  ;; 绑定快捷键前缀：C-c p 为 projectile 命令入口
  (define-key projectile-mode-map (kbd "C-c p") #'projectile-command-map)
  ;; 注册 hugo 项目类型：检测到 config.toml 或 archetypes 目录就认为是 hugo 项目
  (projectile-register-project-type 'hugo '("config.toml" "archetypes" "content")
    :project-file "config.toml"
    :compile "hugo"
    :test "open http://localhost:1313/"
    :run "hugo server -D --disableFastRender --navigateToChanged"))

;; ─── ace-window：快速跳转到分屏 ───────────────────────────────────────
;; 按 M-o 后每个分屏上显示一个字母，按字母跳转到对应分屏
(use-package ace-window
  :bind ("M-o" . ace-window))            ;; M-o + 字母 跳转到对应分屏

;; ─── avy：快速跳转到屏幕任意位置 ────────────────────────────────────
;; C-c j + 输入字符 → 跳转到该字符位置
;; C-c w + 输入单词前缀 → 跳转到该单词
(use-package avy
  :bind (("C-c j" . avy-goto-char)
         ("C-c w" . avy-goto-word-1)))

(provide 'init-misc)
;;; init-misc.el ends here
