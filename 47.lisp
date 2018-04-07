;;; 47. Удалить все свойства символа

(defun remove-svoystva (object)
	(let
		((svoystva (symbol-plist object)))
		(cond
			((null svoystva) Nil) ;return
			(T
				(remprop object (car svoystva))
				(remove-svoystva object)
			)
		)
	)
)

(defun print-pretty (city)
	(format t "City = ~a, property => ~a~%" city (symbol-plist city))
	(remove-svoystva city)
	(format t "Properties after removal => ~a~%" (symbol-plist city))
	(terpri)
)

(setf (get 'Simfer 'x) 1)
(setf (get 'Simfer 'y) 2)
(setf (get 'Simfer 'region) "Crimea")
(setf (get 'Piter 'x) 4)
(setf (get 'Piter 'y) -2)
(setf (get 'Piter 'country) "Russia")

(print-pretty 'Simfer)
(print-pretty 'Piter)

#|
Город = SIMFER, свойства => (REGION Crimea Y 2 X 1)
Свойства после удаления => NIL

Город = PITER, свойства => (COUNTRY Russia Y -2 X 4)
Свойства после удаления => NIL
|#