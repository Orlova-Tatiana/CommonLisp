;;; 3. Определите лисповскую форму (IF условие p q) в виде макроса.

(defmacro my-if (condition yes no)
	`(cond
		(,condition ,yes)
		(T ,no)
	)
)

(print (my-if (= 1 1) 'yes 'no))
(print (my-if (= 1 2) 'yes 'no))

#|
YES
NO
|#
