;;; 4. ���������� �������������� �������� (every �������� ������), ������� �����, ���� ��� �����

(defun all-true (arr)
	(if (null arr)
		T
		(and (car arr) (all-true (cdr arr)))
	)
)

(defun my-every (predicate arr)
	(all-true (mapcar predicate arr))
)

(defun print-pretty (arr)
	(format t "������ = ~a, ��� ������ => ~a~%" arr (my-every 'evenp arr))
)


(print-pretty '(2 6 8 10))
(print-pretty '(2 6 9 10))

#|
������ = (2 6 8 10), ��� ������ => T
������ = (2 6 9 10), ��� ������ => NIL
|#