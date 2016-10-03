(require 'org)

(let* ((dotspacemacs-basedir (file-name-directory (or load-file-name buffer-file-name)))

       ;; main file
       (dotspacemacs-config-file (concat dotspacemacs-basedir "gfanton.org"))

       ;; custom file
       (dotspacemacs-custom-file (concat dotspacemacs-basedir "custom.el"))

       ;; private file
       (dotspacemacs-private-file (concat dotspacemacs-basedir "private.el")))

  (unless (file-exists-p dotspacemacs-custom-file)
    (write-region "" nil dotspacemacs-custom-file))
  (setq custom-file dotspacemacs-custom-file)

  (unless (file-exists-p dotspacemacs-private-file)
    (write-region "" nil dotspacemacs-private-file))

  (org-babel-load-file dotspacemacs-config-file)

  (load dotspacemacs-custom-file)
  (load dotspacemacs-private-file))

