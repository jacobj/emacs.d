;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Config for org-mode  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock) 
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-directory "~/Dropbox/Org")

;; Auto indentation in org-mode
(setq-default org-startup-indented t)

;; Spellchecking in org-mode
(add-hook 'org-mode-hook 'flyspell-mode)

;; Default export css
(setq org-export-html-style
      "<link rel=\"stylesheet\" type=\"text/css\" href=\"http://thomasf.github.io/solarized-css/solarized-light.min.css\" />")

(require 'deft)

;; Set Deft as the initial mode.
;; (when (locate-library "deft")
;;  (setq initial-major-mode 'deft))

(setq deft-extension "org")
(setq deft-directory "~/Dropbox/Org")
(setq deft-text-mode 'org-mode)
(setq deft-use-filename-as-title t)
(global-set-key [f8] 'deft)
(setq deft-strip-title t)

(provide 'init-org)
