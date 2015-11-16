(defun AddPolynomials (p1 p2)
"Dodawanie wielomianów postaci '( (factor1 power1) (factor2 power2) itd.)
Wymagania: skladniki wielomianow posortowane rosnaco wzgledem stopnia poteg"
	(let ((comp1 (first p1))
		 (comp2 (first p2)))
	(cond ((eq nil comp1)
			p2)
		  ((eq nil comp2)
			p1)
		  ((= (GetPower comp1) (GetPower comp2))
			(cons (list (+ (GetFactor comp1) (GetFactor comp2)) (GetPower comp1)) (AddPolynomials (rest p1) (rest p2))))
		  ((> (GetPower comp1) (GetPower comp2))
			(cons comp2 (AddPolynomials p1 (rest p2))))
		  ((< (GetPower comp1) (GetPower comp2))
			(cons comp1 (AddPolynomials (rest p1) p2))))))

(defun AddPolynomialsTest () 
"Testowanie dodawania wielomianow"
	(check (equal (AddPolynomials '((1 1) (1 2)) '((1 1) (1 2))) '((2 1) (2 2))))
	(check (equal (AddPolynomials '((14 0) (3 2) (17 4)) '((3 1) (2 3))) '((14 0) (3 1) (3 2) (2 3) (17 4))))
	(check (equal (AddPolynomials '((1 0) (1 1) (1 2)) '((1 0) (1 1) (1 2))) '((2 0) (2 1) (2 2))))
	(check (equal (AddPolynomials '((1 0) (1 1) (1 2) (1 3) (1 4) (1 5)) '()) '((1 0) (1 1) (1 2) (1 3) (1 4) (1 5))))
	(check (equal (AddPolynomials '((-1 0) (-1 1) (-1 2) (-1 3) (-1 4) (-1 5)) '((1 0) (1 1) (1 2) (1 3) (1 4) (1 5))) '((0 0) (0 1) (0 2) (0 3) (0 4) (0 5))))
)