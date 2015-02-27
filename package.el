(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

(require 'cl)

(defconst used-packages
   '(               
     ac-clang
     auctex
     auctex-latexmk
     auto-complete
     company
     ecb
     solarized-theme
     ))
  ;; '(anzu
  ;;   company
  ;;   duplicate-thing
  ;;   ggtags
  ;;   helm
  ;;   helm-gtags
  ;;   helm-projectile
  ;;   helm-swoop
  ;;   function-args
  ;;   clean-aindent-mode
  ;;   comment-dwim-2
  ;;   dtrt-indent
  ;;   ws-butler
  ;;   iedit
  ;;   yasnippet
  ;;   smartparens
  ;;   projectile
  ;;   volatile-highlights
  ;;   undo-tree
  ;;   zygospore))

(defun install-packages ()
  "Install all required packages."
  (interactive)
  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (package used-packages)
    (unless (package-installed-p package)
      (package-install package))))

(install-packages)

;; (defvar prelude-packages
;;   '(               ac-clang
;; 		   auctex
;; 		   auctex-latexmk
;; 		   auto-complete
;; 		   company
;; 		   ecb
;; 		   solarized-theme
;; 		   )
;;   "A list of packages to ensure are installed at launch.")

;; (defun prelude-packages-installed-p ()
;;   (loop for p in prelude-packages
;;         when (not (package-installed-p p)) do (return nil)
;;         finally (return t)))

;; (unless (prelude-packages-installed-p)
;;   ;; check for new packages (package versions)
;;   (message "%s" "Emacs Prelude is now refreshing its package database...")
;;   (package-refresh-contents)
;;   (message "%s" " done.")
;;   ;; install the missing packages
;;   (dolist (p prelude-packages)
;;     (when (not (package-installed-p p))
;;       (package-install p))))

(provide 'prelude-packages)
;;; prelude-packages.el ends here
