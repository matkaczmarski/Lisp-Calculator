(defun PolyIntegral(poli)
"Zwraca całkę wielomianu"
    (if (not (eq nil poli))
	   (remove nil (cons (list (/ (GetFactor (first poli)) (+ (GetPower (first poli)) 1)) (+ (GetPower (first poli)) 1)) (PolyIntegral (rest poli))))
	   )
)