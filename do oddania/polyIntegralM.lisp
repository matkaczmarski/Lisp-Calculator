(defmacro PolyIntegral-macro(a0 &rest a)
"Zwraca pochodną wielomianu"
	(cond
	    ((null a)
	        0)
	    (t
	        ``(cons 0 ,(helper 1 ,a0 ,@a)))
	)
)
(defmacro helper(n a0 &rest a)
    (cond
        ((null a)
            ``(cons (* (/ 1 ,,n) ,,a0) nil))
        (t
            ``(cons (* (/ 1 ,,n) ,,a0) ,(helper (+ ,n 1) ,@a)))
    )
)
(setq x (PolyIntegral-macro 1 2 3 4 5))
(print x)
(print (eval x))