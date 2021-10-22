(package-initialize)
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#3c3836" "#fb4933" "#b8bb26" "#fabd2f" "#83a598" "#d3869b" "#8ec07c" "#ebdbb2"])
 '(custom-safe-themes
   (quote
    ("83e0376b5df8d6a3fbdfffb9fb0e8cf41a11799d9471293a810deb7586c131e6" "d14f3df28603e9517eb8fb7518b662d653b25b26e83bd8e129acea042b774298" default)))
 '(package-selected-packages (quote (gruvbox-theme web-mode jdee use-package)))
 '(pdf-view-midnight-colors (quote ("#fdf4c1" . "#32302f"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; enable straight
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; use and install helm if not present
(straight-use-package 'helm)


;;; End package related configs


;; Helm settings
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(setq helm-split-window-in-side-p t) ; open helm buffer inside current window, not occupy whole other window
(helm-mode 1) ; turn on helm


;; Web mode indentations
(use-package web-mode
  :custom
  (web-mode-markup-indent-offset 2)
  (web-mode-css-indent-offset 2)
  (web-mode-code-indent-offset 2))

;; Enable Company mode for all buffers
(add-hook 'after-init-hook 'global-company-mode)

;; Set show paren mode
(show-paren-mode 1)

;; define load path
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; set theme
(load-theme 'gruvbox-dark-soft t)

;; Suppress welcome screen
(setq inhibit-startup-screen t)

;; Extra function for dired to open files in other frame
(defun dired-find-file-other-frame ()
  "In Dired, visit this file or directory in another window."
  (interactive)
  (other-frame 1)
  (find-file (dired-get-file-for-visit)))
(eval-after-load "dired"
  '(define-key dired-mode-map "F" 'dired-find-file-other-frame))
