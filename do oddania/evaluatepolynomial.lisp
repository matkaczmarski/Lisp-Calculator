(defun GetFactor(component)
"Zwraca wartosc parametru w skladniku wielomianu"
	(first component))

(defun GetPower(component)
"Zwraca wartosc potegi w skladniku wielomianu"
	(first (rest component)))
	
(defun EvaluatePolynomial(poli x)
"Zwraca wartosc wielomianu danego postaci '( (factor1 power1) (factor2 power2) itd.)"
	(if (eq nil poli)
		0
		(+ (* (GetFactor (first poli)) (expt x (GetPower (first poli)))) (EvaluatePolynomial (rest poli) x))))
		
(defmacro EvaluatePolynomialm(poli x)
"Wielomian postaci '( (factor1 power1) (factor2 power2) itd.)"
	`(if (eq nil ,poli)
		0
		`(+ (* ,(GetFactor (first ,poli)) (expt ,,x ,(GetPower (first ,poli)))) ,(EvaluatePolynomialm (rest ,poli) ,x) )))

		
(print (EvaluatePolynomial `((1 1) (2 2) (3 3)) 2))
(print (EvaluatePolynomialM `((1 1) (2 2) (3 3)) 2))
(print (eval(EvaluatePolynomialM `((1 1) (2 2) (3 3)) 2)))