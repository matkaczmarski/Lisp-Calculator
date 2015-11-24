(defmacro minus-macro (x &rest y)
	(cond 
	    ((null y)
		    x)
		(t 
		    ``(- ,,x ,(minus-macro ,@y)))
	)
)