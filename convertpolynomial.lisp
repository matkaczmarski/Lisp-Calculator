(defmacro ConvertPolynomial(poli)
"Wielomian postaci '( (factor1 power1) (factor2 power2) itd.) zamienia na postac wykonywalna wstawiajac x."
	`(if (eq nil ,poli)
		nil
		`(+ ,@(ConvertPolynomialRec ,poli))))

(defmacro ConvertPolynomialRec(poli)
"Makro pomocnicze"
	`(if (= (length ,poli) 1)
		`((* ,(GetFactor (first ,poli)) (expt x ,(GetPower (first ,poli))))) 
		`((* ,(GetFactor (first ,poli)) (expt x ,(GetPower (first ,poli)))) ,@(ConvertPolynomialRec (rest ,poli)) )))