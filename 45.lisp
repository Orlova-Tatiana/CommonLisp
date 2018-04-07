;;; 45. ���������� ���������� ����� �������� �� ����������� x � y

(defun dist (city1 city2)
	(let
		(
			(x1 (get city1 'x))
			(y1 (get city1 'y))
			(x2 (get city2 'x))
			(y2 (get city2 'y))
		)
		(sqrt (+ (expt (- x1 x2) 2) (expt (- y1 y2) 2)))
	)
)
		

(defun print-pretty (city1 city2)
	(format t "�����1 = ~a, �����2 = ~a, ���������� => ~a~%" city1 city2 (dist city1 city2))
)

(setf (get 'Simfer 'x) 1)
(setf (get 'Simfer 'y) 2)
(setf (get 'Piter 'x) 4)
(setf (get 'Piter 'y) -2)

(print-pretty 'Simfer 'Piter) ; 5
(print-pretty 'Simfer 'Simfer) ; 0

#|
�����1 = SIMFER, �����2 = PITER, ���������� => 5
�����1 = SIMFER, �����2 = SIMFER, ���������� => 0
|#