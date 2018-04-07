;;; 4.Построить массив натуральных чисел от 1 до N

(defun make (n)
	(if (= n 1) 
		(list 1)
		(append (make (- n 1)) (list n))
	)
)

(defun print-pretty (n)
	(format t "N=~d => ~a~%" n (make n))
)

(print-pretty 5) ; (1 2 3 4 5)
(print-pretty 1) ; (1)

#|
N=5 => (1 2 3 4 5)
N=1 => (1) 
|#