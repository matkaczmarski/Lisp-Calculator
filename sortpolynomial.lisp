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
"Sortowanie rosnaco wyrazow wielomianu po wartosci potegi"
	(if (eq nil poli)
		nil
			(let ((minTerm (MinPower poli (first poli))))
				(cons minTerm (SortPolynomial (RemoveTerm poli (GetPower minTerm))))
			))
)

(defun SortPolynomialTest () 
"Testowanie sortowania wyrazow wielomianu"
	(check (equal (SortPolynomial '((1 2) (1 1) (1 0)) ) '((1 0) (1 1) (1 2))))
	(check (equal (SortPolynomial '((4 1) (5 2) (1 0)) ) '((1 0) (4 1) (5 2))))
	(check (equal (SortPolynomial '((1 2) (1 0) (3 10) (1 5)) ) '((1 0) (1 2) (1 5) (3 10))))
	(check (equal (SortPolynomial '((1 0) (1 4) (3 11) (1 54)) ) '((1 0) (1 4) (3 11) (1 54))))
	(check (equal (SortPolynomial '((4 2) (6 33) (3 62) (332 -1) (1 -33) (0 0) (24 453) (3 -4) )) '((1 -33) (3 -4) (332 -1) (0 0) (4 2) (6 33) (3 62) (24 453)) ))
)