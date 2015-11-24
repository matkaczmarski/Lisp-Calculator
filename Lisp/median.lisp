(defun xyz (&rest y)
    (butlast (rest y))
    )

(defun sr(x y)
    (/ (+ x y) 2)
)

(defmacro medianm (&rest y)
    (cond
        ((null y)
            nil)
        ((= (length y) 1)
            y)
        ((= (length y) 2)
            sr(y))
            
	    (t
	        ``(,(medianm (xyz ,@y)))
	   )
	)
)

(print (xyz 1 2 3))

(setq x (medianm '(+ a b) 'd 'c 'a 'a))

(setf a 1)
(setf b 2)
(setf c 3)
(setf d 4)


(print x)
(write (eval x))