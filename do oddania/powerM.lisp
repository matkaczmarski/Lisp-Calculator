(defmacro power-macro (x y)
    `(cond
        ((= ,y 0)
            1)
        ((> ,y 0)
            `(* ,,x ,(power-macro ,x (- ,y 1))))
        ((< ,y 0)
            `(* (/ 1 ,,x) ,(power-macro ,x (+ ,y 1))))
    )
)