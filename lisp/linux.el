;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Linux specific config ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Inherit path from shell
(exec-path-from-shell-initialize)

(setenv "GRADLE_OPTS" "-Dorg.gradle.native=false")

(set-face-attribute 'default nil :font "Hack" :width 'normal :height 105)

(provide 'linux)
