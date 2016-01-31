;; Projectile Stuff
(projectile-global-mode)

(add-hook 'find-file-hook
          (lambda ()
            (when (file-remote-p default-directory)
              (setq-local projectile-mode-line "Projectile"))))

(provide 'init-projectile)
