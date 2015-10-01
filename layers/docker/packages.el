(setq docker-packages
      '(
        docker
        docker-tramp
        ))

(defun dockerfile/init-docker-tramp ()
  (use-package docker-tramp
    :defer t))

(defun dockerfile/init-docker ()
  (use-package docker
    :defer t
    :commands spacemacs/docker-global-mode
    :init
    (progn
      (evil-leader/set-key 'docker-global-mode
        "dcc" 'docker-container
        "dcd" 'docker-rm
        "dco" 'docker-stop
        "dcp" 'docker-pause
        "dcr" 'docker-restart
        "dcs" 'docker-start
        "dce" 'docker-unpause
        "dii" 'docker-image)))
