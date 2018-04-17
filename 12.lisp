;;; 12. Заменить 2 подряд идущих одинаковых элемента на один

(defun remove-2 (arr)
	(defun iterate (arr can-add)
		(if (null arr)
			Nil
			(let
				(
					(head (car arr))
					(tail (cdr arr))
					(head-2 (cadr arr))
				)
				(cond
					((null tail) (if can-add arr Nil))
					((not can-add) (iterate tail T))
					((= head head-2) (cons head (iterate tail Nil)))
					(T (cons head (iterate tail T)))
				)
			)
		)
	)
	
	(iterate arr T)
)

(defun print-pretty (arr)
	(format t "List = ~a, replace 2 adjacent elements with one => ~a~%" arr (remove-2 arr))
)

(print-pretty '(1 1 2 3 3 3 4 4))
(print-pretty '(6 6 6 6))
(print-pretty '(1 2 3))
(print-pretty '(1))

#|
Список = (1 1 2 3 3 3 4 4), заменить 2 подряд идущих одинаковых элемента на один => (1 2 3 3 4)
Список = (6 6 6 6), заменить 2 подряд идущих одинаковых элемента на один => (6 6)
Список = (1 2 3), заменить 2 подряд идущих одинаковых элемента на один => (1 2 3)
Список = (1), заменить 2 подряд идущих одинаковых элемента на один => (1)
|#




