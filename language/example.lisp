(require "./lang.lisp")

(defun revert (acc x)
	(if (listp acc)
		(cons x acc)
		(list acc x)
	)
)

;;; Примеры
(=> (1 2 3) + (3 4 5) * (1 2 3) / (4 4 4) => print) ; (1 3 6)

(=> (1 2 3 4 5) -> revert => print)

(=> (1 2 3) => cdr => print) ; (1 2 3)

(=> (1 2 3) + 5 => print) ; (6 7 8)

(=> 3 + 4 * self => print) ; 49

;;; Скалярное произведение
(=> (1 2 3) * (3 4 5) -> + => print) ; 26

;;; Модуль вектора
(=> (2 4 4) * self -> + -> sqrt => print) ; 6

(=> (2 4 4) expt 2 -> + -> sqrt => print) ; 6