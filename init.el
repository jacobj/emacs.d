;; +=============================================================+
;; | Jacob's (@j4cobj, @jacobj, jacob@jacobejenkins.com) init.el |
;; +=============================================================+

;; I don't exactly remember what needs this.
(require 'cl)

;; package.el
(require 'package)

;; Package repos
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("elpa" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/") t)

;; We want to use the stuff we install right?
(package-initialize)

(unless package-archive-contents (package-refresh-contents))

;;; On-demand installation of packages (by @purcell)
(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION. If
NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version) t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)

;; Grab packages
(require-package 'ag)
(require-package 'angular-snippets)
(require-package 'arduino-mode)
(require-package 'cider)
(require-package 'clojure-mode)
(require-package 'company)
(require-package 'company-jedi)
(require-package 'company-tern)
(require-package 'deft)
(require-package 'diminish)
(require-package 'dockerfile-mode)
(require-package 'ein)
(require-package 'ess)
(require-package 'evil)
(require-package 'flycheck)
(require-package 'flycheck-clojure)
(require-package 'gist)
(require-package 'git-gutter-fringe)
(require-package 'git-commit-insert-issue)
(require-package 'helm)
(require-package 'helm-ag)
(require-package 'helm-themes)
(require-package 'helm-projectile)
(require-package 'ido-ubiquitous)
(require-package 'jedi)
(require-package 'js2-mode)
(require-package 'js2-refactor)
(require-package 'linum-relative)
(require-package 'magit)
(require-package 'markdown-mode)
(require-package 'multi-term)
(require-package 'paradox)
(require-package 'projectile)
(require-package 'python-mode)
(require-package 'rainbow-delimiters)
(require-package 'scala-mode2)
(require-package 'smart-mode-line)
(require-package 'smex)
(require-package 'sml-modeline)
(require-package 'solarized-theme)
(require-package 'spaceline)
(require-package 'sx)
(require-package 'tide)
(require-package 'tern)
(require-package 'web-beautify)
(require-package 'web-mode)
(require-package 'writeroom-mode)
(require-package 'yaml-mode)
(require-package 'yasnippet)

;; Require exec-path-from-shell if on OS X.
(when (memq window-system '(mac ns))
  (require-package 'exec-path-from-shell))

;; Load path
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Mode inits
(require 'init-arduino)
(require 'init-asm)
(require 'init-clojure)
(require 'init-company)
(require 'init-docker)
(require 'init-ess)
(require 'init-evil)
(require 'init-flycheck)
(require 'init-flyspell)
(require 'init-general)
(require 'init-git)
(require 'init-helm)
(require 'init-javascript)
(require 'init-latex)
(require 'init-linum)
(require 'init-org)
(require 'init-projectile)
(require 'init-scala)
(require 'init-sh)
(require 'init-term)
(require 'init-theme)
(require 'init-typescript)
(require 'init-utils)
(require 'init-web)
(require 'init-yasnippet)

;; OS specific GUI configs.
(when (display-graphic-p)
  (if (string-equal system-type "gnu/linux")
      (require 'linux)
    (require 'osx)))

;; Set a seperate file for customize interface changes.
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
