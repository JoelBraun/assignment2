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
  
(define-struct world (array time tempo col))
  
(big-bang (make-world )
          [to-draw drawfn]
          [on-mouse mousefn]
          [on-tick tickfn]
          )
