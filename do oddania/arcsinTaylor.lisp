(defun ArcSinTaylor(x maxIter)
"Rozwiniecie Taylora dla iter iteracji"
	(if (or (> x 1) (< x -1))
		nil
		(ArcSinTaylorRec  x 0 maxIter)))


(defun ArcSinTaylorRec(rad iter maxIter)
"Funkcja rekurencyjna dla rozwiniecia taylora"
	(if (>= iter maxIter)
		0
		(+ (/ (* (factorial (* 2 iter)) (expt rad (+ (* 2 iter) 1)))
			(* (expt 4 iter) (expt (factorial iter) 2) (+ (* 2 iter) 1)))
			(ArcSinTaylorRec rad (+ iter 1) maxIter))))


(defmacro ArcSinTaylor-macro(x maxIter)
"Rozwiniecie Taylora dla iter iteracji"
	`(ArcSinTaylorRec-macro ,x 0 ,maxIter))


(defmacro ArcSinTaylorRec-macro(rad iter maxIter)
"Funkcja rekurencyjna dla rozwiniecia taylora"
	(if (>= iter maxIter)
		0
		``(+ (/ (* ,(factorial-macro ,(* 2 iter)) (expt ,,rad (+ (* 2 ,,iter) 1)))
			(* (expt 4 ,,iter) (expt ,(factorial-macro ,iter) 2) (+ (* 2 ,,iter) 1)))
			,(ArcSinTaylorRec-macro ,rad ,(+ iter 1) ,maxIter))))


;testy dla arcsin
;arcsin dla 22 stopni:
(radians2degrees (arcsintaylor 0.3746 17))
;dla 40 stopni:
(radians2degrees (arcsintaylor 0.6428 10))
;dla 45 stopni
(radians2degrees (arcsintaylor 0.7071 10))
;dla 69 stopni
(radians2degrees (arcsintaylor 0.9336 12))

(setf tmp (Arcsintaylor-macro 'x 10))
(setf x 0.7071)
(Radians2degrees (eval tmp))