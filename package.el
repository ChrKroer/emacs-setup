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
     company-c-headers
     ecb
     helm
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



(provide 'prelude-packages)
;;; prelude-packages.el ends here
