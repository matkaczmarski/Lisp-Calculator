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
