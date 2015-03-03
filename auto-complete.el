;; This file contains all code relating to autocompletion.

(require 'auto-complete)

(global-auto-complete-mode t)

; change the below to do custom ac-modes
;(setq ac-modes '(c++-mode sql-mode))



  ;; Package: smartparens
(require 'smartparens-config)
(show-smartparens-global-mode +1)
(smartparens-global-mode 1)

;; when you press RET, the curly braces automatically
;; add another newline
(sp-with-modes '(c-mode c++-mode)
  (sp-local-pair "{" nil :post-handlers '(("||\n[i]" "RET")))
  (sp-local-pair "/*" "*/" :post-handlers '((" | " "SPC")
                                            ("* ||\n[i]" "RET"))))
