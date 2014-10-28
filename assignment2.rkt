;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname assignment2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;Including required libraries, and the infamous both function
(require 2htdp/image)
(require 2htdp/universe)
(require rsound)
(define (both a b) b)

;Draw Function
; Draws 8x8 grid with squares filled in marked by the world
; world -> image

; Function for empty/filled button
; if true, the button is filled, otherwise
; the button is empty.
(define (button filled?)
  (if filled? (overlay (square 74 'solid 'red)
                       (square 75 'solid 'black))
      (square 75 'outline 'black)))

; number -> image
; Makes a slider depending on what the 
; tempo of the world is
(define (temposlider tempo)
  (above (text "Tempo" 20 'brown)
         (overlay/offset (circle 10 'solid 'blue)
                  0 (* 5 (- 15.5 tempo))
                  (rectangle 10 168 'solid 'black))))

; world -> image
; Draws world from structure given by big bang
(define (renderfn world)
  (place-image/align (drawfn (world-grid world))
                     0 0
                     "left" "top"
                      (place-image (pause-button (world-playing? world))
                                  800 100
                                  (place-image (circle 10 'solid 'blue)
                                  (coldotx (world-col world)) (+ (* 75 8) 30)
                                  (place-image resetbutton
                                               800 250
                                               (place-image (temposlider (world-tempo world))
                                                            800 500
                                               (empty-scene 1000 (* 75 9))))))))

; number -> number
; returns the x value of where the 
; blue dot should be depending on
; which column is playing
(define (coldotx colnum)
  (cond [(= colnum 1) 37]
        [(= colnum 2) (+ 37 75)]
        [(= colnum 3) (+ 37 (* 75 2))]
        [(= colnum 4) (+ 37 (* 75 3))]
        [(= colnum 5) (+ 37 (* 75 4))]
        [(= colnum 6) (+ 37 (* 75 5))]
        [(= colnum 7) (+ 37 (* 75 6))]
        [(= colnum 0) (+ 37 (* 75 7))]))

; image
(define pausebars
  (overlay/offset (rectangle 20 70 'solid 'red)
                  30 0 (rectangle 20 70 'solid 'red)))

;image
(define resetbutton
  (place-image (text "RESET" 24 'blue)
               50 50
               (square 100 'solid 'red)))

; Boolean -> image
; if handed false, produces pausebars
; otherwise produces the playing triangle
(define (pause-button bool)
  (place-image
   (cond 
     [(not bool) pausebars]
     [else (rotate 270 (isosceles-triangle 70 35 'solid 'green))]
         )
   50 50
   (square 100 'solid 'black)))


; grid -> image
; Places eight columns next to each other
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
; Produces a column based on the list
; places a button for each spot on the
; list.
(define (colrender collist) 
  (above (button (list-ref collist 0))
          (button (list-ref collist 1))
          (button (list-ref collist 2))
          (button (list-ref collist 3))
          (button (list-ref collist 4))
          (button (list-ref collist 5))
          (button (list-ref collist 6))
          (button (list-ref collist 7))))
; seconds to frames
(define (s n)(* n 44100))

(define ps (make-pstream))

;one frame of silence, played
(define sil (silence 100))

;the default number of ticks per beat
(define tempo 20)


;called by tock function, determines which sounds to play when it is time t play a column
(define (sound-col col w)
  (rs-overlay* (list
                (if (list-ref col 0) (make-tone 523.25 .125 (round(s (/ (world-tempo w) 27)))) sil)
                (if (list-ref col 1) (make-tone 493.88 .125 (round(s (/ (world-tempo w) 27)))) sil)
                (if (list-ref col 2) (make-tone 440.00 .125 (round(s (/ (world-tempo w) 27)))) sil)
                (if (list-ref col 3) (make-tone 392.00 .125 (round(s (/ (world-tempo w) 27)))) sil)
                (if (list-ref col 4) (make-tone 349.23 .125 (round(s (/ (world-tempo w) 27)))) sil)
                (if (list-ref col 5) (make-tone 329.63 .125 (round(s (/ (world-tempo w) 27)))) sil)
                (if (list-ref col 6) (make-tone 293.66 .125 (round(s (/ (world-tempo w) 27)))) sil)
                (if (list-ref col 7) (make-tone 261.63 .125 (round(s (/ (world-tempo w) 27)))) sil))))
;tock function
(define (tock w)(cond
                   [(not (world-playing? w)) w]
                   [(< (world-tick w) (world-tempo w)) (make-world (world-grid w) (world-col w) (+ (world-tick w) 1) (world-tempo w) true)]
                   [(>= (world-tick w) (world-tempo w)) (cond
                       [(= (world-col w) 0) (both (pstream-play ps (sound-col (grid-c0 (world-grid w)) w)) (make-world (world-grid w) (+ (world-col w) 1) 0 (world-tempo w) true))]
                       [(= (world-col w) 1) (both (pstream-play ps (sound-col (grid-c1 (world-grid w)) w)) (make-world (world-grid w) (+ (world-col w) 1) 0 (world-tempo w) true))]
                       [(= (world-col w) 2) (both (pstream-play ps (sound-col (grid-c2 (world-grid w)) w)) (make-world (world-grid w) (+ (world-col w) 1) 0 (world-tempo w) true))]
                       [(= (world-col w) 3) (both (pstream-play ps (sound-col (grid-c3 (world-grid w)) w)) (make-world (world-grid w) (+ (world-col w) 1) 0 (world-tempo w) true))]
                       [(= (world-col w) 4) (both (pstream-play ps (sound-col (grid-c4 (world-grid w)) w)) (make-world (world-grid w) (+ (world-col w) 1) 0 (world-tempo w) true))]
                       [(= (world-col w) 5) (both (pstream-play ps (sound-col (grid-c5 (world-grid w)) w)) (make-world (world-grid w) (+ (world-col w) 1) 0 (world-tempo w) true))]
                       [(= (world-col w) 6) (both (pstream-play ps (sound-col (grid-c6 (world-grid w)) w)) (make-world (world-grid w) (+ (world-col w) 1) 0 (world-tempo w) true))]
                       [(= (world-col w) 7) (both (pstream-play ps (sound-col (grid-c7 (world-grid w)) w)) (make-world (world-grid w) 0 0 (world-tempo w) true))]
                   )]
                   ))

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
  [else 99]
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
  [else ls]))

