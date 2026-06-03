;;; init-keybinds.el --- 全局快捷键绑定 & 按键提示

;; ─── which-key：按键提示 ────────────────────────────────────────────
;; 按下 C-x、C-c 等前缀键后，自动弹出可选的下级快捷键列表
;; 妈妈再也不用担心我记不住快捷键了
(use-package which-key
  :custom
  (which-key-show-early-on-C-h t)   ;; 按下 C-h 后立即显示 which-key，不用等超时
  :init
  (which-key-mode 1))                ;; 全局启用

;; ─── 自定义快捷键 ────────────────────────────────────────────────────
;; （后续可以在这里添加你自己的快捷键绑定）

(provide 'init-keybinds)
;;; init-keybinds.el ends here
