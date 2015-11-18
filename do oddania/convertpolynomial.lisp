(defmacro ConvertPolynomial(poli x)
"Wielomian postaci '( (factor1 power1) (factor2 power2) itd.) zamienia na postac wykonywalna wstawiajac x."
	`(if (eq nil ,poli)
		nil
		`(+ ,@(ConvertPolynomialRec ,poli ,x))))

(defmacro ConvertPolynomialRec(poli x)
"Makro pomocnicze"
	`(if (= (length ,poli) 1)
		`((* ,(GetFactor (first ,poli)) (expt ,,x ,(GetPower (first ,poli))))) 
		`((* ,(GetFactor (first ,poli)) (expt ,,x ,(GetPower (first ,poli)))) ,@(ConvertPolynomialRec (rest ,poli) ,x) )))

(setf p (ConvertPolynomial '((1 0) (2 1) (2 2)) '(+ y x) ))