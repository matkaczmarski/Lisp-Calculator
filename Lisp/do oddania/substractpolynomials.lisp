(defun NegativePolynomial(p)
"Zmiana znaku przy czynnikach skladnikow wielomianu p"
	(if (eq nil p)
		nil
		(cons (list (* -1 (GetFactor (first p))) (GetPower (first p))) (NegativePolynomial (rest p)))))
		
(defun SubstractPolynomials (p1 p2)
"Odejmowanie wielomianów postaci '( (factor1 power1) (factor2 power2) itd.)
Wymagania: skladniki wielomianow posortowane rosnaco wzgledem stopnia poteg"
	(let ((comp1 (first p1))
		 (comp2 (first p2)))
	(cond ((eq nil comp1)
			(NegativePolynomial p2))
		  ((eq nil comp2)
			p1)
		  ((= (GetPower comp1) (GetPower comp2))
			(cons (list (- (GetFactor comp1) (GetFactor comp2)) (GetPower comp1)) (SubstractPolynomials (rest p1) (rest p2))))
		  ((< (GetPower comp1) (GetPower comp2))
			(cons comp1 (SubstractPolynomials (rest p1) p2)))
		  ((> (GetPower comp1) (GetPower comp2))
			(cons (list (* -1 (GetFactor comp2)) (GetPower comp2)) (SubstractPolynomials p1 (rest p2)))))))


(defun SubstractPolynomialsTest () 
"Testowanie dodawania wielomianow"
	(check (equal (SubstractPolynomials '((1 1) (1 2)) '((1 1) (1 2))) '((0 1) (0 2))))
	(check (equal (SubstractPolynomials '((14 0) (3 2) (17 4)) '((3 1) (2 3))) '((14 0) (-3 1) (3 2) (-2 3) (17 4))))
	(check (equal (SubstractPolynomials '((1 0) (1 1) (1 2)) '((1 0) (1 1) (1 2))) '((0 0) (0 1) (0 2))))
	(check (equal (SubstractPolynomials '((1 0) (1 1) (1 2) (1 3) (1 4) (1 5)) '()) '((1 0) (1 1) (1 2) (1 3) (1 4) (1 5))))
	(check (equal (SubstractPolynomials '() '((1 0) (1 1) (1 2) (1 3) (1 4) (1 5))) '((-1 0) (-1 1) (-1 2) (-1 3) (-1 4) (-1 5))))
	(check (equal (SubstractPolynomials '((1 0) (1 1) (1 2) (1 3) (1 4) (1 5)) '((-1 0) (-1 1) (-1 2) (-1 3) (-1 4) (-1 5)) ) '((2 0) (2 1) (2 2) (2 3) (2 4) (2 5))))
)