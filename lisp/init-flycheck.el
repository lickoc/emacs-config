;;; init-flycheck -*- lexical-binding : t -*-
;;; Commentary
;;; Code:

(use-package flycheck
  :ensure t
  :config
  (setq truncate-lines nil) ; 单行信息很长的情况下，自动换行
  :hook
  (prog-mode . flycheck-mode))

(provide 'init-flycheck)
