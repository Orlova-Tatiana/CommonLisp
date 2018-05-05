;;;; Название языка = Visp (Vector Lisp)

(defun apply-operation (vector1 vector2 operation)
	(if (listp vector1)
		(mapcar (lambda (x y) (funcall operation x y)) vector1 vector2)
		(funcall operation vector1 vector2)
	)
)

(defun reduce-operation (vector operation)
	(if (listp vector)
		(reduce operation vector)
		(funcall operation vector)
	)
)

(defun repeat (number times)
	(if (= times 0)
		Nil
		(cons number (repeat number (1- times)))
	)
)

(defmacro => (&rest tokens)
	`(let
		(
			(token-1 (car ',tokens))
			(token-2 (caddr ',tokens))
			(operation (cadr ',tokens))
			(rest-tokens (cdddr ',tokens))
			(val Nil)
		)
		
		(if (eq token-2 'self) (setq token-2 token-1))
		
		(cond
			((eq operation '->) (setq val (reduce-operation token-1 token-2)))
			(T
				(if (and (not (listp token-2)) (listp token-1))
					(setq token-2 (repeat token-2 (length token-1))))
				(setq val (apply-operation token-1 token-2 operation))
			)
		)
			
		(if (null rest-tokens)
			val
			(eval `(=> ,val ,@rest-tokens))
		)
	)
)

;;; Примеры
(print
	(=> (1 2 3) + (3 4 5) * (1 2 3) / (4 4 4)) ; (1 3 6)
)
(print
	(=> (1 2 3) + 5) ; (6 7 8)
)
(print
	(=> 3 + 4 * self) ; 49
)

;;; Скалярное произведение
(print
	(=> (1 2 3) * (3 4 5) -> +) ; 26
)

;;; Модуль вектора
(print
	(=> (2 4 4) * self -> + -> sqrt) ; 6
)
(print
	(=> (2 4 4) expt 2 -> + -> sqrt) ; 6
)
