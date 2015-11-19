(defmacro srm(x y)
    ``(/ (+ ,,x ,,y) 2)
)

(defmacro median-macro (&rest y)
    (cond
        ((null y)
            0)
        ((= (length y) 1)
            `(first (list ,@y)))
        ((= (length y) 2)
             `(srm (first (list ,@y)) (first (rest (list ,@y))) ))
	    (t
	        `(median-macro ,@(rest (butlast (apply `list y))))
	   )
	)
)

(print (median-macro 1 2 3 3 4 5))
(print (eval(median-macro 1 2 3 3 4 5)))
(print (median-macro 1 2 3))
(print (eval(median-macro 1 2 3)))
(print (median-macro 1 2))
(print (eval(median-macro 1 2)))

