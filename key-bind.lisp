(in-package :stumpwm)

(set-prefix-key (kbd "C-t"))

(define-key *root-map* (kbd "C-s") "exec st")
(define-key *root-map* (kbd "C-q") "exec qutebrowser")

(define-key *root-map* (kbd "C-h") "move-window left")
(define-key *root-map* (kbd "C-l") "move-window right")
(define-key *root-map* (kbd "C-k") "move-window up")
(define-key *root-map* (kbd "C-j") "move-window down")

(define-key *root-map* (kbd "h") "move-focus left")
(define-key *root-map* (kbd "l") "move-focus right")
(define-key *root-map* (kbd "k") "move-focus up")
(define-key *root-map* (kbd "j") "move-focus down")

(defvar *describe-map*
  (let ((m (stumpwm:make-sparse-keymap)))
    (stumpwm:define-key m (stumpwm:kbd "k") "describe-key")
    (stumpwm:define-key m (stumpwm:kbd "f") "describe-function")
    (stumpwm:define-key m (stumpwm:kbd "c") "describe-command")
    (stumpwm:define-key m (stumpwm:kbd "v") "describe-variable")
    m ; This one is important
    ))
(stumpwm:define-key stumpwm:*root-map* (stumpwm:kbd ".") '*describe-map*)
