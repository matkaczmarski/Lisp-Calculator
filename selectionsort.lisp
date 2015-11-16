(defun MaxElement(list max)
"Najwiekszy element z listy"
	(if (eq nil list)
		max
		(if (> max (first list))
			(MaxElement (rest list) max)
			(MaxElement (rest list) (first list))))
)

(defun MinElement(list min)
"Najmniejszy element z listy"
	(if (eq nil list)
		min
		(if (< min (first list))
			(MinElement (rest list) min)
			(MinElement (rest list) (first list))))
)

(defun RemoveElement(list element)
"Usuwa element z list"
	(if (eq nil list)
		nil
		(if (equal (first list) element)
			(rest list)
			(cons (first list) (RemoveElement (rest list) element))))
)

(defun SelectionSort(list)
"Sortowanie przez wybor"
	(if (eq nil list)
		nil
			(let ((minVal (MinElement list (first list))))
				(cons minVal (SelectionSort (RemoveElement list minVal)))
			))
)