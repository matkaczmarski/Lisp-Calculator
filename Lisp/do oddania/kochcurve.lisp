(defun KochCurveLength(l n)
"Dlugosc krzywej Kocha po n iteracjach dla odcinka o poczatkowej dlugosci l"
	(if (zerop n)
		l
		(* (KochCurveLength l (- n 1)) 4/3)))

(defun FloatKochCurveLength(l n)
"Lepszy zapis dlugosci krzywej Kocha"
	(float (KochCurveLength l n)))

(defun KochCurveLengthTest () 
"Testowanie Funkcji Ackermanna"
	(check (= (KochCurveLength 1 0) 1))
	(check (= (KochCurveLength 1 1) 4/3))
	(check (= (KochCurveLength 1 2) 16/9))
	(check (= (KochCurveLength 1 3) 64/27))
	(check (= (KochCurveLength 1 4) 256/81))
	(check (= (KochCurveLength 2 0) 2))
	(check (= (KochCurveLength 2 1) 8/3))
	(check (= (KochCurveLength 2 2) 32/9))
	(check (= (KochCurveLength 2 3) 128/27))
	(check (= (KochCurveLength 2 4) 512/81))
)