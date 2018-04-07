;;; 45. Определить расстояние между городами по координатам x и y

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
	(format t "Город1 = ~a, Город2 = ~a, расстояние => ~a~%" city1 city2 (dist city1 city2))
)

(setf (get 'Simfer 'x) 1)
(setf (get 'Simfer 'y) 2)
(setf (get 'Piter 'x) 4)
(setf (get 'Piter 'y) -2)

(print-pretty 'Simfer 'Piter) ; 5
(print-pretty 'Simfer 'Simfer) ; 0

#|
Город1 = SIMFER, Город2 = PITER, расстояние => 5
Город1 = SIMFER, Город2 = SIMFER, расстояние => 0
|#