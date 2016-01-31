;;;;;;;;;;;;;;;;;;;;;;;;
;;  General settings  ;;
;;;;;;;;;;;;;;;;;;;;;;;;

;; Turn off menu bar and scrollbar
(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(require 'saveplace)
(setq-default save-place t)

(setq create-lockfiles nil)

(show-paren-mode 1)
(setq-default indent-tabs-mode nil)
(setq x-select-enable-clipboard t
      x-select-enable-primary t
      save-interprogram-paste-before-kill t
      apropos-do-all t
      mouse-yank-at-point t
      save-place-file (concat user-emacs-directory "places")
      backup-directory-alist `(("." . ,(concat user-emacs-directory "backups"))))

(require 'ido)
;; Ido everywhere it can be used.
(ido-mode t)
(ido-ubiquitous-mode)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-auto-merge-work-directories-length nil
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-use-virtual-buffers t
      ido-handle-duplicate-virtual-buffers 2
      ido-max-prospects 10)

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; Show *scratch* at startup instead
(setq inhibit-startup-screen t)

;; Turn off line wrapping
(set-default 'truncate-lines t)

;; Turn off the terminal bell everywhere.
(setq ring-bell-function 'ignore)
(setq visible-bell nil)

;; Tab settings
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)

;; Disable shit I don't like
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'erase-buffer 'disabled nil)
(put 'scroll-left 'disabled nil)

;; Change font size
(when window-system
  (global-set-key (kbd "C-+") 'text-scale-increase)
  (global-set-key (kbd "C--") 'text-scale-decrease))

;; Stop the blinking cursor.
(setq blink-cursor-mode nil)

;; Clean up old backups.
(setq delete-old-versions t)

;; Change the fill column to 78.
(setq-default fill-column 80)

;; more useful frame title, that show either a file or a
;; buffer name (if the buffer isn't visiting a file)
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

(global-hl-line-mode t)

;; Toggle Font Lock
(global-set-key (kbd "<f6>") 'font-lock-mode)

;; Toggle Fullscreen
(global-set-key (kbd "<f9>") 'toggle-frame-fullscreen)

(provide 'init-general)
