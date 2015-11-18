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

(setq x (min-macro '(+ a b) 'd 'c 'a '(* a b c)))

(setf a 1)
(setf b 2)
(setf c 3)
(setf d 4)


(print x)
(write (eval x))