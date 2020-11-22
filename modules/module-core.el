;;; module-core.el --- Basic configurations and settings
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

;; Personal info
(setq user-full-name "Alessandro Meschi"
      user-mail-address "alessandro.meschi@icloud.com")

;; Reduce the frequency of garbage collection by making it happen on
;; each 50MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold 50000000)

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; Revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)

;; Kill current buffer with 'C-x k'
(global-set-key (kbd "C-x k") 'kill-this-buffer)

;; Encoding
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;; Enable history saving at eymacs's startup
(add-hook 'after-init-hook 'savehist-mode)

;; Save position in file
(save-place-mode 1)

;; Keep emacs directory clean
(use-package no-littering
  :ensure t)

;; Link clipborad and emacs kill-ring
(setq select-enable-clipboard t)

;; Keep dired in one buffer
(put 'dired-find-alternate-file 'disabled nil)

;; Always delete and copy recursively in dired
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

;; Display key option
(use-package which-key
  :ensure t
  :config
  (which-key-mode +1))

;; MacOS itelian keyboard setup
(when (string-equal system-type "darwin")
  (global-set-key (kbd "s-è") "[")
  (global-set-key (kbd "s-+") "]")
  (global-set-key (kbd "s-é") "{")
  (global-set-key (kbd "s-*") "}")
  (setq mac-option-modifier nil
        mac-command-modifier 'meta
        mac-function-modifier 'control
        select-enable-clipboard t))

;; Mouse integration
(require 'mouse) ;; needed for iterm2 compatibility
(xterm-mouse-mode t)
(global-set-key [mouse-4] '(lambda ()
    (interactive)
    (scroll-down 1)))
(global-set-key [mouse-5] '(lambda ()
    (interactive)
    (scroll-up 1)))
(setq mouse-sel-mode t)
(defun track-mouse (e))

;; Better sorting and filtering
(use-package prescient
  :ensure t
  :hook ((after-init . prescient-persist-mode))
  :init
  (setq prescient-filter-method '(literal regexp initialism fuzzy)))

(provide 'module-core)
;;; module-core.el ends here
