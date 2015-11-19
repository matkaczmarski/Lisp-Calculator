(defmacro multiply-macro (x &rest y)
	(cond 
	    ((null y)
		    x)
		(t 
		    ``(* ,,x ,(multiply-macro ,@y)))
	)
)

(print (multiply-macro 1 2 3 4))
(print (eval(multiply-macro 1 2 3 4)))
(print (multiply-macro `(* 5 2)  1))
(print (eval(multiply-macro `(* 5 2)  1)))
(print (multiply-macro `(+ (* 5 2) 3) `(+ 3 4)))
(print (eval(multiply-macro `(+ (* 5 2) 3) `(+ 3 4))))