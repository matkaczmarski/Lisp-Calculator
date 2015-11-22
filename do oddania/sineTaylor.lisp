(defun Radians2Degrees (r) 
"Konwerter radianow na stopnie"
	(* 180.0 (/ r pi)))

(defun Degrees2Radians (d)
"Konwerter stopni do radianow"
	(* pi (/ d 180.0)))

(defun Normalize (x)
"Normalizacja x do przedzialu [-pi pi]"
    (- x (* (round (/ x (* 2 pi))) 2 pi)))

(defun factorial (n)
  (if (< n 2)
      1
    (* n (factorial(- n 1)))))

(defun SineTaylor(x maxIter)
"Rozwiniecie Taylora dla iter iteracji"
	(SineTaylorRec (Normalize x) 0 maxIter))


(defun SineTaylorRec(rad iter maxIter)
"Funkcja rekurencyjna dla rozwiniecia taylora"
	(if (>= iter maxIter)
		0
		(+ (/ (* (expt -1 iter) (expt rad (+ (* 2 iter) 1))) (factorial (+ (* 2 iter) 1))) (SineTaylorRec rad (+ iter 1) maxIter))))

(defmacro SineTaylor-macro(x maxIter)
"Rozwiniecie Taylora dla iter iteracji"
	`(SineTaylorRec-macro ,x 0 ,maxIter))


(defmacro SineTaylorRec-macro(rad iter maxIter)
"Funkcja rekurencyjna dla rozwiniecia taylora"
	(if (>= iter maxIter)
		0
		``(+ (/ (* (expt -1 ,,iter) (expt ,,rad (+ (* 2 ,,iter) 1))) (factorial (+ (* 2 ,,iter) 1))) ,(SineTaylorRec-macro ,rad ,(+ iter 1) ,maxIter))))

