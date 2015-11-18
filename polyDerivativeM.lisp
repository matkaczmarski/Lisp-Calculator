(defmacro PolyDerivative-macro(a0 &rest a)
"Zwraca pochodną wielomianu"
	(cond
	    ((null a)
	        0)
	    (t
	        `(helper 1 ,@a))
	)
)
(defmacro helper(n a0 &rest a)
    (cond
        ((null a)
            ``(cons (* ,,n ,,a0) nil))
        (t
            ``(cons (* ,,n ,,a0) ,(helper (+ ,n 1) ,@a)))
    )
)
(setq x (PolyDerivative-macro 1 2 3 4 5))
(print x)
(print (eval x))