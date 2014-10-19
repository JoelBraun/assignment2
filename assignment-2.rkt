;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname assignment-2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(require rsound)
(require 2htdp/image)
(require 2htdp/universe)
;a necessary evil
(define (both a b) b)
;definition of sound files
(define snd0 (rs-scale 0.5 (rs-read "logon.wav")))
(define snd1 (rs-scale 0.5 (rs-read "logon.wav")))
(define snd2 (rs-scale 0.5 (rs-read "logon.wav"))) 
(define snd3 (rs-scale 0.5 (rs-read "logon.wav")))
(define snd4 (rs-scale 0.5 (rs-read "logon.wav")))
(define snd5 (rs-scale 0.5 (rs-read "logon.wav")))
(define snd6 (rs-scale 0.5 (rs-read "logon.wav")))
(define snd7 (rs-scale 0.5 (rs-read "logon.wav")))
;circle draw system
(define (drawcircs x) 
  (place-image (circle 10 (loopstate-s1 x) "red")
               80 50
               (place-image (circle 10 (loopstate-s2 x) "red")
                   160 50
                   (place-image (circle 10 (loopstate-s3 x) "red")
                                240 50
                                (place-image (circle 10 (loopstate-s4 x) "red")
                                             320 50
                                             (place-image (circle 10 (loopstate-s5 x) "red")
                                                          400 50
                                                          (place-image (circle 10 (loopstate-s6 x) "red")
                                                                       480 50
                                                                       (place-image (circle 10 (loopstate-s7 x) "red")
                                                                                    560 50
                                                                                    (place-image (circle 10 (loopstate-s8 x) "red")
                                                                                                 640 50
                                                                                                 (empty-scene 800 100))))))))))

;keytest
(define (keytest x ke)
    (cond 
    [(string=? ke "1") (make-loopstate (if (string=? (loopstate-s1 x) "solid") "outline" "solid") (loopstate-s2 x) (loopstate-s3 x) (loopstate-s4 x) (loopstate-s5 x) (loopstate-s6 x) (loopstate-s7 x) (loopstate-s8 x) (loopstate-s9 x))]
    [(string=? ke "2") (make-loopstate (loopstate-s1 x) (if (string=? (loopstate-s2 x) "solid") "outline" "solid") (loopstate-s3 x) (loopstate-s4 x) (loopstate-s5 x) (loopstate-s6 x) (loopstate-s7 x) (loopstate-s8 x) (loopstate-s9 x))]
    [(string=? ke "3") (make-loopstate (loopstate-s1 x) (loopstate-s2 x) (if (string=? (loopstate-s3 x) "solid") "outline" "solid") (loopstate-s4 x) (loopstate-s5 x) (loopstate-s6 x) (loopstate-s7 x) (loopstate-s8 x) (loopstate-s9 x))]
    [(string=? ke "4") (make-loopstate (loopstate-s1 x) (loopstate-s2 x) (loopstate-s3 x) (if (string=? (loopstate-s4 x) "solid") "outline" "solid") (loopstate-s5 x) (loopstate-s6 x) (loopstate-s7 x) (loopstate-s8 x) (loopstate-s9 x))]
    [(string=? ke "5") (make-loopstate (loopstate-s1 x) (loopstate-s2 x) (loopstate-s3 x) (loopstate-s4 x) (if (string=? (loopstate-s5 x) "solid") "outline" "solid") (loopstate-s6 x) (loopstate-s7 x) (loopstate-s8 x) (loopstate-s9 x))]
    [(string=? ke "6") (make-loopstate (loopstate-s1 x) (loopstate-s2 x) (loopstate-s3 x) (loopstate-s4 x) (loopstate-s5 x) (if (string=? (loopstate-s6 x) "solid") "outline" "solid") (loopstate-s7 x) (loopstate-s8 x) (loopstate-s9 x))]
    [(string=? ke "7") (make-loopstate (loopstate-s1 x) (loopstate-s2 x) (loopstate-s3 x) (loopstate-s4 x) (loopstate-s5 x) (loopstate-s6 x) (if (string=? (loopstate-s7 x) "solid") "outline" "solid") (loopstate-s8 x) (loopstate-s9 x))]
    [(string=? ke "8") (make-loopstate (loopstate-s1 x) (loopstate-s2 x) (loopstate-s3 x) (loopstate-s4 x) (loopstate-s5 x) (loopstate-s6 x) (loopstate-s7 x) (if (string=? (loopstate-s8 x) "solid") "outline" "solid") (loopstate-s9 x))]
    [else (make-loopstate (loopstate-s1 x) (loopstate-s2 x) (loopstate-s3 x) (loopstate-s4 x) (loopstate-s5 x) (loopstate-s6 x) (loopstate-s7 x) (loopstate-s8) (loopstate-s9 x))]
    )
  )
