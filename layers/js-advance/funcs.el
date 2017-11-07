;; https://github.com/aaronjensen/spacemacs.d/tree/master/layers/%2Baj/aj-javascript
;; Inspired by http://blog.binchen.org/posts/indent-jsx-in-emacs.html
(defun js-advance/js-jsx-indent-line-align-closing-bracket ()
  "Workaround sgml-mode and align closing bracket with opening bracket"
  (save-excursion
    (beginning-of-line)
    (when (looking-at-p "^ +\/?> *$")
      (delete-char sgml-basic-offset))))

(defun js-advance/company-use-flow-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (global-flow (executable-find "flow"))
         (local-flow (expand-file-name "node_modules/.bin/flow"
                                         root))
         (flow (if (file-executable-p local-flow)
                     local-flow
                 global-flow)))
    (setq-local company-flow-executable flow)))

(defun js-advance/flycheck-use-flow-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (global-flow (executable-find "flow"))
         (local-flow (expand-file-name "node_modules/.bin/flow"
                                       root))
         (flow (if (file-executable-p local-flow)
                   local-flow
                 global-flow)))
    (setq-local flycheck-javascript-flow-executable flow)))


;; Copied from spacemacs https://github.com/syl20bnr/spacemacs/blob/master/layers/%2Bframeworks/react/funcs.el
(defun js-advance/use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (global-eslint (executable-find "eslint"))
         (local-eslint (expand-file-name "node_modules/.bin/eslint"
                                         root))
         (eslint (if (file-executable-p local-eslint)
                     local-eslint
                   global-eslint)))

    (setq-local flycheck-javascript-eslint-executable eslint)))

;; From https://github.com/jdelStrother/dotfiles/tree/master/spacemacs_layers/flow-type
(defun js-advance/known-type-at-pos ()
  ;; You'll get '(unknown)' while cursoring over comments, whitespace, keywords, etc
  ;; Don't bother reporting type information for those instances:
  (let ((type (flow-minor-type-at-pos)))
    (if (not (string-match "^\\(flow is still initializing\\|(unknown)\\)" type))
        type)))

;; From https://github.com/jdelStrother/dotfiles/tree/master/spacemacs_layers/flow-type
(defun js-advance/enable-eldoc ()
  (if (and flow-type-enable-eldoc-type-info (flow-minor-configured-p))
      (set (make-local-variable 'eldoc-documentation-function) 'js-advance/known-type-at-pos)))
