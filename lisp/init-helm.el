;;;;;;;;;;;;;;;;;;;;;;
;; Config for helm ;;;
;;;;;;;;;;;;;;;;;;;;;;

(require 'helm)

;; Use helm M-x
(global-set-key (kbd "M-x") 'helm-M-x)

;; Header line is useless.
(setq helm-display-header-line nil)

;; Make helm take up 30% of frame always.
(helm-autoresize-mode 1)
(setq helm-autoresize-max-height 30)
(setq helm-autoresize-min-height 30)

;; Helm projectile
(require 'helm-projectile)
(helm-projectile-on)

(provide 'init-helm)
