;;; Написать генератор совершенных чисел. Число называется совершенным, если оно равно сумме своих делителей.

(defun all-dividers (n)
	(defun iterate (i)
		(cond
			((= n i) (list n))
			((= (mod n i) 0) (cons i (iterate (+ i 1))))
			(T (iterate (+ i 1)))
		)
	)
	(iterate 1)
)

(defun is-perfect (n)
	(= (apply '+ (all-dividers n)) (* 2 n))
)

(defun generator ()
	(let
		((cur 0) (try-next Nil))
		(setq try-next (lambda ()
			(setq cur (+ 1 cur))
			(if (is-perfect cur)
				cur
				(funcall try-next)
			)
		))
	)
)		

(defun print-pretty (gen)
	(format t "Generage next => ~a~%" (funcall gen))
)

(setq next1 (generator))
(setq next2 (generator))

(format t "next1:~%")
(print-pretty next1)
(print-pretty next1)
(print-pretty next1)

(format t "next2:~%")
(print-pretty next2)
(print-pretty next2)
(print-pretty next2)

#|
next1:
Generage next => 6
Generage next => 28
Generage next => 496
next2:
Generage next => 6
Generage next => 28
Generage next => 496
|#
