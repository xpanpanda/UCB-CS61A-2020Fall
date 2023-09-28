(define (filter-lst fn lst)
  (cond ((null? lst) '() )
        ((fn (car lst)) (cons (car lst) (filter-lst fn (cdr lst))))
        (else (filter-lst fn (cdr lst)))
  )
)

;;; Tests
(define (even? x)
  (= (modulo x 2) 0))
(filter-lst even? '(0 1 1 2 3 5 8))
; expect (0 2 8)


(define (interleave first second)
  (cond ((null? first) second)
        ((null? second) first)
        (else (cons (car first) (interleave second (cdr first))) )
  )
)

(interleave (list 1 3 5) (list 2 4 6))
; expect (1 2 3 4 5 6)

(interleave (list 1 3 5) nil)
; expect (1 3 5)

(interleave (list 1 3 5) (list 2 4))
; expect (1 2 3 4 5)


(define (accumulate combiner start n term)
  
    (define (multiple-combiner i result)
      (if (> i n) result (multiple-combiner (+ i 1) (combiner result (term i)))))

    (multiple-combiner 1 start)
  
)


(define (no-repeats lst)
  (define new_lst (list))
  
  (define (memo x lst)
    (cond ((null? lst) #f)
          ((equal? x (car lst)) #t)
          (else (memo x (cdr lst)))))
  
  (define (helper x)
    (if (memo x new_lst)
        #f
        (begin (set! new_lst (cons x new_lst)) #t)))
  
  (filter helper lst))



