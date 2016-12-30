
;;(load "~/.emacs.d/jack_emacs_packages.el")

(require 'cl)
(require 'dash)
(require 'jack-mode)



(require 'helm)
(require 'helm-config)

(helm-mode 1)
(setq helm-M-x-fuzzy-match t) ;; enable fuzzy matching for helm-M-x

(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match t) ;; fuzzy matching for helm-mini

(define-key jack-mode-map (kbd "C-c h") 'helm-command-prefix)
(define-key jack-mode-map [remap apropos-command] 'helm-apropos)
(define-key jack-mode-map [remap execute-extended-command] 'helm-M-x)
(define-key jack-mode-map [remap find-file] 'helm-find-files)
(define-key jack-mode-map [remap switch-to-buffer] 'helm-mini)




(defvar jack-main-row-keys '(?a ?o ?e ?u ?i ?d ?h ?t ?n ?s))

(require 'ace-window)
(setq aw-keys jack-main-row-keys)
(define-key jack-mode-map [remap other-window] 'ace-select-window)


(require 'avy)
(setq avy-style 'at-full)
(setq avy-keys jack-main-row-keys)
(define-key jack-mode-map (kbd "C-c C-g") 'avy-goto-line)
(define-key jack-mode-map (kbd "C-c C-c") 'avy-goto-char)


(require 'smartparens)
(require 'smartparens-config)

(add-hook 'prog-mode-hook 'smartparens-mode)
(add-hook 'prog-mode-hook 'show-smartparens-mode)

;; stops the "'" character from auto-pairing in lisp modes
(sp-local-pair '(emacs-lisp-mode lisp-mode) "'" nil :unless '(sp-in-code-p))

;; automatically adds a newline and enclosing curly brackets when an opening curly bracket is put
(sp-local-pair '(c-mode c++-mode java-mode) "{" nil :post-handlers '((:add jack-handle-braces-insert "RET")))


(define-key jack-mode-map (kbd "C-M-f") 'sp-forward-sexp)
(define-key jack-mode-map (kbd "C-M-b") 'sp-backward-sexp)
(define-key jack-mode-map (kbd "C-M-u") 'sp-up-sexp)
(define-key jack-mode-map (kbd "C-M-d") 'sp-down-sexp)
(define-key jack-mode-map (kbd "C-M-n") 'sp-next-sexp)
(define-key jack-mode-map (kbd "C-M-p") 'sp-previous-sexp)


(define-key jack-mode-map (kbd "C-M-s s") 'sp-forward-slurp-sexp)
(define-key jack-mode-map (kbd "C-M-s b") 'sp-forward-barf-sexp)

(define-key jack-mode-map (kbd "C-M-l") 'sp-splice-sexp)
(define-key jack-mode-map (kbd "C-M-a a") 'sp-splice-sexp-killing-around)
(define-key jack-mode-map (kbd "C-M-a f") 'sp-splice-sexp-killing-forward)
(define-key jack-mode-map (kbd "C-M-a b") 'sp-splice-sexp-killing-backward)

(define-key jack-mode-map (kbd "C-M-k") 'sp-kill-sexp)



(defun jack-handle-braces-insert (&rest _ignored)
  "open a new brace for cc mode"
  (interactive)
  (newline)
  (forward-line -1)
  (c-indent-line-or-region)
  (forward-line 1)
  (c-indent-line-or-region)
  (forward-line -1)
  (move-end-of-line 1)
  (newline)
  (c-indent-line-or-region))


(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)


(require 'fancy-narrow)
(fancy-narrow-mode 1)

(require 'anzu)
(global-anzu-mode 1)


(require 'flyspell)
(add-hook 'text-mode-hook
          (lambda () (flyspell-mode 1)))



(require 'yasnippet)
;; activates yasnippets
(yas-global-mode 1)
;; allows for stacked snippets/expansions (snippets insied snippets)
(setq yas-triggers-in-field t)


(require 'which-key)
(which-key-mode) ;; activate mode


;; hippie expansion stuff
;; ripped off prelude.  works better than default.  maybe i'll customize this later
(setq hippie-expand-try-functions-list '(try-expand-dabbrev
                                         try-expand-dabbrev-all-buffers
                                         try-expand-dabbrev-from-kill
                                         try-complete-file-name-partially
                                         try-complete-file-name
                                         try-expand-all-abbrevs
                                         try-expand-list
                                         try-expand-line
                                         try-complete-lisp-symbol-partially
                                         try-complete-lisp-symbol))

(define-key jack-mode-map (kbd "M-/") 'hippie-expand)


(require 'aggressive-indent)
(add-hook 'emacs-lisp-mode-hook 'aggressive-indent-mode)
(add-hook 'css-mode-hook 'aggressive-indent-mode)



(require 'org)
(define-key jack-mode-map "\C-cl" 'org-store-link)
(define-key jack-mode-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;;(require 'multiple-cursors)
;;(define-key jack-mode-map "C->" 'mc/mark-next-like-this)
;;(define-key jack-mode-map "C-<" 'mc/mark-previous-like-this)
;;(define-key jack-mode-map "C-c d" 'mc/mark-all-in-region)



(require 'flyspell)
(mapc (lambda (mode-hook) (add-hook mode-hook (lambda () (flyspell-prog-mode))))
      '(c-mode-common-hook emacs-lisp-mode-hook java-mode-hook python-mode-hook))
