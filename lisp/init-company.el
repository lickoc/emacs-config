;;; init-company -*- lexical-binding: t -*-
;;; Commentary
;;; Code:

(use-package company
  :ensure t
  :init (global-company-mode)
  :config
  (setq company-minimum-prefix-length 2) ; 2个字符触发自动补全
  (setq company-tooltip-align-annotations t)
  (setq company-idle-delay 0.0)
  (setq company-show-numbers t) ; 给选项编号，使用M-1 等进行选择
  (setq company-selection-wrap-around t)
  (setq company-transformers '(company-sort-by-occurrence))) ; 根据选择的频率进行排序

(use-package company-box
  :ensure t
  :if window-system
  :hook (company-mode . company-box-mode))

(provide 'init-company)
