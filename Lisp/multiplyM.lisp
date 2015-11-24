(defmacro multiply-macro (x &rest y)
	(cond 
	    ((null y)
		    x)
		(t 
		    ``(* ,,x ,(multiply-macro ,@y)))
	)
)