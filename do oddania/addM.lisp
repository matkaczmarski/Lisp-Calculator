(defmacro add-macro (x &rest y)
	(cond 
	    ((null y)
		    x)
		(t 
		    ``(+ ,,x ,(add-macro ,@y)))
	)
)

(defun AddMacroTest () 
"Testowanie Makra Dodawania"
	(check (= (add-macro 1 2 3 4) 10))
	(check (= (add-macro `(* 5 2)  1) 11))
	(check (= (add-macro `(+ (* 5 2) 3) `(+ 3 4)) 20))
)