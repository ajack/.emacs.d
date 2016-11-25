
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

;; configuration file for jack-mode

;; Jack Wang

(provide 'jack-mode)
(require 'cl)

(define-minor-mode jack-mode
  "Set of keybindings that will hopefully overwrite all other keybindings"
  :global t
  :lighter " jack"
  :keymap (let ((map (make-sparse-keymap)))
            (define-key map (kbd "C-,") 'scroll-down-command)
            (define-key map (kbd "C-.") 'scroll-up-command)
            (define-key map (kbd "M-C-,") 'scroll-other-window-down)
            (define-key map (kbd "M-C-.") 'scroll-other-window)
            (define-key map (kbd "C--") 'negative-argument)
            (define-key map (kbd "C-v") 'jack-move-to-beginning-or-end-of-buffer)
            (define-key map (kbd "C-a") 'jack-fidget-around-beginning-of-line)
            map))


(defun jack-move-to-beginning-or-end-of-buffer (&optional arg)
  "Will move to the beginning of current buffer if supplied with negative argument,
otherwise will move to end."
  (interactive "P")
  (progn
    (push-mark)
    (if (= (prefix-numeric-value arg) -1)
      (goto-char(point-min))
      (goto-char(point-max)))))

(defun jack-fidget-around-beginning-of-line ()
  "Moves cursor back to indentation, or beginning of the current line if already at
indentation. If cursor is before indentation then move to indentation"
  (interactive)
  (let ((p (point)))
      (back-to-indentation)
      (if (= (point) p)
          (move-beginning-of-line 1))))



(provide 'jack-mode)
