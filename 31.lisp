;;; 31. ���������� �������, ������� ���������� �������, �������� � ��� ������

(defun contains (arr val)
	(if (null arr)
		Nil
		(if (= (car arr) val)
			T
			(contains (cdr arr) val)
		)
	)
)

(defun oba (arr1 arr2)
	(if (null arr1)
		Nil
		(if (contains arr2 (car arr1))
			(car arr1)
			(oba (cdr arr1) arr2)
		)
	)
)

(defun print-pretty (arr1 arr2)
	(format t "������1 = ~a, ������2 = ~a, ����� ������� => ~a~%" arr1 arr2 (oba arr1 arr2))
)

(print-pretty '(1 2 3) '(3 2 1))
(print-pretty '(1 2 3) '(4 5 6))
(print-pretty '(1 2 3) '(0 0 3))
(print-pretty '(1 2 3) '(5 6 7 5 2 8))

#|
������1 = (1 2 3), ������2 = (3 2 1), ����� ������� => 1
������1 = (1 2 3), ������2 = (4 5 6), ����� ������� => NIL
������1 = (1 2 3), ������2 = (0 0 3), ����� ������� => 3
������1 = (1 2 3), ������2 = (5 6 7 5 2 8), ����� ������� => 2
|#