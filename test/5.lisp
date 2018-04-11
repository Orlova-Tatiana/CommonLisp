;;; Написать алгоритм сортировки слиянием согласно функции сравнения двух элементом
;;; и удалить элементы, не удовлетворяющие условию.
;;; В качестве элементов взять учеников (Имя, Группа, Средний бал)
;;; Сортировать в порядке (Группа - имя)
;;; Удалить тех, чем бал меньше либо равен 4

(defun split (arr n)
	(if (= n 0)
		(list Nil arr)
		(let ((ans (split (cdr arr) (- n 1))))
			(cons (cons (car arr) (car ans)) (cdr ans))
		)
	)
)

(defun my-merge (arr1 arr2 compare)
	(cond
		((null arr1) arr2)
		((null arr2) arr1)
		((= -1 (funcall compare (car arr1) (car arr2))) (cons (car arr1) (my-merge (cdr arr1) arr2 compare)))
		(T (cons (car arr2) (my-merge (cdr arr2) arr1 compare)))
	)
)

(defun merge-sort (arr compare)
	(if (<= (length arr) 1)
		arr
		(let ((ans (split arr (floor (length arr) 2))))
			(my-merge (merge-sort (car ans) compare) (merge-sort (cadr ans) compare) compare)
		)
	)
)

(defun my-remove-if (predicate arr)
	(mapcan
		(lambda (x to-remove)
			(if to-remove Nil (list x))
		)
		arr (mapcar predicate arr)
	)
)

(defun person (person group name mark)
	(setf (get person 'group) group)
	(setf (get person 'name) name)
	(setf (get person 'mark) mark)
)

(person 'Tanya 401 "Tanya" 5)
(person 'Dima 401 "Dima" 5)
(person 'Yulya 401 "Yulya" 4.9)
(person 'Vasya 402 "Vasya" 4)
(person 'Masha 204 "Masha" 4.1)
(person 'Misha 203 "Misha" 2)
(person 'Kostik 606 "Kostik" 4.5)

(setq people (list 'Tanya 'Dima 'Yulya 'Vasya 'Masha 'Misha 'Kostik))

(defun compare (person1 person2)
	(let
		(
			(group1 (get person1 'group))
			(group2 (get person2 'group))
			(name1 (get person1 'name))
			(name2 (get person2 'name))
		)
		(cond
			((< group1 group2) -1)
			((> group1 group2) 1)
			((string< name1 name2) -1)
			((string> name1 name2) 1)
			(T 0)
		)
	)
)

(defun filter-func (person)
	(<= (get person 'mark) 4)
)

(setq sorted-people (merge-sort people 'compare))
(print sorted-people)
(print (remove-if 'filter-func sorted-people))

#|
(MISHA MASHA DIMA TANYA YULYA VASYA KOSTIK)
(MASHA DIMA TANYA YULYA KOSTIK)
|#
