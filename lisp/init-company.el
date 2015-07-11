;;;;;;;;;;;;;;;;;;;;;;;;
;; Config for company ;;
;;;;;;;;;;;;;;;;;;;;;;;;

;; Company Mode
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(add-to-list 'company-backends 'company-tern)

(provide 'init-company)
