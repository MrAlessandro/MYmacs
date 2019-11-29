;;; module-company.el --- Code and word completion framework configuration
;;
;; Author: Alessandro Meschi <alessandro.meschi@icloud.com>
;; Version: 1.0.0

;; This file is not part of GNU Emacs.

;;; Commentary:

;; This file configure code completion framework

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

;; Use company
(use-package company
  :ensure t
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

;; Show documentation idle on company completion
(use-package company-quickhelp
  :ensure t
  :after company
  :diminish
  :config
  (company-quickhelp-mode 1))

;; Better sorting and filtering for company
(use-package company-prescient
  :ensure t
  :hook ((after-init . company-prescient-mode)))

(provide 'module-company)
;;; module-company.el ends here
