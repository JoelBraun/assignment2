;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname assignment2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;Including required libraries, and the infamous both function
(require 2htdp/image)
(require 2htdp/universe)
(require rsound)
(require rsound/piano-tones)
(define (both a b) b)
(define SPACE_DIST 20)
(define SQUARE_WIDTH 50)

;plays a sound based on list lookup
(define (playsnd x) 
  (cond
    [(= x 0) (play (piano-tone 69))]
    [(= x 1) (play (piano-tone 70))]
    [(= x 2) (play (piano-tone 71))]
    [(= x 3) (play (piano-tone 72))]
    [(= x 4) (play (piano-tone 73))]
    [(= x 5) (play (piano-tone 74))]
    [(= x 6) (play (piano-tone 75))]
    [(= x 7) (play (piano-tone 76))]
    ))
;iterates through lists to determine 
(define (fortestsub y x) (if (= (list-ref y x ) 1) (playsnd x) (silence 1)))
(define (fortest y) 
  (for-each (lambda (i) (fortestsub y i)) '(0 1 2 3 4 5 6 7) )
  )
;Initial function definitions
(define (tickfn w) 
  (cond
    [(= (modulo (world-time w) 1) 1) (both (fortest (array-c1 (world-grid w))) (make-world (world-grid w) (+ (world-time w) 1)))]
    [(= (modulo (world-time w) 2) 2) (both (fortest (array-c2 (world-grid w))) (make-world (world-grid w) (+ (world-time w) 1)))]
    [(= (modulo (world-time w) 3) 3) (both (fortest (array-c3 (world-grid w))) (make-world (world-grid w) (+ (world-time w) 1)))]
    [(= (modulo (world-time w) 4) 4) (both (fortest (array-c4 (world-grid w))) (make-world (world-grid w) (+ (world-time w) 1)))]
    [(= (modulo (world-time w) 5) 5) (both (fortest (array-c5 (world-grid w))) (make-world (world-grid w) (+ (world-time w) 1)))]
    [(= (modulo (world-time w) 6) 6) (both (fortest (array-c6 (world-grid w))) (make-world (world-grid w) (+ (world-time w) 1)))]
    [(= (modulo (world-time w) 7) 7) (both (fortest (array-c7 (world-grid w))) (make-world (world-grid w) (+ (world-time w) 1)))]
    [(= (modulo (world-time w) 8) 8) (both (fortest (array-c8 (world-grid w))) (make-world (world-grid w) (+ (world-time w) 1)))]
    [else w]
  )
  )

;interpretation system to determine square states
(define (interp-sys x) 
  (cond 
    [(= x 1) "solid"]
    [else "outline"]
    )
  )
  
(define (drawfn w) 
  ;column 1
  (place-image (square SQUARE_WIDTH (interp-sys (list-ref (array-c1 (world-grid w)) 0) ) "red")
  SPACE_DIST SPACE_DIST
  (place-image (square SQUARE_WIDTH (interp-sys (list-ref (array-c1 (world-grid w)) 1) ) "red")
  SPACE_DIST (* 4 SPACE_DIST)
  (place-image (square SQUARE_WIDTH (interp-sys (list-ref (array-c1 (world-grid w)) 2) ) "red")
  SPACE_DIST (* 8 SPACE_DIST)
  (place-image (square SQUARE_WIDTH (interp-sys (list-ref (array-c1 (world-grid w)) 3) ) "red")
  SPACE_DIST (* 12 SPACE_DIST)
  (place-image (square SQUARE_WIDTH (interp-sys (list-ref (array-c1 (world-grid w)) 4) ) "red")
  SPACE_DIST (* 16 SPACE_DIST)
  (place-image (square SQUARE_WIDTH (interp-sys (list-ref (array-c1 (world-grid w)) 5) ) "red")
  SPACE_DIST (* 20 SPACE_DIST)
  (place-image (square SQUARE_WIDTH (interp-sys (list-ref (array-c1 (world-grid w)) 6) ) "red")
  SPACE_DIST (* 24 SPACE_DIST)
  (place-image (square SQUARE_WIDTH (interp-sys (list-ref (array-c1 (world-grid w)) 7) ) "red")
  SPACE_DIST (* 28 SPACE_DIST)
  ;column 2
  (place-image (square SQUARE_WIDTH (interp-sys (list-ref (array-c2 (world-grid w)) 0) ) "red")
  (* 4 SPACE_DIST) SPACE_DIST
  (place-image (square SQUARE_WIDTH (interp-sys (list-ref (array-c2 (world-grid w)) 1) ) "red")
  (* 4 SPACE_DIST) (* 4 SPACE_DIST)
  (place-image (square SQUARE_WIDTH (interp-sys (list-ref (array-c2 (world-grid w)) 2) ) "red")
  (* 4 SPACE_DIST) (* 8 SPACE_DIST)
  (place-image (square SQUARE_WIDTH (interp-sys (list-ref (array-c2 (world-grid w)) 3) ) "red")
  (* 4 SPACE_DIST) (* 12 SPACE_DIST)
  (place-image (square SQUARE_WIDTH (interp-sys (list-ref (array-c2 (world-grid w)) 4) ) "red")
  (* 4 SPACE_DIST) (* 16 SPACE_DIST)
  (place-image (square SQUARE_WIDTH (interp-sys (list-ref (array-c2 (world-grid w)) 5) ) "red")
  (* 4 SPACE_DIST) (* 20 SPACE_DIST)
  (place-image (square SQUARE_WIDTH (interp-sys (list-ref (array-c2 (world-grid w)) 6) ) "red")
  (* 4 SPACE_DIST) (* 24 SPACE_DIST)
  (place-image (square SQUARE_WIDTH (interp-sys (list-ref (array-c2 (world-grid w)) 7) ) "red")
  (* 4 SPACE_DIST) (* 28 SPACE_DIST)
  ;column 3
  (place-image (square SQUARE_WIDTH (interp-sys (list-ref (array-c3 (world-grid w)) 0) ) "red")
  (* 8 SPACE_DIST) SPACE_DIST
  (place-image (square SQUARE_WIDTH (interp-sys (list-ref (array-c3 (world-grid w)) 1) ) "red")
  (* 8 SPACE_DIST) (* 4 SPACE_DIST)
  (place-image (square SQUARE_WIDTH (interp-sys (list-ref (array-c3 (world-grid w)) 2) ) "red")
  (* 8 SPACE_DIST) (* 8 SPACE_DIST)
  (place-image (square SQUARE_WIDTH (interp-sys (list-ref (array-c3 (world-grid w)) 3) ) "red")
  (* 8 SPACE_DIST) (* 12 SPACE_DIST)
  (place-image (square SQUARE_WIDTH (interp-sys (list-ref (array-c3 (world-grid w)) 4) ) "red")
  (* 8 SPACE_DIST) (* 16 SPACE_DIST)
  (place-image (square SQUARE_WIDTH (interp-sys (list-ref (array-c3 (world-grid w)) 5) ) "red")
  (* 8 SPACE_DIST) (* 20 SPACE_DIST)
  (place-image (square SQUARE_WIDTH (interp-sys (list-ref (array-c3 (world-grid w)) 6) ) "red")
  (* 8 SPACE_DIST) (* 24 SPACE_DIST)
  (place-image (square SQUARE_WIDTH (interp-sys (list-ref (array-c3 (world-grid w)) 7) ) "red")
  (* 8 SPACE_DIST) (* 28 SPACE_DIST)
  ;column 4
   (place-image (square SQUARE_WIDTH (interp-sys (list-ref (array-c4 (world-grid w)) 0) ) "red")
  (* 12 SPACE_DIST) SPACE_DIST
  (place-image (square SQUARE_WIDTH (interp-sys (list-ref (array-c4 (world-grid w)) 1) ) "red")
  (* 12 SPACE_DIST) (* 4 SPACE_DIST)
  (place-image (square SQUARE_WIDTH (interp-sys (list-ref (array-c4 (world-grid w)) 2) ) "red")
  (* 12 SPACE_DIST) (* 8 SPACE_DIST)
  (place-image (square SQUARE_WIDTH (interp-sys (list-ref (array-c4 (world-grid w)) 3) ) "red")
  (* 12 SPACE_DIST) (* 12 SPACE_DIST)
  (place-image (square SQUARE_WIDTH (interp-sys (list-ref (array-c4 (world-grid w)) 4) ) "red")
  (* 12 SPACE_DIST) (* 16 SPACE_DIST)
  (place-image (square SQUARE_WIDTH (interp-sys (list-ref (array-c4 (world-grid w)) 5) ) "red")
  (* 12 SPACE_DIST) (* 20 SPACE_DIST)
  (place-image (square SQUARE_WIDTH (interp-sys (list-ref (array-c4 (world-grid w)) 6) ) "red")
  (* 12 SPACE_DIST) (* 24 SPACE_DIST)
  (place-image (square SQUARE_WIDTH (interp-sys (list-ref (array-c4 (world-grid w)) 7) ) "red")
  (* 12 SPACE_DIST) (* 28 SPACE_DIST)
  ;column 5
   (place-image (square SQUARE_WIDTH (interp-sys (list-ref (array-c5 (world-grid w)) 0) ) "red")
  (* 8 SPACE_DIST) SPACE_DIST
  (place-image (square SQUARE_WIDTH (interp-sys (list-ref (array-c5 (world-grid w)) 1) ) "red")
  (* 8 SPACE_DIST) (* 4 SPACE_DIST)
  (place-image (square SQUARE_WIDTH (interp-sys (list-ref (array-c5 (world-grid w)) 2) ) "red")
  (* 8 SPACE_DIST) (* 8 SPACE_DIST)
  (place-image (square SQUARE_WIDTH (interp-sys (list-ref (array-c5 (world-grid w)) 3) ) "red")
  (* 8 SPACE_DIST) (* 12 SPACE_DIST)
  (place-image (square SQUARE_WIDTH (interp-sys (list-ref (array-c5 (world-grid w)) 4) ) "red")
  (* 8 SPACE_DIST) (* 16 SPACE_DIST)
  (place-image (square SQUARE_WIDTH (interp-sys (list-ref (array-c5 (world-grid w)) 5) ) "red")
  (* 8 SPACE_DIST) (* 20 SPACE_DIST)
  (place-image (square SQUARE_WIDTH (interp-sys (list-ref (array-c5 (world-grid w)) 6) ) "red")
  (* 8 SPACE_DIST) (* 24 SPACE_DIST)
  (place-image (square SQUARE_WIDTH (interp-sys (list-ref (array-c5 (world-grid w)) 7) ) "red")
  (* 8 SPACE_DIST) (* 28 SPACE_DIST)
  ;column 6
   (place-image (square SQUARE_WIDTH (interp-sys (list-ref (array-c6 (world-grid w)) 0) ) "red")
  (* 8 SPACE_DIST) SPACE_DIST
  (place-image (square SQUARE_WIDTH (interp-sys (list-ref (array-c6 (world-grid w)) 1) ) "red")
  (* 8 SPACE_DIST) (* 4 SPACE_DIST)
  (place-image (square SQUARE_WIDTH (interp-sys (list-ref (array-c6 (world-grid w)) 2) ) "red")
  (* 8 SPACE_DIST) (* 8 SPACE_DIST)
  (place-image (square SQUARE_WIDTH (interp-sys (list-ref (array-c6 (world-grid w)) 3) ) "red")
  (* 8 SPACE_DIST) (* 12 SPACE_DIST)
  (place-image (square SQUARE_WIDTH (interp-sys (list-ref (array-c6 (world-grid w)) 4) ) "red")
  (* 8 SPACE_DIST) (* 16 SPACE_DIST)
  (place-image (square SQUARE_WIDTH (interp-sys (list-ref (array-c6 (world-grid w)) 5) ) "red")
  (* 8 SPACE_DIST) (* 20 SPACE_DIST)
  (place-image (square SQUARE_WIDTH (interp-sys (list-ref (array-c7 (world-grid w)) 6) ) "red")
  (* 8 SPACE_DIST) (* 24 SPACE_DIST)
  (place-image (square SQUARE_WIDTH (interp-sys (list-ref (array-c8 (world-grid w)) 7) ) "red")
  (* 8 SPACE_DIST) (* 28 SPACE_DIST)
  
  
  (empty-scene 1000 1000))))))))))))))))))))))))))))))))))))))))))))))))))
(define (is-validx? x)
  (number? (vlookup y)))
(define (is-validy? y)
  (number? (hlookup x)))

(define (hlookup x) ;need values to divide by, but this will tell the row the event occurs in
  (cond
  [(>= (<= x 75) 0) 0]
  [(>= (<= x 150) 76) 1]
  [(>= (<= x 225) 151) 2]
  [(>= (<= x 300) 226) 3]
  [(>= (<= x 375) 301) 4]
  [(>= (<= x 450) 376) 5]
  [(>= (<= x 525) 451) 6]
  [(>= (<= x 600) 526) 7]
  [else #f])
  )

(define (vlookup y) ;need values to divide by, but this will tell the column the event occurs in
  (cond 
    [(>= (<= x 75) 0) 0]
    [(>= (<= x 150) 76) 1]
    [(>= (<= x 225) 151) 2]
    [(>= (<= x 300) 226) 3]
    [(>= (<= x 375) 301) 4]
    [(>= (<= x 450) 376) 5]
    [(>= (<= x 525) 451) 6]
    [(>= (<= x 600) 526) 7]
    [else #f])
  )

(define (rev-vals x) 
  if (= 1 x) 0 1)

(define (write-col w x y)
  (cond
  [(= (vlookup y) 0) (list (rev-vals (list-ref (array-c1 (world-grid w)))) (list-ref (array-c1 (world-grid w) 1)) (list-ref (array-c1 (world-grid w) 2)) (list-ref (array-c1 (world-grid w) 3)) (list-ref (array-c1 (world-grid w) 4)) (list-ref (array-c1 (world-grid w) 5)) (list-ref (array-c1 (world-grid w) 6)) (list-ref (array-c1 (world-grid w) 7)))]
  [(= (vlookup y) 1) (list (list-ref (array-c2 (world-grid w)) 0) (rev-vals (list-ref (array-c2 (world-grid w) 1))) (list-ref (array-c2 (world-grid w)) 2) (list-ref (array-c2 (world-grid w)) 3) (list-ref (array-c2 (world-grid w)) 4) (list-ref (array-c2 (world-grid w)) 5) (list-ref (array-c2 (world-grid w)) 6) (list-ref (array-c2 (world-grid w)) 7))]
  [(= (vlookup y) 2) (list 1 0 0 0 0 0 0 0)]
  [(= (vlookup y) 3) (list 1 0 0 0 0 0 0 0)]
  [(= (vlookup y) 4) (list 1 0 0 0 0 0 0 0)]
  [(= (vlookup y) 5) (list 1 0 0 0 0 0 0 0)]
  [(= (vlookup y) 6) (list 1 0 0 0 0 0 0 0)]
  [(= (vlookup y) 7) (list 1 0 0 0 0 0 0 0)]
  [else #f]))
  

(define (write-world w x y)
  (cond
    [(= (hlookup x) 0) (make-world (make-array (write-col w x y) (array-c2 (world-grid w)) (array-c2 (world-grid w)) (array-c2 (world-grid w)) (array-c2 (world-grid w)) (array-c2 (world-grid w)) (array-c2 (world-grid w))
    [(= (hlookup x) 1) (make-world (world-grid))]
    [(= (hlookup x) 2) (make-world (world-grid))]
    [(= (hlookup x) 3) (make-world (world-grid))]
    [(= (hlookup x) 4) (make-world (world-grid))]
    [(= (hlookup x) 5) (make-world (world-grid))]
    [(= (hlookup x) 6) (make-world (world-grid))]
    [(= (hlookup x) 7) (make-world (world-grid))]
    
  

(define (lookup w x y)
  (cond
    [(and (is-validx? x) (is-validy? y)) (write-world w x y)]
    [else w]
     ))
(define (mousefn w x y evt) 
  (cond
    [(string=? evt "button-down") (lookup w x y)]
    [else w]
    ))
  
(define-struct world (grid time))
(define-struct array (c1 c2 c3 c4 c5 c6 c7 c8))
(define column (list 0 0 0 0 0 0 0 0))
(big-bang (make-world (make-array column column column column column column column column) 0)
          [to-draw drawfn]
          [on-mouse mousefn]
          [on-tick tickfn 1/8]
          )
