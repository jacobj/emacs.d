(require 'linum)
(require 'linum-relative)
(linum-relative-toggle)

;; Turn Linum mode for all programming modes.
(add-hook 'prog-mode-hook 'linum-mode)

;; Nicely format linum with pretty spacing.
(setq linum-format " %3s ")
(setq linum-relative-format " %3s ")

(global-set-key (kbd "<f4>") 'linum-relative-toggle)

(provide 'init-linum)
