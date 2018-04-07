;;; 6. Определить фильтр (remove-if предикат список),
;;;    удаляющий из списка все элементы, на которые предикат отвечает True

(defun my-remove-if (predicate arr)
	(mapcan
		(lambda (x to-remove)
			(if to-remove Nil (list x))
		)
		arr (mapcar predicate arr)
	)
)

(defun print-pretty (arr)
	(format t "List = ~a, remove even => ~a~%" arr (my-remove-if 'evenp arr))
)

(print-pretty '(1 2 3 4 5 6))
(print-pretty '(7 9 7 2 9))

#|
Список = (1 2 3 4 5 6), удалить четные => (1 3 5)
Список = (7 9 7 2 9), удалить четные => (7 9 7 9)
|#