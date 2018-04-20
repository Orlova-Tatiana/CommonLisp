;;; 5. Определите в виде макроса форму (REPEAT e UNTIL p) паскалевского типа.

(defmacro repeat (e until p)
	`(cond
		(,p Nil)
		(T
			(progn
				,e
				(repeat ,e until ,p)
			)
		)
	)
)

(setq arr (list 1 2 3 4 5))
(repeat
	(progn
		(print (car arr))
		(setq arr (cdr arr))
	)
	until (= (car arr) 4)
)
(print arr)

#|
1
2
3
(4 5)
|#
