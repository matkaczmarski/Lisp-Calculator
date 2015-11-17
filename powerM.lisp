(defmacro powerM (x y)
    `(cond
        ((= ,y 0)
            1)
        ((> ,y 0)
            `(* ,,x ,(powerM ,x (- ,y 1))))
        ((< ,y 0)
            `(* (/ 1 ,,x) ,(powerM ,x (+ ,y 1))))
    )
)