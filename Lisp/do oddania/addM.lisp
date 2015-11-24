(defmacro add-macro (x &rest y)
	(cond 
	    ((null y)
		    x)
		(t 
		    ``(+ ,,x ,(add-macro ,@y)))
	)
)

(print (add-macro 1 2 3 4))
(print (eval(add-macro 1 2 3 4)))
(print (add-macro `(* 5 2)  1))
(print (eval(add-macro `(* 5 2)  1)))
(print (add-macro `(+ (* 5 2) 3) `(+ 3 4)))
(print (eval(add-macro `(+ (* 5 2) 3) `(+ 3 4))))
