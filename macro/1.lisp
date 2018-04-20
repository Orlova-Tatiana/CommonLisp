;;; 1. Определите макрос, который возвращает свой вызов

(defmacro self (&rest x)
  `(quote (self ,x))
)

(print
	(self a b (+ a b))
)

#|
(SELF (A B (+ A B)))
|#