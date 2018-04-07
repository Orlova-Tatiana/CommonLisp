;;; 12. Удалить 2 подр¤д идущих одинаковых элемента

(defun head (arr)
	(car arr)
)

(defun tail (arr)
	(cdr arr)
)

(defun head-2 (arr)
	(cadr arr)
)

(defun remove-2 (arr)
	(defun iterate (arr can-place)
		(if (null arr)
			Nil
			(if (null (tail arr))
				(if can-place arr Nil)
				(if (not can-place)
					(iterate (tail arr) T)
					(if (= (head arr) (head-2 arr))
						(cons (head arr) (iterate (tail arr) Nil))
						(cons (head arr) (iterate (tail arr) T)) 
					)
				)
			)
		)
	)
	
	(iterate arr T)
)

(defun print-pretty (arr)
	(format t "List = ~a, remove 2 adjacent elements => ~a~%" arr (remove-2 arr))
)

(print-pretty '(1 1 2 3 3 3 4 4))
(print-pretty '(6 6 6 6))
(print-pretty '(1 2 3))
(print-pretty '(1))

#|
Список = (1 1 2 3 3 3 4 4), удалить 2 подряд идущих одинаковых => (1 2 3 3 4)
Список = (6 6 6 6), удалить 2 подряд идущих одинаковых => (6 6)
Список = (1 2 3), удалить 2 подряд идущих одинаковых => (1 2 3)
Список = (1), удалить 2 подряд идущих одинаковых => (1)
|#




