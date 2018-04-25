;;; 12. Заменить 2 подряд идущих одинаковых элемента на один

(defun replace-2 (arr)
	(
		(lambda (head second arr)
			(cond
				((null arr) Nil)
				((null (cdr arr)) (list head))
				((eq head second) (cons head (replace-2 (cddr arr))))
				(T (cons head (replace-2 (cdr arr))))
			)
		) (car arr) (cadr arr) arr
	)			
)

(defun print-pretty (arr)
	(format t "List = ~a, replace 2 adjacent elements with one => ~a~%" arr (replace-2 arr))
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




