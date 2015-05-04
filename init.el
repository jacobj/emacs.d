;; +=============================================================+
;; | Jacob's (@j4cobj, @jacobj, jacob@jacobejenkins.com) init.el |
;; +=============================================================+

(require 'cl)

;; package.el
(require 'package)

;; Package repos
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("elpa" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/") t)

;; We want to use the stuff we install right?
(package-initialize)

(unless package-archive-contents (package-refresh-contents))

;;; On-demand installation of packages (by @purcell)
(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))
(require-package 'sml-modeline)
(require-package 'git-gutter-fringe)

;; Add some more stuff to the load path.
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; (require 'server)
;; (unless (server-running-p)
;;   (server-start))

;; Taken from better-defaults package
(ido-mode t)
(setq ido-enable-flex-matching t)

(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(require 'saveplace)
(setq-default save-place t)

(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(show-paren-mode 1)
(setq-default indent-tabs-mode nil)
(setq x-select-enable-clipboard t
      x-select-enable-primary t
      save-interprogram-paste-before-kill t
      apropos-do-all t
      mouse-yank-at-point t
      save-place-file (concat user-emacs-directory "places")
      backup-directory-alist `(("." . ,(concat user-emacs-directory
                                               "backups"))))
;; End better-defaults customizations

;; Arduino mode file recognition
(setq auto-mode-alist (cons '("\\.\\(pde\\|ino\\)$" . arduino-mode) auto-mode-alist))
(autoload 'arduino-mode "arduino-mode" "Arduino editing mode." t)

;; Smex settings
(setq smex-save-file (concat user-emacs-directory ".smex-items"))
(smex-initialize)
;;(global-set-key (kbd "M-x") 'smex)
;;(global-set-key (kbd "M-X") 'smex-major-mode-commands)

(global-set-key (kbd "M-x") 'helm-M-x)

;; Use Emacs terminfo, not system terminfo
(set-terminal-coding-system 'utf-8-unix)
(setq system-uses-terminfo nil)

;; Org Mode stuff
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock) 
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; mu4e
;; (require 'mu4e)

;; ;; default
;; (setq mu4e-maildir (expand-file-name "~/Maildir"))

;; (setq mu4e-drafts-folder "/[Gmail].Drafts")
;; (setq mu4e-sent-folder   "/[Gmail].Sent Mail")
;; (setq mu4e-trash-folder  "/[Gmail].Trash")

;; ;; don't save message to Sent Messages, GMail/IMAP will take care of this
;; (setq mu4e-sent-messages-behavior 'delete)

;; ;; setup some handy shortcuts
;; (setq mu4e-maildir-shortcuts
;;       '(("/INBOX"             . ?i)
;;         ("/[Gmail].Sent Mail" . ?s)
;;         ("/[Gmail].Trash"     . ?t)))

;; ;; allow for updating mail using 'U' in the main view:
;; (setq mu4e-get-mail-command "offlineimap")

;; ;; something about ourselves
;; ;; I don't use a signature...
;; (setq
;;  user-mail-address "jacobkablam@gmail.com"
;;  user-full-name  "Jacob Jenkins"
;;  ;; message-signature
;;  ;;  (concat
;;  ;;    "Foo X. Bar\n"
;;  ;;    "http://www.example.com\n")
;;  )

;; (require 'mu4e-contrib) 
;; (setq mu4e-html2text-command 'mu4e-shr2text)

;; Set to the location of your Org files on your local system
(setq org-directory "~/Dropbox/Org")

;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/Dropbox/Org/flagged.org")

;; Set to ~/Dropbox/MobileOrg.
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")

;; List the files to be synced to MobileOrg
(setq org-mobile-files (quote ("todo.org")))

;; Auto indentation in org-mode
(setq-default org-startup-indented t)

;; Flyspell in org-mode
(add-hook 'org-mode-hook 'flyspell-mode)

;; Fuck the terminal bell so godamn much.
(setq ring-bell-function 'ignore)

;; Turn on evil globally but disable it for a few modes
(require 'evil)
(evil-mode)
(evil-set-initial-state 'iESS 'emacs)

;; Pretty parenthesis, usefull for Elisp, Clojure, Scheme, etc.
(rainbow-delimiters-mode)
;; (global-rainbow-delimiters-mode)

;; Turn off line wrapping
(set-default 'truncate-lines t)

;; Turn off visual bell in GUI emacs.
(setq visible-bell 0)

(require 'deft)

(setq deft-extension "org")
(setq deft-directory "~/Dropbox/Org")
(setq deft-text-mode 'org-mode)
(setq deft-use-filename-as-title t)
(global-set-key [f8] 'deft)
(setq deft-strip-title t)
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")

;; ===== ESS =====
;; For statistics and data science things with R
(setq ess-ask-for-ess-directory nil)
(setq ess-local-process-name "R")
(setq ansi-color-for-comint-mode 'filter)
(setq comint-prompt-read-only nil)
(setq comint-scroll-to-bottom-on-input t)
(setq comint-scroll-to-bottom-on-output t)
(setq comint-move-point-for-output t)

;; ~~~~~ ESS Shift + Enter = Magic! ~~~~~
(defun my-ess-start-R ()
  (interactive)
  (if (not (member "*R*" (mapcar (function buffer-name) (buffer-list))))
      (progn
        (delete-other-windows)
        (setq w1 (selected-window))
        (setq w1name (buffer-name))
        (setq w2 (split-window w1))
        (R)
        (set-window-buffer w2 "*R*")
        (set-window-buffer w1 w1name))))

(defun my-ess-eval ()
  (my-ess-start-R)
  (interactive)
  (if (and transient-mark-mode mark-active)
	  (call-interactively 'ess-eval-region)
    (call-interactively 'ess-eval-line-and-step)))

(add-hook 'ess-mode-hook
          '(lambda()
             (local-set-key [(shift return)] 'my-ess-eval)))

(add-hook 'inferior-ess-mode-hook
          '(lambda()
             (local-set-key [C-up] 'comint-previous-input)
             (local-set-key [C-down] 'comint-next-input)))

(require 'ess-site)

(setenv "NODE_NO_READLINE" "1")

;; Clean eshell prompt
(setq eshell-prompt-function
      (lambda nil
        (concat
         (eshell/pwd)
         " $ ")))

;; Fix utf8 in multi-term
(add-hook 'term-exec-hook
          (function
           (lambda ()
             (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))))

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; Show *scratch* at startup instead
(setq inhibit-startup-screen t)

;; Tab settings
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

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

;; Stop Evil from being evil and messing with my cursor
(setq evil-default-cursor t)

;; Stop the blinking cursor.
(setq blink-cursor-mode nil)

;; Clean up old backups.
(setq delete-old-versions t)

;; Change the fill column to 78.
(setq-default fill-column 80)

;; Nice scrolling
;; (setq scroll-margin 0
;;       scroll-conservatively 100000
;;       scroll-preserve-screen-position 1)

;; more useful frame title, that show either a file or a
;; buffer name (if the buffer isn't visiting a file)
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

(require 'linum)

;; Turn Linum mode for all programming modes.
(add-hook 'prog-mode-hook 'linum-mode)

;; Nicely format linum with pretty spacing.
(setq linum-format " %4d ")

;; Highlight the current line everywhere.
(global-hl-line-mode)

;; Solarized settings.
(setq solarized-use-variable-pitch nil)
(setq x-underline-at-descent-line t)
(setq solarized-scale-org-headlines nil)
(setq solarized-emphasize-indicators nil)

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
        (set-face-attribute 'linum nil :inherit 'default :background "#eee8d5"))
    ;; Dark Mode
    (disable-theme 'solarized-light)
    (load-theme 'solarized-dark t)
    (set-face-attribute 'linum nil :inherit 'default :background "#073642")))

;; Bind it to F5
(global-set-key (kbd "<f5>") 'toggle-bg)

;; Toggle Font Lock
(global-set-key (kbd "<f6>") 'font-lock-mode)

;; Toggle Fullscreen
(global-set-key (kbd "<f9>") 'toggle-frame-fullscreen)

;; Auto Complete config.
;; (require 'auto-complete-config)
;; (ac-config-default)
;; (setq ac-ignore-case nil)
;; (add-to-list 'ac-modes 'emacs-lisp-mode)
;; (add-to-list 'ac-modes 'java-mode)
;; (add-to-list 'ac-modes 'c++-mode)
;; (add-to-list 'ac-modes 'c-mode)

;; Company Mode
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(add-to-list 'company-backends 'company-tern)

;; Yasnippet
(yas-global-mode 1)

;; Set a seperate file for customize interface changes.
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Set Deft as the initial mode.
(when (locate-library "deft")
  (setq initial-major-mode 'deft))

;; Load path from system shell when using cocoa emacs
(when (memq window-system '(mac ns))
  (require 'osx))

;; AucTeX wizardry
;; PDFs are sacred, fuck divs.
(setq TeX-PDF-mode t)

;; Change font size
(when window-system
  (global-set-key (kbd "C-+") 'text-scale-increase)
  (global-set-key (kbd "C--") 'text-scale-decrease))

(setq-default c-basic-offset 4)

;; Rename and delete current buffer. (stolen from prelude @bbatsov)
(defun delete-current-buffer-file ()
  "Removes file connected to current buffer and kills buffer."
  (interactive)
  (let ((filename (buffer-file-name))
        (buffer (current-buffer))
        (name (buffer-name)))
    (if (not (and filename (file-exists-p filename)))
        (ido-kill-buffer)
      (when (yes-or-no-p "Are you sure you want to remove this file? ")
        (delete-file filename)
        (kill-buffer buffer)
        (message "File '%s' successfully removed" filename)))))

(defun rename-current-buffer-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully renamed to '%s'"
                   name (file-name-nondirectory new-name)))))))

(global-set-key (kbd "C-x C-r") 'rename-current-buffer-file)

;; PRETTY LAMBDAS
(global-prettify-symbols-mode +1)

(put 'upcase-region 'disabled nil)

(require 'ansi-color)
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(setq comint-scroll-to-bottom-on-input t)  ; always insert at the bottom
(setq comint-scroll-to-bottom-on-output nil) ; always add output at the bottom
(setq comint-scroll-show-maximum-output t)

(add-hook 'asm-mode-set-comment-hook
          '(lambda ()
             (setq asm-comment-char ?#)))

;; Use the greatness that is flycheck in all programming modes.
(add-hook 'prog-mode-hook 'flycheck-mode)

(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

;; js2-mode hook
(add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode))
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))

;; Web-mode stuff
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . web-mode))

;; Git info in the fringe!
(require 'git-gutter-fringe)
(setq git-gutter-fr:side 'right-fringe)
(add-hook 'prog-mode-hook 'git-gutter-mode)

;; Turn off Yasnippet in term modes.
(add-hook 'term-mode-hook (lambda()
                            (setq yas-dont-activate t)))

;; Projectile Stuff
(projectile-global-mode)

;; sh-mode hook for Zsh
(add-to-list 'auto-mode-alist '("\\.zsh\\'" . sh-mode))
(add-hook 'sh-mode-hook
          (lambda ()
            (if (string-match "\\.zsh$" buffer-file-name)
                (sh-set-shell "zsh"))))

;; JSX in Web Mode
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))

(setq js-indent-level 2)

;; web-beautify hooks.
(eval-after-load 'js2-mode
  '(add-hook 'js2-mode-hook
             (lambda ()
               (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))

;; Or if you're using 'js-mode' (a.k.a 'javascript-mode')
(eval-after-load 'js
  '(add-hook 'js-mode-hook
             (lambda ()
               (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))

(eval-after-load 'sgml-mode
  '(add-hook 'html-mode-hook
             (lambda ()
               (add-hook 'before-save-hook 'web-beautify-html-buffer t t))))

(eval-after-load 'json-mode
  '(add-hook 'json-mode-hook
             (lambda ()
               (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))

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

;; Nice helm, mate.
(add-to-list 'display-buffer-alist
                    `(,(rx bos "*helm" (* not-newline) "*" eos)
                         (display-buffer-in-side-window)
                         (inhibit-same-window . t)
                         (window-height . 0.4)))

;; Smart modeline :)
(sml/setup)
