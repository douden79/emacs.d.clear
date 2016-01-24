;;-------------------------~-----------------------~--------------------------------
;;;	knuth's configuration entry point.
;;--------------------------------~-----------------------~-------------------------
(when (version< emacs-version "24.5")
	(error "knuth requires at least GNU Emacs 24.5"))
(defvar knuth-dir (file-name-directory load-file-name)
	"The root dir of the Emacs knuth distribution.")
(defvar knuth-core-dir (expand-file-name "core" knuth-dir)
  "The home of knuth's core functionality.")
(defvar knuth-modules-dir (expand-file-name  "modules" knuth-dir)
  "This directory houses all of the built-in knuth modules.")
(defvar knuth-personal-dir (expand-file-name "personal" knuth-dir)
  "This directory is for your personal configuration.
Users of Emacs knuth are encouraged to keep their personal configuration
changes in this directory.  All Emacs Lisp files there are loaded automatically
by knuth.")
(defvar knuth-savefile-dir (expand-file-name "savefile" knuth-dir)
  "This folder stores all the automatically generated save/history-files.")
(defvar knuth-modules-file (expand-file-name "knuth-modules.el" knuth-dir)
  "This files contains a list of modules that will be loaded by knuth.")


;;-------------------------~-------------------------~----------------------------
;;                           emacs module loading
;;-----------------------------~----------------------------~---------------------
;; add knuth's directories to Emacs's `load-path'
(add-to-list 'load-path knuth-core-dir)
(add-to-list 'load-path knuth-modules-dir)
;; the core stuff
(require 'packages)
(require 'ui)
(require 'editor)
(require 'core)
;(require 'knuth-mode)
(require 'keybindings)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(current-language-environment "Korean")
 '(custom-safe-themes
   (quote
	("885ef8634f55df1fa067838330e3aa24d97be9b48c30eadd533fde4972543b55" default)))
 '(ecb-layout-name "left-symboldef")
 '(ecb-options-version "2.40")
 '(ecb-windows-width 0.3.5)
 '(prefer-coding-system (quote utf-8))
 '(size-indication-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Monaco" :foundry "apple" :full normal :weight normal :height 92 :width normal :full normal :full normal :full normal :full normal :full normal :full normal)))))
