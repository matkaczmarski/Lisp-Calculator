(defmacro max-macro (x &rest y)
    (cond
        ((null y)
            x)
	    (t
	        ``(if (> ,,x ,(max-macro ,@y))
	            ,,x
	            ,(max-macro ,@y))
	   )
	)
)

(setq x (maxM '(+ a b) 'd 'c 'a '(* a b c)))

(setf a 1)
(setf b 2)
(setf c 3)
(setf d 4)


(print x)
(write (eval x))