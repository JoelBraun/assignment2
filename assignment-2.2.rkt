;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname assignment-2.2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(require rsound)
(require 2htdp/image)
(require 2htdp/universe)

(define snd0 (rs-scale 0.5 (rs-read "logon.wav")))
(define snd1 (rs-scale 0.5 (rs-read "logon.wav")))
(define snd2 (rs-scale 0.5 (rs-read "logon.wav")))
(define snd3 (rs-scale 0.5 (rs-read "logon.wav")))

(define-struct loopstate (s1 s2 s3 s4 v1 v2 v3 v4))

(big-bang (make-loopstate 0 0 0 0 0 0 0 0)
          [on-mouse mm]
          [on-tick tt]
          [to-draw draw-world]
 