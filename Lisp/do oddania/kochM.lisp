(defmacro koch-macro (s n)
   `(if (= ,n 0)
        `(* ,,s 3)
        `(* ,(koch-macro ,s ,(- n 1)) (/ 4 3))
    )
)

(setq expr `(+ x 2))
(setq x 3)

(print (koch-macro expr 2))