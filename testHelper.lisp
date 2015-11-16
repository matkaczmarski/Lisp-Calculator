(defun report-result (result form)
  (format t "~:[FAILED~;passed~] ... ~a~%" result form))

(defmacro check (form)
  `(report-result ,form ',form))