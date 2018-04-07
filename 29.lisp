;;; 29. B�������� ������� ����� �������� ����� ������

(defun glubina (arr)
	(if (or (not (listp arr)) (null arr))
		0
		(max (+ 1 (glubina (car arr))) (glubina (cdr arr)))
	)
)	

(defun print-pretty (arr)
	(format t "C����� = ~a, ����� ����� �������� ����� => ~a~%" arr (glubina arr))
)

(print-pretty '(1 2 3))
(print-pretty '((1) (2) (3)))
(print-pretty '((1) (2 (4) 5) (3)))
(print-pretty '(((1 (4)))))
(print-pretty 5)

#|
C����� = (1 2 3), ����� ����� �������� ����� => 1
C����� = ((1) (2) (3)), ����� ����� �������� ����� => 2
C����� = ((1) (2 (4) 5) (3)), ����� ����� �������� ����� => 3
C����� = (((1 (4)))), ����� ����� �������� ����� => 4
C����� = 5, ����� ����� �������� ����� => 0
|#