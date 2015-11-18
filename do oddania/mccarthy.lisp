(defun McCarthy(n)
"Funkcja Ackermanna"
	(if (> n 100)
		(- n 10)
		(McCarthy (McCarthy (+ n 11)))))

(defun TestMcCarthy () 
"Testowanie Funkcji Ackermanna"
	(check (= (McCarthy 87) 91))
	(check (= (McCarthy 90) 91))
	(check (= (McCarthy 95) 91))
	(check (= (McCarthy 99) 91))
	(check (= (McCarthy 100) 91))
	(check (= (McCarthy 101) 91))
	(check (= (McCarthy 102) 92))
	(check (= (McCarthy 103) 93))
	(check (= (McCarthy 104) 94))
	(check (= (McCarthy 105) 95))
)