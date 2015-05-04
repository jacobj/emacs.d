;; Inherit path from shell
(exec-path-from-shell-initialize)

;; Use OS X lion fullscreen (or don't). My opinion of lion fullscreen
;; seems to change on a daily basis.
(setq ns-use-native-fullscreen t)

;; make the fringe (gutter) smaller the argument is a width in pixels
;; (the default is 8).
(if (fboundp 'fringe-mode) 
    (fringe-mode 8))

;; Menu Bar is somewhat nice to have in OS X.
;; (menu-bar-mode)

;; Font stuff
(set-face-attribute 'default nil :font "Meslo LG S-12")
(set-face-attribute 'variable-pitch nil :font "Helvetica Neue-13")
(setq org-src-fontify-natively t)

;; Org-Bullet GUI fancieness.
;; (require 'org-bullets)
;; (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(setq-default line-spacing 2)

(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'hyper)

;; Keybindings
(global-set-key [(hyper a)] 'mark-whole-buffer)
(global-set-key [(hyper v)] 'yank)
(global-set-key [(hyper c)] 'kill-ring-save)
(global-set-key [(hyper s)] 'save-buffer)
(global-set-key [(hyper l)] 'goto-line)
(global-set-key [(hyper w)]
                (lambda () (interactive) (delete-window)))
(global-set-key [(hyper z)] 'undo)
(global-set-key [(hyper q)] 'save-buffers-kill-terminal)
 
;; Scrolling (for default OS X emacs)
(setq scroll-step 1)
(setq scroll-conservatively 1000)
(setq mouse-wheel-scroll-amount '(1 ((shift). 1)))
(setq mouse-wheel-progressive-speed t)
(setq mouse-wheel-follow-mouse t)

(provide 'osx)
