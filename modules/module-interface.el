;;; module-interface.el --- Interface configurations
;;
;; Author: Alessandro Meschi <alessandro.meschi@icloud.com>
;; Version: 1.0.0

;; This file is not part of GNU Emacs.

;;; Commentary:

;; This file configure the emacs' interface

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

;; Disable toolbar if enabled
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

;; Disable scroll bar
(when (fboundp 'set-scroll-bar-mode)
  (set-scroll-bar-mode nil))

;; Disable menu bar
(when (fboundp 'menu-bar-mode)
  (menu-bar-mode -1))

;; Some MacOS interface setup
; (when  (and (string-equal system-type "darwin") (display-graphic-p))
;   (add-to-list 'default-frame-alist
;                '(ns-transparent-titlebar . t))
;   (add-to-list 'default-frame-alist
;                '(ns-appearance . dark)))

;; Maximize window on startup
; (when (display-graphic-p)
;   (add-to-list 'default-frame-alist '(fullscreen . maximized)))

;; Disable the annoying bell ring
(setq ring-bell-function 'ignore)

;; Disable startup buffer
(setq inhibit-splash-screen t)

;; Welcome message
(setq initial-scratch-message (concat ";; Welcome to MYmacs, " user-full-name "!\n;;\n;;"))

;; Better 'M-x' visualization
(use-package amx
  :ensure t
  :init
  (setq amx-history-length 20))

;; Better ivy visualization
(use-package ivy-rich
  :ensure t
  :hook ((ivy-mode . ivy-rich-mode))
  :config
  (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line))

;; Better flycheck visualization
;; Display Flycheck errors in GUI tooltips
; (if (display-graphic-p)
;     (if (>= emacs-major-version 26)
;         (use-package flycheck-posframe
;           :ensure t
;           :hook (flycheck-mode . flycheck-posframe-mode)
;           :config (add-to-list 'flycheck-posframe-inhibit-functions
;                                #'(lambda () (bound-and-true-p company-backend))))
;       (use-package flycheck-pos-tip
;         :ensure t
;         :defines flycheck-pos-tip-timeout
;         :hook (global-flycheck-mode . flycheck-pos-tip-mode)
;         :config (setq flycheck-pos-tip-timeout 30)))
;   (use-package flycheck-popup-tip
;     :ensure t
;     :hook (flycheck-mode . flycheck-popup-tip-mode)))

;; Display time and date in modeline
(setq display-time-day-and-date t)
(setq display-time-default-load-average nil)
(setq display-time-format "%H:%M  ")
(display-time-mode 1)

;; Highlight parenthesis
(setq show-paren-delay 0)
(setq-default show-paren-style 'parenthesis)
(setq-default show-paren-when-point-inside-paren t)
(add-hook 'after-init-hook #'show-paren-mode)

;; Show lines number
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(setq display-line-numbers-grow-only t)
; (use-package linum
;   :diminish
;   :hook ((prog-mode . linum-mode)))

;; Separate lines number from code
(setq display-line-numbers "%4d \u2502 ")
(setq linum-format "%4d \u2502 ")



;; Rainbow mode
(use-package rainbow-mode
  :ensure t
  :diminish
  :hook ((prog-mode . rainbow-mode)))

;; Colored delimiters
(use-package rainbow-delimiters
  :ensure t
  :diminish
  :hook ((prog-mode . rainbow-delimiters-mode)
     (text-mode . rainbow-delimiters-mode)
     (org-src-mode . rainbow-delimiters-mode)))

;; Evidence current buffer
(use-package zoom
  :ensure t
  :diminish
  :hook ((after-init . zoom-mode)))

;; Move through buffers
; (global-set-key (kbd "S-<left>")  'windmove-left)
; (global-set-key (kbd "S-<right>") 'windmove-right)
; (global-set-key (kbd "S-<up>")    'windmove-up)
; (global-set-key (kbd "S-<down>")  'windmove-down)
; (setq windmove-wrap-around t)

;; Smooth scrolling
(setq scroll-step            1)
(setq scroll-conservatively  10000)

;; Load monokai theme
; (use-package monokai-theme
;   :ensure t
;   :defer t)

;; Set theme for GUI
; (when (display-graphic-p)
;   (load-theme 'monokai t))

(provide 'module-interface)
;;; module-interface.el ends here
