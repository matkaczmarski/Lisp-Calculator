(defmacro min-macro (x &rest y)
    (cond
        ((null y)
            x)
	    (t
	        ``(if (< ,,x ,(min-macro ,@y))
	            ,,x
	            ,(min-macro ,@y))
	   )
	)
)


(print (min-macro 3 2 4))
(print (eval(min-macro 3 2 4)))

(setq x (min-macro '(+ a b) 'd 'c 'a '(* a b c)))

(setf a 1)
(setf b 2)
(setf c 3)
(setf d 4)


(print x)
(print (eval x))