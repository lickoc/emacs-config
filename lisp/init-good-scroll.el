;;; init-good-scroll -*- lexical-binding : t -*-
;;; COmmentary:
;;; Code:

(use-package good-scroll
  :ensure t
  :if window-system
  :init (good-scroll-mode))

(provide 'init-good-scroll)
;;; init-good-scroll.el ends here
