;;;; 10. Удалить N элементов с конца

(defun remove-last (arr n)
	(defun leave-first (arr n)
		(if (= n 0)
			'()
			(cons (car arr) (leave-first (cdr arr) (- n 1)))
		)
	)
	
	(leave-first arr (- (list-length arr) n))
)

(defun print-pretty (arr n)
	(format t "List = ~a, remove ~d elements => ~a~%" arr n (remove-last arr n))
)

(print-pretty '(1 2 3 4 5) 2)
(print-pretty '(1 2 3 4 5) 0)

#|
Список = (1 2 3 4 5), удалить 2 элемента => (1 2 3)
Список = (1 2 3 4 5), удалить 0 элементов => (1 2 3 4 5)
|#