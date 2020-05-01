(load-module "cpu")
(load-module "battery-portable")
(load-module "mem")

(setf stumpwm:*screen-mode-line-format*
      (list "%M | %C | %B |             "
	    '(:eval (stumpwm:run-shell-command "date" t))))
;; mode-line padding
(setf *mode-line-pad-x* 600
      *mode-line-pad-y* 2)

(setf *mode-line-border-color*      "#556b2f"
      *mode-line-background-color* "#000000"
      *mode-line-foreground-color* "#9acd32")
