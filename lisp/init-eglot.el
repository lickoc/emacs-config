;;; init-eglot -*- lexical-binding : t -*-
;;; Commentary:
;;; Code:

(use-package eglot
  :hook (prog-mode . eglot-ensure)
  :bind (("C-c e f" . eglot-format)))


(provide 'init-eglot)
;;; init-eglot.el ends here
