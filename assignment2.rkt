;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname assignment2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;Including required libraries, and the infamous both function
(require 2htdp/image)
(require 2htdp/universe)
(define (both a b) b)

;Initial function definitions
(define (tickfn w) ...)
(define (drawfn w) ...)
(define (mousefn w x y evt) ...)
  
(define-struct world (grid col tick))
(define-struct col (s0 s1 s2 s3 s4 s5 s6 s7))
(define-struct grid (c0 c1 c2 c3 c4 c5 c6 c7))
(define INITIAL (make-world (make-grid INITIAL_COLUMN INITIAL_COLUMN INITIAL_COLUMN INITIAL_COLUMN INITIAL_COLUMN INITIAL_COLUMN INITIAL_COLUMN INITIAL_COLUMN) INITIAL_COLUMN 0))
(define INITIAL_INITIAL_COLUMN (make-col 0 0 0 0 0 0 0 0 ))
(big-bang INITIAL
          [to-draw drawfn]
          [on-mouse mousefn]
          [on-tick tickfn]
          )