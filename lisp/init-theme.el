;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Emacs theme stylings  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Solarized settings
(setq solarized-use-variable-pitch nil)
(setq x-underline-at-descent-line t)
(setq solarized-scale-org-headlines nil)
(setq solarized-emphasize-indicators nil)
(setq solarized-high-contrast-mode-line t)

;; Load theme
(load-theme 'solarized-light t)

;; Linum customization
(set-face-attribute 'linum nil :inherit 'default :background "#eee8d5")
;; (set-face-attribute 'linum nil :inherit 'default)

;; Toggles between a dark theme and a light theme.
(defun toggle-bg ()
  "Toggles from dark to light background (and vice-versa)"
  (interactive)
  (if (eq (frame-parameter (next-frame) 'background-mode) 'dark)
      (progn
        ;; Light Mode
        (disable-theme 'solarized-dark)
        (load-theme 'solarized-light t)
        (set-face-attribute 'linum nil :inherit 'default :background "#eee8d5")
        (powerline-reset))
    ;; Dark Mode
    (disable-theme 'solarized-light)
    (load-theme 'solarized-dark t)
    (set-face-attribute 'linum nil :inherit 'default :background "#073642")
    (powerline-reset)))

;; Bind it to F5
(global-set-key (kbd "<f5>") 'toggle-bg)

;; Smart modeline :)
;; (sml/setup)

(require 'spaceline-config)
(spaceline-spacemacs-theme)
(setq powerline-default-separator 'slant);

(require 'diminish)

(eval-after-load "undo-tree" '(diminish 'undo-tree-mode))
(eval-after-load "git-gutter" '(diminish 'git-gutter-mode))
(eval-after-load "company" '(diminish 'company-mode))
(eval-after-load "projectile" '(diminish 'projectile-mode))
(eval-after-load "yasnippet" '(diminish 'yas-minor-mode))
(eval-after-load "flycheck" '(diminish 'flycheck-mode))
(eval-after-load "flyspell" '(diminish 'flyspell-mode))

(provide 'init-theme)
