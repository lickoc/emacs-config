;;; init-prog.el --- 编程语言通用设置

;; ─── rainbow-delimiters：括号按层级上色 ──────────────────────────────
;; 嵌套的括号按深度依次显示为不同颜色（红→橙→黄→绿→蓝→紫→循环）
;; 写 Elisp / Clojure / Lisp 等大量括号的语言时非常有帮助
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))  ;; 所有编程 mode 下启用

;; ─── hl-todo：高亮代码中的标记关键字 ──────────────────────────────────
;; 将注释中的 TODO、FIXME、HACK、NOTE、XXX 等关键字高亮显示，方便快速定位
(use-package hl-todo
  :hook (prog-mode . hl-todo-mode))     ;; 所有编程 mode 下启用

(provide 'init-prog)
;;; init-prog.el ends here
