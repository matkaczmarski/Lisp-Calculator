(defun PolyDerivative(poli)
"Zwraca pochodna wielomianu"
	(if  (= (length poli) 1)
		(if (not (= (GetPower (first poli)) 0))
			(cons (list (* (GetFactor (first poli)) (GetPower (first poli))) (- (GetPower (first poli)) 1)) nil)
		)
		(if (= (GetPower (first poli)) 0)
			(PolyDerivative (rest poli))
			(cons (list (* (GetFactor (first poli)) (GetPower (first poli))) (- (GetPower (first poli)) 1)) (PolyDerivative (rest poli)))
		)	
    )
)

(defmacro PolyDerivativeM(poli)
"Zwraca pochodna wielomianu"
	(if (and (not (eq nil poli)) (> (GetPower (first poli)) 0))
	    (remove nil (cons (list `(* ,(GetFactor (first poli)) ,(GetPower (first poli))) `(- ,(GetPower (first poli)) 1)) ,(PolyDerivativeM (rest poli))))
    )
)

(polyderivativem '((3 0) (5 1) (2 2) (2 3)))
(polyderivative '((3 0) (5 1) (2 2) (2 3)))
