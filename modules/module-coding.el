;;; module-coding.el --- Configurations for several programming language
;;
;; Author: Alessandro Meschi <alessandro.meschi@icloud.com>
;; Version: 1.0.0

;; This file is not part of GNU Emacs.

;;; Commentary:

;; This file configure programming language features

;;; License:

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:

;; General api list for emacs
(use-package dash
  :ensure t)

;; (E)LISP

;; Package lint
(use-package package-lint
  :ensure t)

;; Pretty print for lisp
(use-package ipretty
  :ensure t)

;; Completion
(use-package company
  :ensure t
  :hook (emacs-lisp-mode . (lambda () (add-to-list (make-local-variable 'company-backends) '(company-elisp)))))

;; JAVA
(use-package lsp-java
  :ensure t
  :requires (lsp-ui-flycheck lsp-ui-sideline)
  :hook
  (java-mode . (lambda () (add-to-list (make-local-variable 'company-backends) 'company-lsp)))
  (java-mode . lsp)
  (java-mode . flycheck-mode)
  (java-mode . (lambda () (lsp-ui-flycheck-enable t)))
  (java-mode . lsp-ui-sideline-mode)
  :config
  (setq lsp-java-save-action-organize-imports t))

;; SHELL
(use-package company-shell
  :ensure t
  :hook
  (sh-mode . (lambda () (add-to-list (make-local-variable 'company-backends) '(company-shell company-shell-env company-fish-shell)))))

(provide 'module-coding)
;;; module-coding.el ends here