;loop state incrementer
(define (lss x)
  (cond
    [(and (= (modulo (loopstate-s9 x) 8) 1) (string=? (loopstate-s1 x) "solid")) (both (play snd0) (make-loopstate (loopstate-s1 x) (loopstate-s2 x) (loopstate-s3 x) (loopstate-s4 x) (loopstate-s5 x) (loopstate-s6 x) (loopstate-s7 x) (loopstate-s8 x) (+ 1 (loopstate-s9 x))))]
    [(and (= (modulo (loopstate-s9 x) 8) 2) (string=? (loopstate-s2 x) "solid")) (both (play snd1) (make-loopstate (loopstate-s1 x) (loopstate-s2 x) (loopstate-s3 x) (loopstate-s4 x) (loopstate-s5 x) (loopstate-s6 x) (loopstate-s7 x) (loopstate-s8 x) (+ 1 (loopstate-s9 x))))]
    [(and (= (modulo (loopstate-s9 x) 8) 3) (string=? (loopstate-s3 x) "solid")) (both (play snd2) (make-loopstate (loopstate-s1 x) (loopstate-s2 x) (loopstate-s3 x) (loopstate-s4 x) (loopstate-s5 x) (loopstate-s6 x) (loopstate-s7 x) (loopstate-s8 x) (+ 1 (loopstate-s9 x))))]
    [(and (= (modulo (loopstate-s9 x) 8) 4) (string=? (loopstate-s4 x) "solid")) (both (play snd3) (make-loopstate (loopstate-s1 x) (loopstate-s2 x) (loopstate-s3 x) (loopstate-s4 x) (loopstate-s5 x) (loopstate-s6 x) (loopstate-s7 x) (loopstate-s8 x) (+ 1 (loopstate-s9 x))))]
    [(and (= (modulo (loopstate-s9 x) 8) 5) (string=? (loopstate-s5 x) "solid")) (both (play snd4) (make-loopstate (loopstate-s1 x) (loopstate-s2 x) (loopstate-s3 x) (loopstate-s4 x) (loopstate-s5 x) (loopstate-s6 x) (loopstate-s7 x) (loopstate-s8 x) (+ 1 (loopstate-s9 x))))]
    [(and (= (modulo (loopstate-s9 x) 8) 6) (string=? (loopstate-s6 x) "solid")) (both (play snd5) (make-loopstate (loopstate-s1 x) (loopstate-s2 x) (loopstate-s3 x) (loopstate-s4 x) (loopstate-s5 x) (loopstate-s6 x) (loopstate-s7 x) (loopstate-s8 x) (+ 1 (loopstate-s9 x))))]
    [(and (= (modulo (loopstate-s9 x) 8) 7) (string=? (loopstate-s7 x) "solid")) (both (play snd6) (make-loopstate (loopstate-s1 x) (loopstate-s2 x) (loopstate-s3 x) (loopstate-s4 x) (loopstate-s5 x) (loopstate-s6 x) (loopstate-s7 x) (loopstate-s8 x) (+ 1 (loopstate-s9 x))))]
    [(and (= (modulo (loopstate-s9 x) 8) 8) (string=? (loopstate-s8 x) "solid")) (both (play snd7) (make-loopstate (loopstate-s1 x) (loopstate-s2 x) (loopstate-s3 x) (loopstate-s4 x) (loopstate-s5 x) (loopstate-s6 x) (loopstate-s7 x) (loopstate-s8 x) (+ 1 (loopstate-s9 x))))]
    [else (make-loopstate (loopstate-s1 x) (loopstate-s2 x) (loopstate-s3 x) (loopstate-s4 x) (loopstate-s5 x) (loopstate-s6 x) (loopstate-s7 x) (loopstate-s8 x) (+ 1 (loopstate-s9 x)))]
    )
    )

(define-struct loopstate (s1 s2 s3 s4 s5 s6 s7 s8 s9))
(big-bang (make-loopstate "outline" "outline" "outline" "outline" "outline" "outline" "outline" "outline" 0)
          [on-draw drawcircs]
          [on-key keytest]
          [on-tick lss 1/8]
           
         )
  