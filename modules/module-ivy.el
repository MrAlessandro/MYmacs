;;; module-ivy.el --- Configurations for IVY
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

;; Enable ivy
(use-package ivy
  :ensure t
  :diminish
  :hook ((after-init . ivy-mode))
  :config
  (setq ivy-display-style 'fancy
        ivy-use-virtual-buffers t
        enable-recursive-minibuffers t
        ivy-use-selectable-prompt t)
  (setq ivy-on-del-error-function nil)
  (setq swiper-action-recenter t)
  (setq ivy-wrap t)
  (setq ivy-extra-directories ())
  (setq ivy-initial-inputs-alist nil))

;; Better sorting and filtering for IVY
(use-package ivy-prescient
  :ensure t
  :diminish
  :hook ((ivy-mode . ivy-prescient-mode)))

;; Counsel
(use-package counsel
  :ensure t
  :diminish
  :hook ((ivy-mode . counsel-mode))
  :bind (("M-x" . counsel-M-x)
         ("C-s" . swiper)
         ("C-x C-f" . counsel-find-file))
  :config
  (setq counsel-find-file-ignore-regexp "^\\."))

;; More friendly interface for ivy
(use-package ivy-rich
  :ensure t
  :hook ((ivy-mode . ivy-rich-mode))
  :config
  (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line))

;; Better 'M-x' visualization with amx
(use-package amx
  :ensure t
  :init
  (setq amx-history-length 20))

;; Ivy integration for Projectile
;; (use-package counsel-projectile
;;   :ensure t
;;   :diminish
;;   :config
;;   (counsel-projectile-mode 1))

(provide 'module-ivy)
;;; module-ivy.el ends here
