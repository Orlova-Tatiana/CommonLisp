;;; 42. Определить максимальный элемент в дереве

(defun left (tree)
	(car tree)
)

(defun val (tree)
	(cadr tree)
)

(defun right (tree)
	(caddr tree)
)

(defun max2 (x y)
	(if (> x y)
		x
		y
	)
)

(defun tree-max (tree)
	(if (null tree)
		0
		(max2 (max2 (tree-max (left tree)) (val tree)) (tree-max (right tree)))
	)
)

(defun print-pretty (tree)
	(format t "Дерево = ~a, максимальный элемент => ~a~%" tree (tree-max tree))
)

(setq *tree1* 
	(list
		(list
			Nil
			5
			(list Nil 7 Nil)
		)
		2
		(list
			(list Nil 3 Nil)
			6
			(list Nil 1 Nil)
		)
	)
)

(setq *tree2* 
	(list
		(list
			(list Nil 4 Nil)
			5
			(list Nil 3 Nil)
		)
		6
		(list
			(list Nil 3 Nil)
			9
			(list Nil 1 Nil)
		)
	)
)

(print-pretty *tree1*)
(print-pretty *tree2*)

#|
Дерево = ((NIL 5 (NIL 7 NIL)) 2 ((NIL 3 NIL) 6 (NIL 1 NIL))), максимальный элемент => 7
Дерево = (((NIL 4 NIL) 5 (NIL 3 NIL)) 6 ((NIL 3 NIL) 9 (NIL 1 NIL))), максимальный элемент => 9
|#