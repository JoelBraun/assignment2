;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname assignment2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;Including required libraries, and the infamous both function
(require 2htdp/image)
(require 2htdp/universe)
(define (both a b) b)

;Initial function definitions
(define (tickfn w) ...)


;Draw Function
; Draws 8x8 grid with squares filled in marked by the world
; world -> image

; Function for empty/filled button
(define (button filled?)
  (if filled? (overlay (square 73 'solid 'red)
                       (square 75 'solid 'black))
      (square 75 'outline 'black)))


; world -> image
(define (renderfn world)
  (place-image/align (drawfn (world-grid world))
                     0 0
                     "left" "top"
                     (empty-scene 1000 (* 75 9))))


; grid -> image
(define (drawfn grid) 
  (beside (colrender (grid-c0 grid))
         (colrender (grid-c1 grid))
         (colrender (grid-c2 grid))
         (colrender (grid-c3 grid))
         (colrender (grid-c4 grid))
         (colrender (grid-c5 grid))
         (colrender (grid-c6 grid))
         (colrender (grid-c7 grid))))


; List -> image
(define (colrender collist) 
  (above (button (list-ref collist 0))
          (button (list-ref collist 1))
          (button (list-ref collist 2))
          (button (list-ref collist 3))
          (button (list-ref collist 4))
          (button (list-ref collist 5))
          (button (list-ref collist 6))
          (button (list-ref collist 7))))



(define (mousefn w x y evt) ...)
  
(define-struct world (grid col tick tempo playing?))


(define-struct grid (c0 c1 c2 c3 c4 c5 c6 c7))

(define INITIAL_COLUMN (list false false false false false false false false))
(define INITIAL (make-world (make-grid INITIAL_COLUMN INITIAL_COLUMN INITIAL_COLUMN INITIAL_COLUMN
                                       INITIAL_COLUMN INITIAL_COLUMN INITIAL_COLUMN INITIAL_COLUMN)
                            INITIAL_COLUMN 0 1 true))


(big-bang INITIAL
          [to-draw renderfn]
          [on-mouse mousefn]
          [on-tick tickfn]
          )
