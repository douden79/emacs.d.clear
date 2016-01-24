;;============================================================
;;                         Coding
;;============================================================
;; default tab
(setq-default indent-tabs-mode t)
(setq-default tab-width 4)

(add-hook 'c-mode-common-hook 'hs-minor-mode)

;;;;
;;;; Linux C mode
;;;;
(defun linux-c-mode ()
"C mode with adjusted defaults for use with the Linux kernel."
(interactive)
(c-mode)
(c-set-style "K&R")
(setq tab-width 8)
(setq indent-tabs-mode t)
(setq c-basic-offset 8))

(add-to-list 'auto-mode-alist '("\.c$" . linux-c-mode))
;;;;
;;;; source folding
;;;;
(defun hs-enable-and-toggle ()
  (interactive)
  (hs-minor-mode 1)
  (hs-toggle-hiding))
(defun hs-enable-and-hideshow-all (&optional arg)
  "Hide all blocks. If prefix argument is given, show all blocks."
  (interactive "P")
  (hs-minor-mode 1)
  (if arg
      (hs-show-all)
	(hs-hide-all)))

(global-set-key (kbd "C-b") 'hs-enable-and-toggle)
(global-set-key (kbd "C-s") 'hs-enable-and-hideshow-all)

;;;;
;;;; smart tab
;;;;
;; smart tab behavior - indent or complete
(setq tab-always-indent 'complete)

(smart-tabs-advice python-indent-line-1 python-indent)
(add-hook 'python-mode-hook
		  (lambda ()
			(setq indent-tabs-mode t)
			(setq tab-width (default-value 'tab-width))))

(smart-tabs-advice py-indent-line py-indent-offset)
(smart-tabs-advice py-newline-and-indent py-indent-offset)
(smart-tabs-advice py-indent-region py-indent-offset)

;; gdb windows option.
(setq gdb-many-windows t)

;; helm-grep-mode is true when rgrep search command.
(setq helm-grep-mode t)

;;;;
;;;; Handling Uncommon File Extensions
;;;;

(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'auto-mode-alist '("\\.sh\\'" . python-mode))

;;;;
;;;; Source Navigator cedet
;;;;

(require 'cc-mode)
(require 'semantic)

;; enabled features will depend on semantic-mode 1
(semantic-mode 1)	
(setq cedet-global-command "global")

;; enables global support for semanticdb
(global-semanticdb-minor-mode 1)	
(global-semantic-mru-bookmark-mode 1)
(global-semantic-highlight-func-mode 1)
;;(global-semantic-stickyfunc-mode 1)
(global-semantic-decoration-mode 1)
(global-semantic-idle-scheduler-mode 1)
(global-semantic-idle-local-symbol-highlight-mode 1)
(global-semantic-idle-completions-mode 1)
(global-semantic-idle-summary-mode 1)
(global-semantic-show-unmatched-syntax-mode 1)
(global-semantic-show-parser-state-mode 1)
(global-semantic-highlight-edits-mode 1)

;; To enable more advanced functionality for name completion, etc.,
;; You can load the semantic/ia with following command:
(require 'semantic/ia)

;; If you're using GCC for programming in C & C++, then Semantic can
;; automatically find directory,
;;where system include files are stored.
(require 'semantic/bovine/gcc)

;; Enable case-insensitive searching
(set-default 'semantic-case-fold t)

;;============================================================
;;                          UI
;;============================================================
;;;; Editor's Color changing
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

(set-face-foreground 'ac-candidate-face "blue4")
(set-face-background 'ac-candidate-face "DodgerBlue1")
(set-face-foreground 'ac-selection-face "white")
(set-face-background 'ac-selection-face "steelblue")
(set-face-foreground 'ac-completion-face "white")
(set-face-background 'ac-completion-face "black")

;;;;
;;;; Org Mode
;;;;
;; fill paragraph
(setq org-list-allow-alphabetical t)
(require 'org2blog-autoloads)
(require 'netrc)

(setq wp-cpbotha (netrc-machine (netrc-parse "~/.netrc") "wp-cpbotha" t))
(setq wp-vxlabs (netrc-machine (netrc-parse "~/.netrc") "wp-vxlabs" t))

;;;; org mode bullets mode
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;;;; powerline
(require 'powerline)
(powerline-default-theme)
;;============================================================
;;                         EDIT
;;============================================================
;; Coding System Read File encoding.
(modify-coding-system-alist 'file "\\.c\\'" 'utf-8)
(modify-coding-system-alist 'file "\\.py\\'" 'utf-8)
(modify-coding-system-alist 'file "\\.S\\'" 'utf-8)
(modify-coding-system-alist 'file "\\.h\\'" 'utf-8)
(modify-coding-system-alist 'file "\\.txt\\'" 'utf-8)
(modify-coding-system-alist 'file "\\.cpp\\'" 'utf-8)
(modify-coding-system-alist 'file "\\.txt\\'" 'utf-8)
(modify-coding-system-alist 'file "\\.md\\'" 'utf-8)
(modify-coding-system-alist 'file "\\.org\\'" 'utf-8)
(modify-coding-system-alist 'file "\\.tv\\'" 'utf-8)

;; Loding Korean Font Set
(set-fontset-font "fontset-default" '(#x1100 . #xffdc)
                   '("Gulim" . "iso10646-1"))
(set-fontset-font "fontset-default" '(#xe0bc . #xf66e)
                   '("Gulim" . "iso10646-1"))

(setq face-font-rescale-alist
       '((".*hiragino.*" . 0.9)
	 (".*Gulim.*" . 0.9)))
(set-language-environment "Korean")

(setq coding-system-for-read 'utf-8)

;;;;
;;;; Cedet semanticdb
;;;;
;; if you wnat to enable support for gnu global
(setq cedet-global-command "global")
;;(when (cedet-gnu-global-version-check t)) ;; is not active
(semanticdb-enable-gnu-global-databases 'c-mode t)
(semanticdb-enable-gnu-global-databases 'c++-mode t)
(semanticdb-enable-gnu-global-databases 'python-mode t)
(setq-default semantic-symref-tool "global")

;;;;
;;;; TAGS Table on linux kernel ( ~/linux_kernel/linux-3.12.20 )
;;;;
;;(setq tags-table-list '("/home/knuth/linux_kernel/linux-3.12.20/TAGS"))
(setq tags-table-list '("/home/knuth/Work/DRV/broadcom_7362/BcmLinuxDVB/linux-4.2.1/TAGS"))
;(setq tags-table-list '("/home/knuth/ORG/BcmLinuxDVB/linux-4.2.1"))
;(setq tags-table-list '("/home/knuth/enigma2.pli.bsp"))

;;;;
;;;; Helm Gtags Settings
;;;;
(require 'helm-config)
(require 'helm-gtags)

;; Enable helm-gtags-mode
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)
(add-hook 'php-mode-hook 'helm-gtags-mode)
(add-hook 'python-mode-hook 'helm-gtags-mode)

;; ac-clang
;(require 'ac-clang)

;(when (ac-clang-initialize)
;  (add-hook 'c-mode-common-hook '(lambda ()
;								   (setq ac-clang-cflags CFLAGS)
;								   (ac-clang-activate-after-modify)))
  
;; helm gtags customize
(setq helm-gtags-path-style 'relative)
(setq helm-gtags-ignore-case t)
(setq helm-gtags-auto-update t)

;;;;
;;;; setup compile package
;;;;
(require 'compile)
(setq compilation-disable-input nil)
(setq compilation-scroll-output t)
(setq mode-compile-always-save-buffer-p t)

;;;;
;;;; ECB 
;;;;
(setq ecb-version-check nil)  ; to prevent ecb failing to start up
(setq-default ecb-tip-of-the-day nil)

;;;;
;;;; smex 
;;;;
;; like ido frequently used commands.
(autoload 'smex "smex"
  "Smex is a M-x enhancement for Emacs, it provides a convenient interface to
your recently and most frequently used commands.")

(global-set-key (kbd "M-x") 'smex)

;;;;
;;;; global highlight line
;;;;
;; highlight the current line
(global-hl-line-mode +1)
;;(set-face-background 'hl-line "#4169E1")
(set-face-background 'hl-line "#000094")
(set-face-foreground 'highlight nil)

;;;;
;;;; Tabbar Ruler
;;;;
(require 'tabbar-ruler)
(setq tabbar-ruler-global-tabbar t) ; If you want tabbar
(setq tabbar-ruler-global-ruler t) ; if you want a global ruler
;;(setq tabbar-ruler-popup-menu t) ; If you want a popup menu.
;;(setq tabbar-ruler-popup-toolbar t) ; If you want a popup toolbar
;;(setq tabbar-ruler-popup-scrollbar t) ; If you want to only show the

(global-set-key (kbd "C-c t") 'tabbar-ruler-move)

;;;;
;;;; Backup Files
;;;;
;; backup files not make.
(setq make-backup-files nil)

;;;;
;;;; Autopair
;;;;
(require 'autopair)

;;;;
;;;; Global Key Binding
;;;;
(global-set-key [f9] 'compile)
(global-set-key [f7] 'gdb-next)
(global-set-key [f8] 'gdb-step)

;;;;
;;;; Company-mode Testing preference
;;;;

(provide 'editor)