(define (playpauselookup x y)
  (and (and (<= x 850) (>= x 750)) (and (<= y 150) (>= y 50))))
(define (resetlookup x y)
  (and (and (<= x 850) (>= x 750)) (and (<= y 300) (>= y 200))))
  
(define (write-world w x y)
  (cond
    [(playpauselookup x y) (make-world (world-grid w) (world-col w) (world-tick w) (world-tempo w) (not (world-playing? w)))]
    [(resetlookup x y) (make-world (make-grid INITIAL_COLUMN INITIAL_COLUMN INITIAL_COLUMN INITIAL_COLUMN INITIAL_COLUMN INITIAL_COLUMN INITIAL_COLUMN INITIAL_COLUMN) (world-col w) (world-tick w) (world-tempo w) (world-playing? w))] 
    [(= (lookup x) 0) (make-world (make-grid (write-col (grid-c0 (world-grid w)) (lookup y)) (grid-c1 (world-grid w)) (grid-c2 (world-grid w)) (grid-c3 (world-grid w)) (grid-c4 (world-grid w)) (grid-c5 (world-grid w)) (grid-c6 (world-grid w)) (grid-c7 (world-grid w))) (world-col w) (world-tick w) (world-tempo w) (world-playing? w))]
    [(= (lookup x) 1) (make-world (make-grid (grid-c0 (world-grid w)) (write-col (grid-c1 (world-grid w)) (lookup y)) (grid-c2 (world-grid w)) (grid-c3 (world-grid w)) (grid-c4 (world-grid w)) (grid-c5 (world-grid w)) (grid-c6 (world-grid w)) (grid-c7 (world-grid w))) (world-col w) (world-tick w) (world-tempo w) (world-playing? w))]
    [(= (lookup x) 2) (make-world (make-grid (grid-c0 (world-grid w)) (grid-c1 (world-grid w)) (write-col (grid-c2 (world-grid w)) (lookup y)) (grid-c3 (world-grid w)) (grid-c4 (world-grid w)) (grid-c5 (world-grid w)) (grid-c6 (world-grid w)) (grid-c7 (world-grid w))) (world-col w) (world-tick w) (world-tempo w) (world-playing? w))]
    [(= (lookup x) 3) (make-world (make-grid (grid-c0 (world-grid w)) (grid-c1 (world-grid w)) (grid-c2 (world-grid w)) (write-col (grid-c3 (world-grid w)) (lookup y)) (grid-c4 (world-grid w)) (grid-c5 (world-grid w)) (grid-c6 (world-grid w)) (grid-c7 (world-grid w))) (world-col w) (world-tick w) (world-tempo w) (world-playing? w))]
    [(= (lookup x) 4) (make-world (make-grid (grid-c0 (world-grid w)) (grid-c1 (world-grid w)) (grid-c2 (world-grid w)) (grid-c3 (world-grid w)) (write-col (grid-c4 (world-grid w)) (lookup y)) (grid-c5 (world-grid w)) (grid-c6 (world-grid w)) (grid-c7 (world-grid w))) (world-col w) (world-tick w) (world-tempo w) (world-playing? w))]
    [(= (lookup x) 5) (make-world (make-grid (grid-c0 (world-grid w)) (grid-c1 (world-grid w)) (grid-c2 (world-grid w)) (grid-c3 (world-grid w)) (grid-c4 (world-grid w)) (write-col (grid-c5 (world-grid w)) (lookup y)) (grid-c6 (world-grid w)) (grid-c7 (world-grid w))) (world-col w) (world-tick w) (world-tempo w) (world-playing? w))]
    [(= (lookup x) 6) (make-world (make-grid (grid-c0 (world-grid w)) (grid-c1 (world-grid w)) (grid-c2 (world-grid w)) (grid-c3 (world-grid w)) (grid-c4 (world-grid w)) (grid-c5 (world-grid w)) (write-col (grid-c6 (world-grid w)) (lookup y)) (grid-c7 (world-grid w))) (world-col w) (world-tick w) (world-tempo w) (world-playing? w))]
    [(= (lookup x) 7) (make-world (make-grid (grid-c0 (world-grid w)) (grid-c1 (world-grid w)) (grid-c2 (world-grid w)) (grid-c3 (world-grid w)) (grid-c4 (world-grid w)) (grid-c5 (world-grid w)) (grid-c6 (world-grid w)) (write-col (grid-c7 (world-grid w)) (lookup y))) (world-col w) (world-tick w) (world-tempo w) (world-playing? w))]
    [(and (= (lookup x) 8) (or (= (lookup y) 0) (= (lookup y) 1))) (make-world (make-grid (grid-c0 (world-grid w)) (grid-c1 (world-grid w)) (grid-c2 (world-grid w)) (grid-c3 (world-grid w)) (grid-c4 (world-grid w)) (grid-c5 (world-grid w)) (grid-c6 (world-grid w)) (grid-c7 (world-grid w))) (world-col w) (world-tick w) (world-tempo w) (not (world-playing? w)))]
    [else w]
    ))
