;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Config for git related modes ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Git info in the fringe!
(require 'git-gutter-fringe)
(setq git-gutter-fr:side 'right-fringe)
(add-hook 'prog-mode-hook 'git-gutter-mode)

;; Magit status keybind
(global-set-key (kbd "C-x g") 'magit-status)

;; Github issue auto completion
;; (add-hook 'git-commit-mode-hook 'git-commit-insert-issue-mode)

(provide 'init-git)
