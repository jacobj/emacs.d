;;;;;;;;;;;;;;;;;;;;;;;;
;; Config for company ;;
;;;;;;;;;;;;;;;;;;;;;;;;

;; Company Mode
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(add-to-list 'company-backends 'company-tern)

(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'my/python-mode-hook)

(provide 'init-company)
