(defun GetFactor(component)
"Zwraca wartosc parametru w skladniku wielomianu"
	(first component))

(defun GetPower(component)
"Zwraca wartosc potegi w skladniku wielomianu"
	(first (rest component)))

(defun EvaluatePolynomial(poli x)
"Wielomian postaci '( (factor1 power1) (factor2 power2) itd.)"
	(if (eq nil poli)
		0
		(+ (EvaluatePolynomial (rest poli) x) (* (GetFactor (first poli)) (expt x (GetPower (first poli)))))))
		
