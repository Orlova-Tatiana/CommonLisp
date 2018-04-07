;;; 8. ��������� ����������� ����� 1 2 3...

(defun generator ()
	(let
		((x 0))
		(lambda () (setq x (+ x 1)))
	)
)

(defun print-pretty (gen)
	(format t "��������� => ~a~%" (funcall gen))
)

(setq next-number1 (generator))
(setq next-number2 (generator))

(format t "next-number1:~%")
(print-pretty next-number1)
(print-pretty next-number1)
(print-pretty next-number1)

(format t "~%next-number2:~%")
(print-pretty next-number2)
(print-pretty next-number2)
(print-pretty next-number2)

#|
next-number1:
��������� => 1
��������� => 2
��������� => 3

next-number2:
��������� => 1
��������� => 2
��������� => 3
|#