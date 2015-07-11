;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Config for arduino-mode ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Arduino mode file recognition
(setq auto-mode-alist (cons '("\\.\\(pde\\|ino\\)$" . arduino-mode) auto-mode-alist))
(autoload 'arduino-mode "arduino-mode" "Arduino editing mode." t)

(provide 'init-arduino)
