;;; 35. Определить, является ли одно множество подмножеством другого, и собственным подмножеством

(defun contains (arr val)
	(if (null arr)
		Nil
		(if (= (car arr) val)
			T
			(contains (cdr arr) val)
		)
	)
)

(defun del (arr val)
	(if (null arr)
		Nil
		(if (= (car arr) val)
			(cdr arr)
			(cons (car arr) (del (cdr arr) val))
		)
	)
)

(defun is-subset (arr1 arr2)
	(if (null arr2)
		T
		(if (not (contains arr1 (car arr2)))
			Nil
			(is-subset (del arr1 (car arr2)) (cdr arr2))
		)
	)
)

(defun is-own-subset (arr1 arr2)
	(and (not (null arr2)) (is-subset arr1 arr2) (not (is-subset arr2 arr1)))
)

(defun print-pretty (arr1 arr2)
	(format t "Список1 = ~a, Список2 = ~a, 2 подмножество 1-го? => ~a~%" arr1 arr2 (is-subset arr1 arr2))
)

(defun print-pretty-own (arr1 arr2)
	(format t "Список1 = ~a, Список2 = ~a, 2 собственное подмножество 1-го? => ~a~%" arr1 arr2 (is-own-subset arr1 arr2))
)

(print-pretty '(1 2 3 4) '(3 2 1))
(print-pretty '(1 2 3) '(1 2 3))
(print-pretty '(1 2 3) Nil)
(print-pretty '(1 2 3 4) '(1 2 3 5))
(print-pretty '(1 2 3) '(1 2 3 4))

(terpri)

(print-pretty-own '(1 2 3 4) '(3 2 1))
(print-pretty-own '(1 2 3) '(1 2 3))
(print-pretty-own '(1 2 3) Nil)
(print-pretty-own '(1 2 3 4) '(1 2 3 5))
(print-pretty-own '(1 2 3) '(1 2 3 4))

#|
Список1 = (1 2 3 4), Список2 = (3 2 1), 2 подмножество 1-го? => T
Список1 = (1 2 3), Список2 = (1 2 3), 2 подмножество 1-го? => T
Список1 = (1 2 3), Список2 = NIL, 2 подмножество 1-го? => T
Список1 = (1 2 3 4), Список2 = (1 2 3 5), 2 подмножество 1-го? => NIL
Список1 = (1 2 3), Список2 = (1 2 3 4), 2 подмножество 1-го? => NIL

Список1 = (1 2 3 4), Список2 = (3 2 1), 2 собственное подмножество 1-го? => T
Список1 = (1 2 3), Список2 = (1 2 3), 2 собственное подмножество 1-го? => NIL
Список1 = (1 2 3), Список2 = NIL, 2 собственное подмножество 1-го? => NIL
Список1 = (1 2 3 4), Список2 = (1 2 3 5), 2 собственное подмножество 1-го? => NIL
Список1 = (1 2 3), Список2 = (1 2 3 4), 2 собственное подмножество 1-го? => NIL
|#