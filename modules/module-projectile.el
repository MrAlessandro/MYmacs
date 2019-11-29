;;; module-projectile.el --- Configurations for project managment
;;
;; Author: Alessandro Meschi <alessandro.meschi@icloud.com>
;; Version: 1.0.0

;; This file is not part of GNU Emacs.

;;; Commentary:

;; This file configure project managment

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


(use-package projectile
    :ensure t
    :config

    ;; Global configuration
    (setq projectile-indexing-method      'hybrid
          projectile-require-project-root 'prompt
          projectile-enable-caching t
          projectile-ignored-project-function 'file-remote-p
          projectile-project-root-files-top-down-recurring (append '("compile_commands.json"
                                                                     ".cquery")
                                                                   projectile-project-root-files-top-down-recurring))
    ;; Keys
    (setq projectile-keymap-prefix (kbd "C-x p"))
    ;; Activate globally
    (projectile-mode))

(provide 'module-projectile)
;;; module.projectile.el ends here
