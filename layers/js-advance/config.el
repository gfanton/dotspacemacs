(defcustom flow-type-enable-eldoc-type-info t
  "When t, automatically display the type under the cursor using eldoc.
When nil, types can be displayed manually with `flow-minor-type-at-pos'.")

(defcustom js-advance-enable-flycheck-flow t
  "Defines if flycheck-flow is enabled. It is not always necessary since
  eslint can show flow errors.")
