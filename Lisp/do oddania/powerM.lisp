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

(print (power-macro 3 2))
(print (eval(power-macro 3 2)))

(setq x (power-macro '(+ a b) 3))

(setf a 1)
(setf b 3)

(print x)
(print (eval x))