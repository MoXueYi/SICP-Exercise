#lang racket

(provide square)

(define (square x)      (* x     x))
;  ^       ^    ^          ^     ^       
;  |       |    |          |     |  
; 定义    平方 某个东西     它 与 自身

(square 21)

(square (+ 2 5))

(square (square 3))

; 用 square 作为构件组成 x2 + y2
(define (sum-of-squares x y)
  (+ (square x) (square y)))
(sum-of-squares 3 4)

; 用 sum-of-squares 作为构件
(define (f a)
  (sum-of-squares (+ a 1) (* a 2)))
(f 5)