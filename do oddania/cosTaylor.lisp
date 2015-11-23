(defun CosTaylor(x maxIter)
"Rozwiniecie Taylora dla iter iteracji"
	(CosTaylorRec (Normalize x) 0 maxIter))


(defun CosTaylorRec(rad iter maxIter)
"Funkcja rekurencyjna dla rozwiniecia taylora"
	(if (>= iter maxIter)
		0
		(+ (/ (* (expt -1 iter) (expt rad (* 2 iter) )) (factorial (* 2 iter))) (CosTaylorRec rad (+ iter 1) maxIter))))



(defmacro CosTaylor-macro(x maxIter)
"Rozwiniecie Taylora dla iter iteracji"
	`(CosTaylorRec-macro ,x 0 ,maxIter))


(defmacro CosTaylorRec-macro(rad iter maxIter)
"Funkcja rekurencyjna dla rozwiniecia taylora"
	(if (>= iter maxIter)
		0
		``(+ (/ (* (expt -1 ,,iter) (expt ,,rad (* 2 ,,iter) )) ,(factorial-macro ,(* 2 iter))) ,(CosTaylorRec-macro ,rad ,(+ iter 1) ,maxIter))))

