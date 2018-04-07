;;; 12. ������� 2 ������ ������ ���������� ��������

(defun head (arr)
	(car arr)
)

(defun tail (arr)
	(cdr arr)
)

(defun head-2 (arr)
	(cadr arr)
)

(defun remove-2 (arr)
	(defun iterate (arr can-place)
		(if (null arr)
			Nil
			(if (null (tail arr))
				(if can-place arr Nil)
				(if (not can-place)
					(iterate (tail arr) T)
					(if (= (head arr) (head-2 arr))
						(cons (head arr) (iterate (tail arr) Nil))
						(cons (head arr) (iterate (tail arr) T)) 
					)
				)
			)
		)
	)
	
	(iterate arr T)
)

(defun print-pretty (arr)
	(format t "������ = ~a, ������� 2 ������ ������ ���������� => ~a~%" arr (remove-2 arr))
)

(print-pretty '(1 1 2 3 3 3 4 4)) ; (1 2 3 3 4)
(print-pretty '(6 6 6 6)) ; (6 6)
(print-pretty '(1 2 3)) ; (1 2 3)
(print-pretty '(1)) ; (1)

#|
������ = (1 1 2 3 3 3 4 4), ������� 2 ������ ������ ���������� => (1 2 3 3 4)
������ = (6 6 6 6), ������� 2 ������ ������ ���������� => (6 6)
������ = (1 2 3), ������� 2 ������ ������ ���������� => (1 2 3)
������ = (1), ������� 2 ������ ������ ���������� => (1)
|#




