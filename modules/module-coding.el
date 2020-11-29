;;; module-coding.el --- Configurations for several programming language
;; Copyright (C) 2020 Alessandro Meschi

;; Author: Alessandro Meschi <alessandro.meschi@icloud.com>
;; Version: 1.0.0

;; This file is not part of GNU Emacs.

;;; Commentary:

;; This file configure repositories and packages managment

;;; License:

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:

;; PHP support
(use-package php-mode
  :ensure t
  :mode
  ("\\.php\\'" . php-mode))

;; YAML support
(use-package yaml-mode
  :ensure t
  :mode ("\\.ya?ml\\'" . yaml-mode))

;; Typescript support
(use-package typescript-mode
  :ensure t
  :mode
  ("\\.ts\\'" . typescript-mode))

;; Web development support
;; (use-package web-mode
;;   :ensure t
;;   :mode
;;   ("\\.html?\\'" . web-mode))

;; Dockerfile support
(use-package dockerfile-mode
  :ensure t
  :mode "Dockerfile\\(?:\\..*\\)?\\'")

;; JSON files support
(use-package json-mode
  :ensure t
  :mode "\\.json\\'"
  :mode "\\.jsonld\\'")

;; YAML support
(use-package yaml-mode
  :ensure t
  :mode "\\.\\(e?ya?\\|ra\\)ml\\'")

;; Syntax checking
(use-package flycheck
  :ensure t
  :diminish
  :hook ((prog-mode . flycheck-mode))
  :config
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
  (setq flycheck-indication-mode 'right-margin))

(eval-after-load "flycheck"
  '(add-hook 'flycheck-mode-hook 'flycheck-indicator-mode))

;; Completion
(use-package company
  :ensure t
  :hook ((emacs-lisp-mode . (lambda () (add-to-list (make-local-variable 'company-backends) '(company-elisp)))))
  :config
  ;; Global
  (setq company-idle-delay 0.5
        company-minimum-prefix-length 3
        company-show-numbers nil
        company-tooltip-limit 20)
  ;; Default backends
  (setq company-backends '((company-files)))
  ;; Activating globally
  (global-company-mode t))

;; PHP completion
(use-package company-php
  :ensure t
  :defer
  :after company)

;; Better sorting and filtering for company
(use-package company-prescient
  :ensure t
  :after prescient
  :hook ((company-mode . company-prescient-mode)))

;; Show documentation idle on company completion
(use-package company-quickhelp
  :ensure t
  :after company
  :diminish
  :config
  (company-quickhelp-mode 1))

;; Pretty print for lisp
(use-package ipretty
  :ensure t)

;; Indentation
;; (use-package parinfer
;;   :ensure t
;;   :bind (("C-," . parinfer-toggle-mode))
;;   :hook ((prog-mode . parinfer-mode))
;;   :init
;;   (setq parinfer-extensions '(defaults        ; should be included.
;;                                pretty-parens  ; different paren styles for different modes.
;;                                paredit        ; Introduce some paredit commands.
;;                                smart-tab      ; C-b & C-f jump positions and smart shift with tab & S-tab.
;;                                smart-yank)))  ; Yank behavior depend on mode.

(use-package aggressive-indent
  :ensure t
  :hook ((prog-mode . aggressive-indent-mode)))

;; Indentation guides
(use-package indent-guide
  :ensure t
  :hook ((prog-mode . indent-guide-mode)))

;; JAVA
;; (use-package lsp-java
;;   :ensure t
;;   :requires (lsp-ui-flycheck lsp-ui-sideline)
;;   :hook
;;   (java-mode . (lambda () (add-to-list (make-local-variable 'company-backends) 'company-lsp)))
;;   (java-mode . lsp)
;;   (java-mode . flycheck-mode)
;;   (java-mode . (lambda () (lsp-ui-flycheck-enable t)))
;;   (java-mode . lsp-ui-sideline-mode)
;;   :config
;;   (setq lsp-java-save-action-organize-imports t))

;; Shell scripting
;; (use-package company-shell
;;   :ensure t
;;   :hook
;;   (sh-mode . (lambda () (add-to-list (make-local-variable 'company-backends) '(company-shell company-shell-env company-fish-shell)))))

(provide 'module-coding)
;;; module-coding.el ends here
