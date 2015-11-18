(defun Ackermann(m n)
"Funkcja Ackermanna"
	(if (zerop m)
		(+ n 1)
		(if (and (> m 0) (zerop n))
			(Ackermann (- m 1) 1)
			(Ackermann (- m 1) (Ackermann m (- n 1))))))


(defmacro Ackermann-macro(m n)
	(if (zerop m)
		(+ n 1)
		(if (and (> m 0) (zerop n))
			(Ackermann (- m 1) 1)
			(Ackermann (- m 1) (Ackermann m (- n 1))))))

(defun TestAckermann () 
"Testowanie Funkcji Ackermanna"
	(check (= (Ackermann 0 0) 1))
	(check (= (Ackermann 0 1) 2))
	(check (= (Ackermann 1 0) 2))
	(check (= (Ackermann 1 1) 3))
	(check (= (Ackermann 2 2) 7))
	(check (= (Ackermann 2 3) 9))
	(check (= (Ackermann 3 2) 29))
	(check (= (Ackermann 3 3) 61))
	(check (= (Ackermann 3 7) 1021))
)