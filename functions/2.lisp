;;; 2. Определить функционал (MAPLIST fn список)

(defun my-maplist (fn arr)
	(cond
		((null arr) Nil)
		(T (cons (funcall fn arr) (my-maplist fn (cdr arr))))
	)
)

(print (my-maplist 'identity '(1 2 3 4)))

#|
((1 2 3 4) (2 3 4) (3 4) (4))
|#