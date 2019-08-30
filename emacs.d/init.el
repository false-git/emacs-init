;;; package
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;;; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;; flymake
(use-package flymake
  :disabled t
  :init
  (add-hook 'c-mode-common-hook 'flymake-mode)
  :commands flymake-mode
  )

;; flycheck
(use-package flycheck
  :config
  (when (locate-library "flycheck-irony")
    (flycheck-irony-setup))
  (global-flycheck-mode t)
  )

;; irony
(use-package irony
  :commands irony-mode
  :config
  (custom-set-variables '(irony-additional-clang-options '("-std=c++17")))
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
  (add-hook 'c-mode-common-hook 'irony-mode)
  )


;;; 個別環境用設定の読み込み
(condition-case err
    (load-file "$HOME/.emacs.d/init-local.el"))

;;; custom-file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))
