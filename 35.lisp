;;; 35. ����������, �������� �� ���� ��������� ������������� �������, � ����������� �������������

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
	(format t "������1 = ~a, ������2 = ~a, 2 ������������ 1-��? => ~a~%" arr1 arr2 (is-subset arr1 arr2))
)

(defun print-pretty-own (arr1 arr2)
	(format t "������1 = ~a, ������2 = ~a, 2 ����������� ������������ 1-��? => ~a~%" arr1 arr2 (is-own-subset arr1 arr2))
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
������1 = (1 2 3 4), ������2 = (3 2 1), 2 ������������ 1-��? => T
������1 = (1 2 3), ������2 = (1 2 3), 2 ������������ 1-��? => T
������1 = (1 2 3), ������2 = NIL, 2 ������������ 1-��? => T
������1 = (1 2 3 4), ������2 = (1 2 3 5), 2 ������������ 1-��? => NIL
������1 = (1 2 3), ������2 = (1 2 3 4), 2 ������������ 1-��? => NIL

������1 = (1 2 3 4), ������2 = (3 2 1), 2 ����������� ������������ 1-��? => T
������1 = (1 2 3), ������2 = (1 2 3), 2 ����������� ������������ 1-��? => NIL
������1 = (1 2 3), ������2 = NIL, 2 ����������� ������������ 1-��? => NIL
������1 = (1 2 3 4), ������2 = (1 2 3 5), 2 ����������� ������������ 1-��? => NIL
������1 = (1 2 3), ������2 = (1 2 3 4), 2 ����������� ������������ 1-��? => NIL
|#