;;-----------------------~------------------------~---------------------
;;; knuth-packages.el --- Emacs knuth : default package selection.
;;----------------------~-------------------------~---------------------
(require 'cl)
(require 'package)

;;---------------~------------------~----------------------~-----------
;; stable package archives
;;-------------------------~-------------------------~-----------------
(setq package-archives '( ("gnu" . "http://elpa.gnu.org/packages/")
						  ("melpa-stable" . "http://stable.melpa.org/packages/")
						  ("melpa" . "http://melpa.org/packages/")))
       
;; set package-user-dir to be relative to Knuth install path
(setq package-user-dir (expand-file-name "melpa" knuth-dir))
(package-initialize)

;;-----------------~-----------------~--------------------------------
;; Package List
;;----------------------~---------------------~-----------------------
(defvar knuth-packages
  '( yasnippet
     solarized-theme
     auto-complete
     auto-complete-clang-async
     smart-tabs-mode
     magit
     projectile
     expand-region
     smex
     highlight-symbol
     hl-todo
     helm-gtags
     helm-cscope
     powerline
     org
     flycheck
     flycheck-tip
     auto-complete-clang-async
     auto-complete-clang
     smartparens
     smart-compile
     tabbar-ruler
     ac-clang
     org-bullets
     dracula-theme
     xml-rpc
     metaweblog
     org2blog
     htmlize
     obsidian-theme
     emacs-eclim
     hlinum
     flatui-theme
     autopair
     multiple-cursors
     company
     company-c-headers
	 ecb
    )
  "A list of packages to ensure are installed at launch.")

;;; requirement elpy packages.
;; sudo apt-get install pip
(defun knuth-packages-installed-p ()
  "Check if all packages in `knuth-packages' are installed."
  (every #'package-installed-p knuth-packages))

(defun knuth-require-package (package)
  "Install PACKAGE unless already installed."
  (unless (memq package knuth-packages)
    (add-to-list 'knuth-packages package))
  (unless (package-installed-p package)
    (package-install package)))

(defun knuth-require-packages (packages)
  "Ensure PACKAGES are installed.
Missing packages are installed automatically."
  (mapc #'knuth-require-package packages))

(define-obsolete-function-alias 'knuth-ensure-module-deps 'knuth-require-packages)

(defun knuth-install-packages ()
  "Install all packages listed in `knuth-packages'."
  (unless (knuth-packages-installed-p)
    ;; check for new packages (package versions)
    (message "%s" "Emacs Knuth is now refreshing its package database...")
    (package-refresh-contents)
    (message "%s" " done.")
    ;; install the missing packages
    (knuth-require-packages knuth-packages)))

;; run package installation
(knuth-install-packages)

(defun knuth-list-foreign-packages ()
  "Browse third-party packages not bundled with Knuth.

Behaves similarly to `package-list-packages', but shows only the packages that
are installed and are not in `knuth-packages'.  Useful for
removing unwanted packages."
  (interactive)
  (package-show-package-list
   (set-difference package-activated-list knuth-packages)))

(provide 'packages)
;; Local Variables:
;; byte-compile-warnings: (not cl-functions)
;; End:

;;; packages.el ends here

