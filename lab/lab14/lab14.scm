(define (split-at lst n)
  (cond ((null? lst) (cons '() '()))
        ((= n 0) (cons '() lst))
        (else (define split (split-at (cdr lst) (- n 1)))
              (cons (cons (car lst) (car split)) (cdr split)) )
  )
)

        


(define (compose-all funcs)
  (define (double-compose func1 func2) (lambda (x) (func1 (func2 x))))
  (cond ((null? funcs) (lambda (x) x))
        (else (double-compose (compose-all (cdr funcs)) (car funcs))) 
  )
)

