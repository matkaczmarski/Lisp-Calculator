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

(defmacro EvaluatePolynomialm(poli x)
"Wielomian postaci '( (factor1 power1) (factor2 power2) itd.)"
	`(if (eq nil ,poli)
		0
		`(+ ,(EvaluatePolynomialm (rest ,poli) ,x) (* ,(GetFactor (first ,poli)) (expt ,,x ,(GetPower (first ,poli)))))))
		
(defun GetFactor(component)
"Zwraca wartosc parametru w skladniku wielomianu"
	(first component))

(defun GetPower(component)
"Zwraca wartosc potegi w skladniku wielomianu"
	(first (rest component)))
	
(defun PolyDerivative(poli)
"Zwraca pochodną wielomianu"
	(if (not (eq nil poli))
    	(progn
    		(if (> (GetPower (first poli)) 0)
    		    (remove nil (cons (list (* (GetFactor (first poli)) (GetPower (first poli))) (- (GetPower (first poli)) 1)) (PolyDerivative (rest poli))))
    	    )
        )
    )
)