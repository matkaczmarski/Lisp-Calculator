(defun PolyDerivative(poli)
"Zwraca pochodną wielomianu"
	(if (and (not (eq nil poli)) (> (GetPower (first poli)) 0))
	    (remove nil (cons (list (* (GetFactor (first poli)) (GetPower (first poli))) (- (GetPower (first poli)) 1)) (PolyDerivative (rest poli))))
    )
)