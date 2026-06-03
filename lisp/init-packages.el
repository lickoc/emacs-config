;;; init-packages.el --- 包管理（straight.el + use-package）
;; straight.el 是声明式包管理器，从 GitHub 源码直接安装包
;; use-package 提供声明式语法来按需加载和配置包

;; ─── 安装 straight.el ────────────────────────────────────────────────
;; 如果 ~/.emacs.d/straight/repos/straight.el/bootstrap.el 不存在（首次启动），
;; 就从 GitHub 自动下载 straight.el 的安装脚本并执行
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; ─── use-package ──────────────────────────────────────────────────────
;; use-package 通过 straight.el 安装（不从 ELPA 装）
(straight-use-package 'use-package)

;; 默认所有 use-package 声明走 straight.el 安装，不用每个包写 :straight t
(setq straight-use-package-by-default t)

(provide 'init-packages)
;;; init-packages.el ends here
