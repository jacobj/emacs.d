;;;;;;;;;;;;;;;;;;;;;;;;;
;; Config for asm-mode ;;
;;;;;;;;;;;;;;;;;;;;;;;;;

;; Hash comments for MIPS asm.
(add-hook 'asm-mode-set-comment-hook
          '(lambda ()
             (setq asm-comment-char ?#)))

(provide 'init-asm)
