(defmacro srm(x y)
    ``(/ (+ ,,x ,,y) 2)
)

(defmacro median-macro (&rest y)
    (cond
        ((null y)
            0)
        ((= (length y) 1)
            ``(,,@y))
        ((= (length y) 2)
             `(srm (first (list ,@y)) (first (rest (list ,@y))) ))
	    (t
	        `(median-macro ,@(rest (butlast (apply `list y))))
	   )
	)
)