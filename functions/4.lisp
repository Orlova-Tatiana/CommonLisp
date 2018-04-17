;;; 4. Определить функциональный предикат (every предикат список), который верен, если все верны

(defun my-every (predicate arr)
	(null
		(mapcan (lambda (x) (if (null x) (list T) Nil))
			(mapcar predicate arr)
		)
	)
)

(defun print-pretty (arr)
	(format t "List = ~a, all even => ~a~%" arr (my-every 'evenp arr))
)


(print-pretty '(2 6 8 10))
(print-pretty '(2 6 9 10))

#|
Список = (2 6 8 10), все четные => T
Список = (2 6 9 10), все четные => NIL
|#