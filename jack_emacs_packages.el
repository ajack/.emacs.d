;; This package installs all the neccesary packages
;; Jack Wang

(require 'cl)
(require 'package)

(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
			 ("melpa" . "http://melpa.org/packages/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))

(package-initialize)

(defvar required-packages
  '(
    avy
    smartparens
    smex
    ace-window
    anzu
    fancy-narrow
    flyspell
    yasnippet
    smex
    solarized-theme
    smart-mode-line
    rainbow-delimiters
    helm
    which-key
    aggressive-indent
    org
    which-key
    multiple-cursors
    )
  "A list of required packages. Will be either installed or updated at launch")

;; check if all packages are installed
(defun packages-installed-p (required-packages)
  "Predicate function, takes a list of packages. 
   Checks if all packages in a list are installed/updated"
  (if (null required-packages)
      t ; true
    (and (package-installed-p (car required-packages))
         (packages-installed-p (cdr required-packages)))))

(defun install-packages (required-packages)
  (dolist (package required-packages)
    (unless (package-installed-p package)
      (package-install package))))
 
(unless (packages-installed-p required-packages)
  ;; check for new packages by refreshing package database
  (message "%s" "Emacs is now refreshing package database")
  (package-refresh-contents)
  (message "%s" "Done refreshing!")
  ;; installs/updates all missing packages
  (install-packages required-packages))
  
