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
		(+ (* (GetFactor (first poli)) (expt x (GetPower (first poli)))) (EvaluatePolynomial (rest poli) x))))
		
(defmacro EvaluatePolynomialm(poli x)
"Wielomian postaci '( (factor1 power1) (factor2 power2) itd.)"
	`(if (eq nil ,poli)
		0
		`(+ (* ,(GetFactor (first ,poli)) (expt ,,x ,(GetPower (first ,poli)))) ,(EvaluatePolynomialm (rest ,poli) ,x) )))
		
(setq p (list (list 1 1) (list 2 2) (list 3 3)))
(print p)
(print (EvaluatePolynomialm p 2))


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
	(if (and (not (eq nil poli)) (> (GetPower (first poli)) 0))
	    (remove nil (cons (list (* (GetFactor (first poli)) (GetPower (first poli))) (- (GetPower (first poli)) 1)) (PolyDerivative (rest poli))))
    )
)

(defun PolyDerivativeM(poli)
"Zwraca pochodną wielomianu"
	(if (and (not (eq nil poli)) (> (GetPower (first poli)) 0))
	    (remove nil (cons (list `(* ,(GetFactor (first poli)) ,(GetPower (first poli))) `(- ,(GetPower (first poli)) 1)) (PolyDerivativeM (rest poli))))
    )
)
