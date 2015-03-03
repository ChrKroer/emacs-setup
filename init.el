(setq backup-directory-alist '(("." . ".~")))

(defun iwb ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))





;;(auto-fill-mode -1)
;;(remove-hook 'text-mode-hook #'turn-on-auto-fill)

;; code that enables modularization below
(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory)
         user-emacs-directory)
        ((boundp 'user-init-directory)
         user-init-directory)
        (t "~/.emacs.d/")))


(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))


;; load package stuff first, as it sets certain initializations needed for below .el files
(load-user-file "package.el")


(load-user-file "auto-complete.el")
(load-user-file "c_code.el")
(load-user-file "general_code.el")
(load-user-file "helm.el")
(load-user-file "tex.el")
(load-user-file "ui.el")





;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(custom-safe-themes
;;    (quote
;;     ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
;;  '(ecb-layout-window-sizes
;;    (quote
;;     (("left8"
;;       (ecb-directories-buffer-name 0.20817843866171004 . 0.29292929292929293)
;;       (ecb-sources-buffer-name 0.20817843866171004 . 0.24242424242424243)
;;       (ecb-methods-buffer-name 0.20817843866171004 . 0.29292929292929293)
;;       (ecb-history-buffer-name 0.20817843866171004 . 0.16161616161616163)))))
;;  '(ecb-options-version "2.40")
;;  '(package-selected-packages
;;    (quote
;;     (helm company-c-headers company ac-clang auctex-latexmk auctex auto-complete ecb solarized-theme))))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(ecb-layout-window-sizes
   (quote
    (("left8"
      (ecb-directories-buffer-name 0.20817843866171004 . 0.29292929292929293)
      (ecb-sources-buffer-name 0.20817843866171004 . 0.24242424242424243)
      (ecb-methods-buffer-name 0.20817843866171004 . 0.29292929292929293)
      (ecb-history-buffer-name 0.20817843866171004 . 0.16161616161616163)))))
 '(ecb-options-version "2.40")
 '(package-selected-packages (quote (smartparens helm-gtags ecb solarized-theme)))
 '(safe-local-variable-values
   (quote
    ((gdb-command-name . "gdb -d /Users/ckroer/Documents/research/equilibrium_computation/mirror_prox/libdub -i=mi local/solve")
     (company-clang-arguments "-I/Users/ckroer/Documents/research/equilibrium_computation/mirror_prox/libdub/include" "/Users/ckroer/Documents/research/equilibrium_computation/mirror_prox/libdub/math/include")
     (gdb . "gdb -d /Users/ckroer/Documents/research/equilibrium_computation/mirror_prox/libdub -i=mi local/solve")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
