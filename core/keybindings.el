;;============================================================
;;              Emacs Windows KeyBindings
;;============================================================
;; moving another window
(global-set-key [M-left] 'windmove-left)
(global-set-key [M-right] 'windmove-right)
(global-set-key [M-up] 'windmove-up)
(global-set-key [M-down] 'windmove-down)

;---------~----------~----------~---------~--------~---------
;                  Glbal Set Key
;---------~----------~----------~---------~--------~---------
(global-set-key [f1] 'woman)
(global-set-key [f2] 'rgrep)
(global-set-key [f5] 'compile)
(global-set-key [f6] 'goto-line)
(global-set-key [f10] 'ansi-term)

;;============================================================
;;                     Helm Plugins
;;============================================================
;;;;;;;;; Helm Gtags
(add-hook 'helm-gtags-mode-hook
          '(lambda ()
             (local-set-key (kbd "M-t") 'helm-gtags-pop-stack)
             (local-set-key (kbd "M-]") 'helm-gtags-find-tag)
             (local-set-key (kbd "M-[") 'helm-gtags-find-rtag)
             (local-set-key (kbd "M-.") 'helm-gtags-dwim)
             (local-set-key (kbd "M-,") 'helm-gtags-tags-in-this-function)
             (local-set-key (kbd "C-j") 'helm-gtags-select)
             (local-set-key (kbd "M-g M-p") 'helm-gtags-parse-file)))

;;;;;;;;;; Helm Cscope
(add-hook 'c-mode-hook 'helm-cscope-mode)
(add-hook 'c++-mode-hook 'helm-cscope-mode)

; Set key bindings
(add-hook 'helm-cscope-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-c .") 'helm-cscope-find-this-symbol)
             (local-set-key (kbd "C-c d") 'helm-cscope-find-global-definition)
             (local-set-key (kbd "C-c c") 'helm-cscope-find-called-function)
             (local-set-key (kbd "C-c p") 'helm-cscope-find-calling-this-function)
             (local-set-key (kbd "C-c s") 'helm-cscope-pop-mark)))

;;============================================================
;;                        Magit
;;============================================================
(global-set-key (kbd "C-x s") 'magit-blame)
(global-set-key (kbd "C-x l") 'magit-log-all)

;;;============================================================
;;;                   HighLight SymBol
;;;============================================================
(require 'highlight-symbol)
(global-set-key [f3] 'highlight-symbol-at-point)
(global-set-key [f4] 'highlight-symbol-next) 

;;;============================================================
;;;                 TAB Bar Ruler
;;;============================================================
(global-set-key (kbd "C-c t") 'tabbar-ruler-move)
;
;
;;;============================================================
;;;                    Plugins
;;;============================================================
; multiple cursors shortcuts
(require 'multiple-cursors)
(global-set-key (kbd "C-;") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
;
;; ecb-toggle activate
(global-set-key [f10] 'ecb-activate)
(global-set-key [f9] 'ecb-deactivate)

(provide 'keybindings)
