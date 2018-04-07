;;; 4. Определить функциональный предикат (every предикат список), который верен, если все верны

(defun all-true (arr)
	(if (null arr)
		T
		(and (car arr) (all-true (cdr arr)))
	)
)

(defun my-every (predicate arr)
	(all-true (mapcar predicate arr))
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