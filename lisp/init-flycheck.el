;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Config for Flycheck  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Flycheck for Clojure
(eval-after-load 'flycheck '(flycheck-clojure-setup))

;; Use the greatness that is flycheck in all programming modes.
(add-hook 'prog-mode-hook 'flycheck-mode)

;; Disable warnings for checks in emacs.
(with-eval-after-load 'flycheck
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))

;; Custom fringe indicator for Flycheck (from Spacemacs)
(define-fringe-bitmap 'my-flycheck-fringe-indicator
  (vector #b00000000
          #b00000000
          #b00000000
          #b00000000
          #b00000000
          #b00000000
          #b00000000
          #b00011100
          #b00111110
          #b00111110
          #b00111110
          #b00011100
          #b00000000
          #b00000000
          #b00000000
          #b00000000
          #b01111111))

(flycheck-define-error-level 'error
  :overlay-category 'flycheck-error-overlay
  :fringe-bitmap 'my-flycheck-fringe-indicator
  :fringe-face 'flycheck-fringe-error)

(flycheck-define-error-level 'warning
  :overlay-category 'flycheck-warning-overlay
  :fringe-bitmap 'my-flycheck-fringe-indicator
  :fringe-face 'flycheck-fringe-warning)

(flycheck-define-error-level 'info
  :overlay-category 'flycheck-info-overlay
  :fringe-bitmap 'my-flycheck-fringe-indicator
  :fringe-face 'flycheck-fringe-info)

(provide 'init-flycheck)
