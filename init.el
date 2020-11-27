;;; init.el --- Alesssandro's Emacs configuration
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

;; Print loading message
(message "Loading MYmacs configuration...")

;; This makes it so that the file that is produced from tangling this file uses lexical scoping.
(setq-default lexical-binding t)

;; Always load newest byte code
(setq load-prefer-newer t)

;; Omit deprecation warnings
(setq byte-compile-warnings '(not obsolete))

;; Define local directories
(defvar emacs-home-dir (file-name-directory load-file-name)
  "The root dir of the Emacs distribution.")
(defvar modules-dir (expand-file-name  "modules" emacs-home-dir)
  "The directory of all modules.")

;; Create the modules directory if not exists
(unless (file-exists-p modules-dir)
  (make-directory modules-dir))

;; Create etc directory if not exists
(unless (file-exists-p (concat emacs-home-dir "etc"))
  (make-directory (concat emacs-home-dir "etc")))

;; Create etc/packages directory if not exists
(unless (file-exists-p (concat emacs-home-dir "etc/packages"))
  (make-directory (concat emacs-home-dir "etc/packages")))

;; Set packages directory
(setq package-user-dir (concat emacs-home-dir "etc/packages"))

;; Add modules directory to load-path
(add-to-list 'load-path modules-dir)

;; Loading modules
(require 'module-packages)
(require 'module-core)
(require 'module-ivy)
(require 'module-editing)
;;(require 'module-company)
;;(require 'module-lsp)
(require 'module-coding)
(require 'module-interface)

;; Stop geerating custom code at the end of init.el
(setq custom-file (concat emacs-home-dir "etc/custom.el"))

;; Load custom file
(when (file-exists-p custom-file)
  (load custom-file))

(provide 'init)
;;; init.el ends here
