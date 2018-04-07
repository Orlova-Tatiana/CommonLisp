;;; 6. ќпределить фильтр (remove-if предикат список),
;;; удал€ющий из списка все элементы, на которые предикат отвечает True

(defun my-remove-if (predicate arr)
	(mapcan
		(lambda (x to-remove)
			(if to-remove Nil (list x))
		)
		arr (mapcar predicate arr)
	)
)

(defun print-pretty (arr)
	(format t "—писок = ~a, удалить четные => ~a~%" arr (my-remove-if 'evenp arr))
)

(print-pretty '(1 2 3 4 5 6))
(print-pretty '(7 9 7 2 9))

