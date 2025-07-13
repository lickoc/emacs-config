;;; init-theme.el --- load theme and custom file -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(use-package solo-jazz-theme ; github.com/cstby/solo-jazz-emacs-theme
	      :ensure t
	      :config
	      (load-theme 'solo-jazz t))

(use-package all-the-icons
	      :if (display-graphic-p))

(provide 'init-theme)
;;; init-theme.el ends here
