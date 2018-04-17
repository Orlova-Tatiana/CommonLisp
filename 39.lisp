;;; 39. Сформировать множество из элементов, которые не входят в оба множества

(defun contains (arr val)
	(if (null arr)
		Nil
		(if (= (car arr) val)
			T
			(contains (cdr arr) val)
		)
	)
)

(defun not-in (arr1 arr2)
	(defun iterate (arr1 arr2)
		(if (null arr1) 
			Nil
			(let
				(
					(head (car arr1))
					(tail (cdr arr1))
				)
				(if (contains arr2 head)
					(iterate tail arr2)
					(cons head (iterate tail arr2))
				)
			)
		)
	)
	(append
		(iterate arr1 arr2)
		(iterate arr2 arr1)
	)
)

(defun print-pretty (arr1 arr2)
	(format t "List1 = ~a, List2 = ~a, symmetric difference => ~a~%" arr1 arr2 (not-in arr1 arr2))
)

(print-pretty '(1 2 3 4) '(5 2 3 8)) ; (1 4 5 8)
(print-pretty '(1 2 3) '(3 2 1)) ; Nil
(print-pretty '(1 2 3) Nil) ; (1 2 3)
(print-pretty '(1 2) '(3 4 5)) ; (1 2 3 4 5)

#|
Список1 = (1 2 3 4), Список2 = (5 2 3 8), симметричная разность => (1 4 5 8)
Список1 = (1 2 3), Список2 = (3 2 1), симметричная разность => NIL
Список1 = (1 2 3), Список2 = NIL, симметричная разность => (1 2 3)
Список1 = (1 2), Список2 = (3 4 5), симметричная разность => (1 2 3 4 5)
|#