(define (mousefn w x y evt) 
  (cond
    [(string=? evt "button-down") (write-world w x y)]
    [else w]
    ))
(define (testtempo x key)
  (cond
    [(and (= x 30) (key=? key "down")) 30]
    [(and (= x 1) (key=? key "up")) 1]
    [(key=? key "down") (add1 x)]
    [(key=? key "up") (sub1 x)]
    [else x]
    ))

(define (keyfn w key)
  (cond
    [(key=? "down" key) (make-world (world-grid w) (world-col w) (world-tick w) (testtempo (world-tempo w) key) (world-playing? w))]
    [(key=? "up" key) (make-world (world-grid w) (world-col w) (world-tick w) (testtempo (world-tempo w) key) (world-playing? w))]
    [else w]
    ))
  
(define-struct world (grid col tick tempo playing?))

(define-struct grid (c0 c1 c2 c3 c4 c5 c6 c7))

(define INITIAL_COLUMN (list false false false false false false false false))
(define INITIAL (make-world (make-grid INITIAL_COLUMN INITIAL_COLUMN INITIAL_COLUMN INITIAL_COLUMN                                 
                                       INITIAL_COLUMN INITIAL_COLUMN INITIAL_COLUMN INITIAL_COLUMN)
                          0 0 tempo true))

(big-bang INITIAL
          [to-draw renderfn]
          [on-mouse mousefn]
          [on-tick tock]
          [on-key keyfn]
          )
