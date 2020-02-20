(in-package :stumpwm)

(run-shell-command "compton")
(run-shell-command "nitrogen --set-auto ~/pictures/civ.png")
(run-shell-command "pamixer --set-volume 15")

(run-commands "toggle-gaps"
	      "which-key-mode")

(defcommand colon1 (&optional (initial "")) (:rest)
  (let ((cmd (read-one-line (current-screen) ": " :initial-input initial)))
    (when cmd
      (eval-command cmd t))))

(setf *message-window-gravity*              :top-left
      *input-window-gravity*               :top-left
      *window-border-style*                :none
      *message-window-padding*             0
      *maxsize-border-width*               0
      *normal-border-width*                0
      stumpwm::*float-window-border*       2
      stumpwm::*float-window-title-height* 5)

(set-fg-color     "#ffffff")
(set-bg-color     "#000080")
(set-border-color "#d9d9d9")

(load "~/.stumpwm.d/key-bind.lisp")
(load "~/.stumpwm.d/mode-line.lisp")

(set-module-dir
 (pathname-as-directory (concat (getenv "HOME") "/.stumpwm.d/modules")))

(load-module "swm-gaps")
(load-module "winner-mode")

(setf swm-gaps:*inner-gaps-size* 2
      swm-gaps:*outer-gaps-size* 3)
(run-commands "toggle-gaps")

(add-hook *post-command-hook* (lambda (command)
                                (when (member command winner-mode:*default-commands*)
                                  (winner-mode:dump-group-to-file))))

(setf stumpwm:*top-level-error-action* :break)
