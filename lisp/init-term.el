;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Config for Emacs terms ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Use Emacs terminfo, not system terminfo
(set-terminal-coding-system 'utf-8-unix)
(setq system-uses-terminfo nil)

(setq tramp-terminal-type "dumb")

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

;; Glorious ansi colors for terminals
(require 'ansi-color)
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; Function like a normal terminal
(setq comint-scroll-to-bottom-on-input t)
(setq comint-scroll-to-bottom-on-output nil)
(setq comint-scroll-show-maximum-output t)

;; Turn off Yasnippet in term modes
(add-hook 'term-mode-hook (lambda()
                            (setq yas-dont-activate t)))

;; Make node.js repl usable in terms
(setenv "NODE_NO_READLINE" "1")

;; Colorful compilation buffer
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

(provide 'init-term)
