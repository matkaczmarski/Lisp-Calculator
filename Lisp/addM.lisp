(defmacro add-macro (x &rest y)
	(cond 
	    ((null y)
		    x)
		(t 
		    ``(+ ,,x ,(add-macro ,@y)))
	)
)

(setq x (addm '(+ a b) 'd 'c 'a `(* c b a)))

(setf a 1)
(setf b 2)
(setf c 3)
(setf d 4)

(print x)
(write (eval x))