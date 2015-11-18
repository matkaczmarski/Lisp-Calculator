(defun GetFactor(component)
"Zwraca wartosc parametru w skladniku wielomianu"
	(first component))

(defun GetPower(component)
"Zwraca wartosc potegi w skladniku wielomianu"
	(first (rest component)))
	
(defun report-result (result form)
  (format t "~:[FAILED~;passed~] ... ~a~%" result form))

(defmacro check (form)
  `(report-result ,form ',form))