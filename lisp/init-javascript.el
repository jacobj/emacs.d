;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Config for Javascript ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Hook for js2-mode.
(add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode))

;; Start tern when using js2.
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))

;; Set indent level to 4 spaces.
(setq js-indent-level 4)

(provide 'init-javascript)
