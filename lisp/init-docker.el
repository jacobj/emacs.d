;;;;;;;;;;;;;;;;;;;;;;;
;; Config for docker ;;
;;;;;;;;;;;;;;;;;;;;;;;

(autoload 'dockerfile-mode "dockerfile-mode" nil t)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

(provide 'init-docker)
