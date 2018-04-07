;;; 29. Bычислить глубину самой глубокой ветви списка

(defun glubina (arr)
	(if (or (not (listp arr)) (null arr))
		0
		(max (+ 1 (glubina (car arr))) (glubina (cdr arr)))
	)
)	

(defun print-pretty (arr)
	(format t "Cписок = ~a, длина самой глубокой ветви => ~a~%" arr (glubina arr))
)

(print-pretty '(1 2 3))
(print-pretty '((1) (2) (3)))
(print-pretty '((1) (2 (4) 5) (3)))
(print-pretty '(((1 (4)))))
(print-pretty 5)

#|
Cписок = (1 2 3), длина самой глубокой ветви => 1
Cписок = ((1) (2) (3)), длина самой глубокой ветви => 2
Cписок = ((1) (2 (4) 5) (3)), длина самой глубокой ветви => 3
Cписок = (((1 (4)))), длина самой глубокой ветви => 4
Cписок = 5, длина самой глубокой ветви => 0
|#