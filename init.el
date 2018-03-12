(require 'package)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
  (package-initialize)

;;Personal config before
(setq evil-want-C-u-scroll t)



;;Exec path from shell
; (when (memq window-system '(mac ns))
(exec-path-from-shell-initialize)
;;Evil
  (require 'evil)
  (evil-mode 1)

;;Neotree
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
; (setq neo-smart-open t)


;;Fiplr
(setq fiplr-ignored-globs '((directories (".git" ".svn" "node_modules" "platforms" "plugins" "tmp"))
                            (files ("*.jpg" "*.png" "*.zip" "*~"))))
(global-set-key (kbd "C-x f") 'fiplr-find-file)

;;Auto complete
(ac-config-default)

;;Flycheck
(global-flycheck-mode)

;;Keychord
(setq key-chord-two-keys-delay 3.0)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-mode 1)

;;Powerline
(require 'powerline)
(powerline-default-theme)

;;Autopairs
(require 'autopair)
(autopair-global-mode) ;; enable autopair in all buffersz


;;Linum-relative
(require 'linum-relative)
(linum-relative-on)

;;Evil-commentary
(require 'evil-commentary)
(evil-commentary-mode)

;;Magit	
(global-set-key (kbd "C-x g") 'magit-status)

;;Editor Config
(require 'editorconfig)
(editorconfig-mode 1)

;;Yasnippets
(require 'yasnippet)
(yas-global-mode 1)

;;Elpy
(elpy-enable)

;;Jedi
(add-hook 'python-mode-hook 'jedi:setup)

;;Ansi-term
(add-hook 'term-mode-hook (lambda()
        (setq yas-dont-activate t)))

;;Personal config after
;;(load-theme 'solarized- t)
(load-theme 'base16-github t)
(global-linum-mode t)
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
;;(setq backup-directory-alist `(("." . "~/.saves")))
(setq make-backup-files nil)
(ido-mode t)

;;Sass Mode
(add-to-list 'auto-mode-alist '("\\.scss\\'" . sass-mode))

;;WeB Mode
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . css-mode))


;;Yaml mode
(add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode))

;;Less mode
(add-to-list 'auto-mode-alist '("\\.css\\'" . less-css-mode))
(add-to-list 'auto-mode-alist '("\\.less\\'" . less-css-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . less-css-mode))


(define-coding-system-alias 'UTF-8 'utf-8)



;; Ctags
(require 'eproject)
(defun build-ctags ()
  (interactive)
  (message "building project tags")
  (let ((root (eproject-root)))
   (shell-command (concat "ctags -e -R --extra=+fq --exclude=db --exclude=t    est --exclude=platforms --exclude=plugins --exclude=node_modules --exclude=.    git --exclude=public --exclude=lib --exclude=tmp --exclude=config --exclude=TDD --exclude=    old -f " root "TAGS " root)))

  (visit-project-tags)
  (message "tags built successfully"))
(defun visit-project-tags ()
  (interactive)
  (let ((tags-file (concat (eproject-root) "TAGS")))
    (visit-tags-table tags-file)
    (message (concat "Loaded " tags-file))))
(defun my-find-tag ()
  (interactive)
  (if (file-exists-p (concat (eproject-root) "TAGS"))
      (visit-project-tags)
    (build-ctags))
  (etags-select-find-tag-at-point))

(global-set-key (kbd "M-c") 'my-find-tag)


;;PDB
(defun add-py-debug ()  
      "add debug code and move line down"  
    (interactive)  
    (move-beginning-of-line 1)  
    (insert "import pdb; pdb.set_trace();\n"))  

(global-set-key (kbd "<f1>") 'add-py-debug)

(defun remove-py-debug ()  
  "remove py debug code, if found"  
  (interactive)  
  (let ((x (line-number-at-pos))  
    (cur (point)))  
    (search-forward-regexp "^[ ]*import pdb; pdb.set_trace();")  
    (if (= x (line-number-at-pos))  
    (let ()  
      (move-beginning-of-line 1)  
      (kill-line 1)  
      (move-beginning-of-line 1))  
      (goto-char cur))))  

(global-set-key (kbd "C-c <f1>") 'remove-py-debug)

(global-set-key (kbd "<f3>") '(lambda ()  
                                 (interactive)   
                                 (search-forward-regexp "^[ ]*import pdb; pdb.set_trace();")   
                                 (move-beginning-of-line 1)))

;disable auto save
(setq auto-save-default nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("16dd114a84d0aeccc5ad6fd64752a11ea2e841e3853234f19dc02a7b91f5d661" "6254372d3ffe543979f21c4a4179cd819b808e5dd0f1787e2a2a647f5759c1d1" "a1289424bbc0e9f9877aa2c9a03c7dfd2835ea51d8781a0bf9e2415101f70a7e" "b571f92c9bfaf4a28cb64ae4b4cdbda95241cd62cf07d942be44dc8f46c491f4" "427fed191e7a766152e59ef0e2904283f436dbbe259b9ccc04989f3acde50a55" "8abee8a14e028101f90a2d314f1b03bed1cde7fd3f1eb945ada6ffc15b1d7d65" "a164837cd2821475e1099911f356ed0d7bd730f13fa36907895f96a719e5ac3e" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(menu-bar-mode nil)
 '(tool-bar-mode nil))

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
    
(set-frame-font "Hack 11" nil t)
