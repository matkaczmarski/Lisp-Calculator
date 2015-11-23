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


(defmacro factorial-macro (n)
  (if (< n 2)
      1
    ``(* ,,n ,@(factorial-macroRec ,(- n 1)))))

(defmacro factorial-macroRec (n)
  (if (< n 2)
       ''(1)
     ``(,,n ,@(factorial-macroRec ,(- n 1)))))

(defmacro SineTaylor-macro(x maxIter)
"Rozwiniecie Taylora dla iter iteracji"
	`(SineTaylorRec-macro ,x 0 ,maxIter))


(defmacro SineTaylorRec-macro(rad iter maxIter)
"Funkcja rekurencyjna dla rozwiniecia taylora"
	(if (>= iter maxIter)
		0
		``(+ (/ (* (expt -1 ,,iter) (expt ,,rad (+ (* 2 ,,iter) 1))) ,(factorial-macro ,(+ (* 2 iter) 1))) ,(SineTaylorRec-macro ,rad ,(+ iter 1) ,maxIter))))


;; --------- inna forma zapisu sumy ------------

;(defmacro SineTaylor-macro(x maxIter)
;"Rozwiniecie Taylora dla iter iteracji"
;	(if (<= maxIter 0)
;		0
;		``(+ (/ (* (expt -1 0) (expt ,,x  1)) ,(factorial-macro 1)) ,@(SineTaylorRec-macro ,x 1 ,maxIter))))
;		;`(SineTaylorRec-macro ,x 0 ,maxIter))


;(defmacro SineTaylorRec-macro(rad iter maxIter)
;"Funkcja rekurencyjna dla rozwiniecia taylora"
;	(if (>= iter maxIter)
;		''(0)
;		``((/ (* (expt -1 ,,iter) (expt ,,rad (+ (* 2 ,,iter) 1))) ,(factorial-macro ,(+ (* 2 iter) 1))) ,@(SineTaylorRec-macro ,rad ,(+ iter 1) ,maxIter))))

; jeszcze inna forma zapisu z bardziej wyliczonymi wspolczynnikami
;(defmacro SineTaylor-macro(x maxIter)
;"Rozwiniecie Taylora dla iter iteracji"
;	`(SineTaylorRec-macro ,x 0 ,maxIter))


;(defmacro SineTaylorRec-macro(rad iter maxIter)
;"Funkcja rekurencyjna dla rozwiniecia taylora"
;	(if (>= iter maxIter)
;		0
;		``(+ (/ (* ,(expt -1 ,iter) (expt ,,rad ,(+ (* 2 ,iter) 1))) ,(factorial-macro ,(+ (* 2 iter) 1))) ,(SineTaylorRec-macro ,rad ,(+ iter 1) ,maxIter))))


;               Test dla funkcji
; dla 20 stopni odpowiednio dla sin i cos: 0.342	0.9397
(SineTaylor (Degrees2radians 20) 10)
(CosTaylor (Degrees2radians 20) 10)
; dla 45 stopni odpowiednio dla sin i cos: 0.7071	0.7071
(SineTaylor (Degrees2radians 45) 10)
(CosTaylor (Degrees2radians 45) 10)
; dla 45 stopni odpowiednio dla sin i cos: 1	0
(SineTaylor (Degrees2radians 90) 10)
(CosTaylor (Degrees2radians 90) 10)

;                Test dla makr
(setf s (SineTaylor-macro 'x 12))
(setf x (Degrees2radians 45))
(eval s)

(setf c (CosTaylor-macro 'y 12))
(setf y (Degrees2radians 45))
(eval c)