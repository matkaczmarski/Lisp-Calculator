(defun xyz (&rest y)
    (butlast (rest y))
    )

(defun sr(x y)
    (/ (+ x y) 2)
)

(defmacro xyzm(&rest y)
    (butlast (rest y))
    )

(defmacro srm(x y)
    ``(/ (+ ,,x ,,y) 2)
)

(defmacro medianm (&rest y)
    (cond
        ((null y)
            0)
        ((= (length y) 1)
            ``(,,@y))
        ((= (length y) 2)
             `(srm (first (list ,@y)) (first (rest (list ,@y))) ))
	    (t
	        `(medianm ,@(rest (butlast (apply `list y))))
	   )
	)
)

(medianm 1 2 3 4 5 6 7 8 9 10 11 12)

(print (xyz 1 2 3))

(setq x (medianm '(+ a b) 'd 'c 'a 'a))

(setf a 1)
(setf b 2)
(setf c 3)
(setf d 4)


(print x)
(write (eval x))