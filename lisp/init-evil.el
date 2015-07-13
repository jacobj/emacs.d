;;;;;;;;;;;;;;;;;;;;;;k;;;
;; Config for evil-mode ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Turn on evil globally but disable it for a few modes
(require 'evil)
(evil-mode)
(evil-set-initial-state 'iESS 'emacs)

;; Stop Evil from being evil and messing with my cursor
(setq evil-default-cursor t)

;; Quick dired jump.
(define-key evil-normal-state-map (kbd "-") 'dired-jump)

(provide 'init-evil)
