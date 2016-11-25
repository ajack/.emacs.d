
;; (package-initialize)



;; Hello World")

(require 'calendar)
(defvar package-download-directory "~/.emacs.d/jack_emacs_packages.el")
(defvar package-setup-directory "~/.emacs.d/jack_emacs_package_load.el")
(defvar jack-mode-directory "~/.emacs.d/jack_mode.el")


(load jack-mode-directory)
(load package-download-directory)
(load package-setup-directory)


(setq initial-major-mode 'lisp-mode)

(setq initial-scratch-message (format "\

;;      ██╗ █████╗  ██████╗██╗  ██╗██╗███████╗
;;      ██║██╔══██╗██╔════╝██║ ██╔╝╚═╝██╔════╝
;;      ██║███████║██║     █████╔╝    ███████╗
;; ██   ██║██╔══██║██║     ██╔═██╗    ╚════██║
;; ╚█████╔╝██║  ██║╚██████╗██║  ██╗   ███████║
;;  ╚════╝ ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝   ╚══════╝
                                            
;; ███████╗███╗   ███╗ █████╗  ██████╗███████╗ 
;; ██╔════╝████╗ ████║██╔══██╗██╔════╝██╔════╝ 
;; █████╗  ██╔████╔██║███████║██║     ███████╗ 
;; ██╔══╝  ██║╚██╔╝██║██╔══██║██║     ╚════██║ 
;; ███████╗██║ ╚═╝ ██║██║  ██║╚██████╗███████║ 
;; ╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝╚══════╝                                
;; %s
" (calendar-date-string (calendar-current-date) nil)))


;; Sets the default indent style for c-like programming languages
(setq c-default-style '((java-mode . "bsd")
                        (awk-mode . "awk")
                        (other . "bsd")))

;; Sets the default indent spacing for c-like programming languages
(setq c-basic-offset 4)

;; changes how scrolling works, only scrolls down by one line at a time
(setq scroll-step 1
      scroll-conservatively 10000)

(setq-default indent-tabs-mode nil) ; stop using tabs to indent
;(setq tab-always-indent 'complete)

;(setq-default tab-width 4)

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; disable startup screen
(setq inhibit-startup-screen t)



(menu-bar-mode -1) ;; no menubar
(tool-bar-mode -1) ;; no toolbar
;; (scroll-bar-mode -1) ;; disable scroll bars
;; (set-frame-font "Anonymous Pro-9")
(setq-default truncate-lines 1) ;; no wordwrap


(setq user-full-name "Jack Wang")
(put 'narrow-to-region 'disabled nil)

;; enable narrowing commands
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-defun 'disabled nil)



(load-theme 'solarized-light t)
;;(add-hook 'text-mode-hook 'jack-mode)

(jack-mode)


(toggle-debug-on-error t)


