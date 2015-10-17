;;;;;;;;;;;;;;;;;;;;;;;;
;; Config for Clojure ;;
;;;;;;;;;;;;;;;;;;;;;;;;

(add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
(add-hook 'cider-mode-hook #'eldoc-mode)
(setq cider-auto-mode t)

(provide 'init-clojure)
