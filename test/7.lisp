;;; Найти минимальное из чисел, являющихся максимальным в каждой из строк заданной прямоугольной матрицы

(defun max-in-list (arr)
	(if (null (cdr arr))
		(car arr)
		(max2 (car arr) (max-in-list (cdr arr)))
	)
)

(defun min-in-list (arr)
	(if (null (cdr arr))
		(car arr)
		(min2 (car arr) (min-in-list (cdr arr)))
	)
)

(defun max2 (x y)
	(if (> x y) x y)
)

(defun min2 (x y)
	(if (< x y) x y)
)

(defun max-in-matx (matx)
	(min-in-list (mapcar 'max-in-list matx))
)


(setq arr1 '(5 9 3))
(setq arr2 '(3 12 4))
(setq arr3 '(4 5 6))
(setq matx (list arr1 arr2 arr3))

(print (max-in-matx matx))

#|
6
|#
