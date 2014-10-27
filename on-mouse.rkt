;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname on-mouse) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (lookup x) ;finds column/row event occurs in
  (cond
  [(and (<= x 75) (>= x 0)) 0]
  [(and (<= x 150) (>= x 76)) 1]
  [(and (<= x 225) (>= x 151)) 2]
  [(and (<= x 300) (>= x 226)) 3]
  [(and (<= x 375) (>= x 301)) 4]
  [(and (<= x 450) (>= x 376)) 5]
  [(and (<= x 525) (>= x 451)) 6]
  [(and (<= x 600) (>= x 526)) 7]
  [else #f]
  ))

(define (rev-vals x) ;reverses column values between true and false
  (not x))

(define (write-col ls pos)
  (cond
  [(= pos 0) (list (rev-vals (list-ref ls 0)) (list-ref ls 1) (list-ref ls 2) (list-ref ls 3) (list-ref ls 4) (list-ref ls 5) (list-ref ls 6) (list-ref ls 7))]
  [(= pos 1) (list (list-ref ls 0) (rev-vals (list-ref ls 1)) (list-ref ls 2) (list-ref ls 3) (list-ref ls 4) (list-ref ls 5) (list-ref ls 6) (list-ref ls 7))]
  [(= pos 2) (list (list-ref ls 0) (list-ref ls 1) (rev-vals (list-ref ls 2)) (list-ref ls 3) (list-ref ls 4) (list-ref ls 5) (list-ref ls 6) (list-ref ls 7))]
  [(= pos 3) (list (list-ref ls 0) (list-ref ls 1) (list-ref ls 2) (rev-vals (list-ref ls 3)) (list-ref ls 4) (list-ref ls 5) (list-ref ls 6) (list-ref ls 7))]
  [(= pos 4) (list (list-ref ls 0) (list-ref ls 1) (list-ref ls 2) (list-ref ls 3) (rev-vals (list-ref ls 4)) (list-ref ls 5) (list-ref ls 6) (list-ref ls 7))]
  [(= pos 5) (list (list-ref ls 0) (list-ref ls 1) (list-ref ls 2) (list-ref ls 3) (list-ref ls 4) (rev-vals (list-ref ls 5)) (list-ref ls 6) (list-ref ls 7))]
  [(= pos 6) (list (list-ref ls 0) (list-ref ls 1) (list-ref ls 2) (list-ref ls 3) (list-ref ls 4) (list-ref ls 5) (rev-vals (list-ref ls 6)) (list-ref ls 7))]
  [(= pos 7) (list (list-ref ls 0) (list-ref ls 1) (list-ref ls 2) (list-ref ls 3) (list-ref ls 4) (list-ref ls 5) (list-ref ls 6) (rev-vals (list-ref ls 7)))]
  [else #f]))
  

(define (write-world w x y)
  (cond
    [(= (lookup x) 0) (make-world (make-array (write-col (array-c1 (world-grid w)) (lookup y)) (array-c2 (world-grid w)) (array-c3 (world-grid w)) (array-c4 (world-grid w)) (array-c5 (world-grid w)) (array-c6 (world-grid w)) (array-c7 (world-grid w)) (array-c8 (world-grid w))) (world-time w))]
    [(= (lookup x) 1) (make-world (make-array (array-c1 (world-grid w)) (write-col (array-c2 (world-grid w)) (lookup y)) (array-c3 (world-grid w)) (array-c4 (world-grid w)) (array-c5 (world-grid w)) (array-c6 (world-grid w)) (array-c7 (world-grid w)) (array-c8 (world-grid w))) (world-time w))]
    [(= (lookup x) 2) (make-world (make-array (array-c1 (world-grid w)) (array-c2 (world-grid w)) (write-col (array-c3 (world-grid w)) (lookup y)) (array-c4 (world-grid w)) (array-c5 (world-grid w)) (array-c6 (world-grid w)) (array-c7 (world-grid w)) (array-c8 (world-grid w))) (world-time w))]
    [(= (lookup x) 3) (make-world (make-array (array-c1 (world-grid w)) (array-c2 (world-grid w)) (array-c3 (world-grid w)) (write-col (array-c4 (world-grid w)) (lookup y)) (array-c5 (world-grid w)) (array-c6 (world-grid w)) (array-c7 (world-grid w)) (array-c8 (world-grid w))) (world-time w))]
    [(= (lookup x) 4) (make-world (make-array (array-c1 (world-grid w)) (array-c2 (world-grid w)) (array-c3 (world-grid w)) (array-c4 (world-grid w)) (write-col (array-c5 (world-grid w)) (lookup y)) (array-c6 (world-grid w)) (array-c7 (world-grid w)) (array-c8 (world-grid w))) (world-time w))]
    [(= (lookup x) 5) (make-world (make-array (array-c1 (world-grid w)) (array-c2 (world-grid w)) (array-c3 (world-grid w)) (array-c4 (world-grid w)) (array-c5 (world-grid w)) (write-col (array-c6 (world-grid w)) (lookup y)) (array-c7 (world-grid w)) (array-c8 (world-grid w))) (world-time w))]
    [(= (lookup x) 6) (make-world (make-array (array-c1 (world-grid w)) (array-c2 (world-grid w)) (array-c3 (world-grid w)) (array-c4 (world-grid w)) (array-c5 (world-grid w)) (array-c6 (world-grid w)) (write-col (array-c7 (world-grid w)) (lookup y)) (array-c8 (world-grid w))) (world-time w))]
    [(= (lookup x) 7) (make-world (make-array (array-c1 (world-grid w)) (array-c2 (world-grid w)) (array-c3 (world-grid w)) (array-c4 (world-grid w)) (array-c5 (world-grid w)) (array-c6 (world-grid w)) (array-c7 (world-grid w)) (write-col (array-c8 (world-grid w)) (lookup y))) (world-time w))]
    ))
(define (mousefn w x y evt) 
  (cond
    [(string=? evt "button-down") (write-world w x y)]
    [else w]
    ))