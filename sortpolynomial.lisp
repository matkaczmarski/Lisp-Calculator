(defun MinPower(poli minterm)
"Skladowa, dla ktorej wartosc potegi w wielomianie jest najmniejsza"
	(if (eq nil poli)
		minterm
		(if (<= (GetPower minterm) (GetPower (first poli)))
			(MinPower (rest poli) minterm)
			(MinPower (rest poli) (first poli))))
)

(defun RemoveTerm(poli power)
"Usuwa skladnik wielomianu o podanej potedze"
	(if (eq nil poli)
		nil
		(if (= (GetPower (first poli)) power)
			(rest poli)
			(cons (first poli) (RemoveTerm (rest poli) power))))
)

(defun SortPolynomial(poli)
"Sortowanie rosnaco skladnikow wielomianu po wartosci potegi"
	(if (eq nil poli)
		nil
			(let ((minTerm (MinPower poli (first poli))))
				(cons minTerm (SortPolynomial (RemoveTerm poli (GetPower minTerm))))
			))
)