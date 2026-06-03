;;; init-completion.el --- 补全框架（vertico + consult）

;; ─── vertico：补全菜单 ──────────────────────────────────────────────
;; 在 minibuffer 中显示垂直补全列表，轻量且干净，替代默认的 *Completions* 窗口
(use-package vertico
  :custom
  (vertico-cycle t)                     ;; 滚动到列表末尾后回到开头（循环滚动）
  :init
  (vertico-mode 1))                     ;; 全局启用 vertico

;; ─── orderless：模糊匹配引擎 ──────────────────────────────────────────
;; 补全时输入空格分隔的关键字，每个关键字单独模糊匹配，组合出最终结果
(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides nil))

;; ─── marginalia：补全信息增强（注释掉，排除启动报错） ──────────
;; (use-package marginalia
;;   :init
;;   (marginalia-mode 1))

;; ─── consult：增强命令 ───────────────────────────────────────────────
;; consult 已在 init.el 末尾手动加载，这里只绑定快捷键
;; （绕开 use-package 宏展开阶段的 native-comp bug）

;; consult 绑定快捷键（用 use-package 自带的 bind-key，绕过 commandp 验证）
(add-hook 'emacs-startup-hook
          (lambda ()
            (when (featurep 'consult)
              (bind-key "M-x" 'consult-M-x)
              (bind-key "C-x b" 'consult-buffer)
              (bind-key "C-x C-f" 'consult-find-file)
              (bind-key "M-y" 'consult-yank-pop)
              (bind-key "C-s" 'consult-line)
              (bind-key "C-r" 'consult-line)
              (bind-key "M-g g" 'consult-goto-line)
              (bind-key "C-c a p" 'consult-ripgrep)
              (bind-key "C-c a f" 'consult-find)
              (bind-key "C-c a l" 'consult-locate)
              (bind-key "<f1> f" 'consult-describe-function)
              (bind-key "<f1> v" 'consult-describe-variable)
              (bind-key "<f1> s" 'consult-info))))

(provide 'init-completion)
;;; init-completion.el ends here
