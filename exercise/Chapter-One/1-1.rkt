#lang racket

; 1.1 Below is a sequence of expressions.
; What is the result printed by the interpreter in response to each expression?
; Assume that the sequence is to be evaluated in the order in which it is presented.

10

(+ 5 3 4)

(- 9 1)

(/ 6 2)

(+ (* 2 4) (- 4 6))

(define a 3)

(define b (+ a 1))

(+ a b (* a b))

(= a b)

(if [and (> b a) (< b (* a b))]
    b
    a)

(cond [(= a 4) 6]
      [(= b 4) (+ 6 7 a)]
      [else 25])

(+ 2 (if (> b a) b a))

(* (cond [(> a b) a]
         [(< a b) b]
         [else -1])
   (+ a 1))

; 1.2 Translate the following expression into prefix form:
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
   (* 3 (- 6 2) (- 2 7)))

; 1.3 Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.
(define (three n1 n2 n3)
  (let ([sum-of-squares
         (lambda (x x2) (+ (* x x) (* x2 x2)))])
    (cond [(and (>= n1 n3) (>= n2 n3)) (sum-of-squares n1 n2)]
          [(and (>= n1 n2) (>= n3 n2)) (sum-of-squares n1 n3)]
          [(and (>= n2 n1) (>= n3 n1)) (sum-of-squares n2 n3)])))
(three 1 2 3)
(three 2 3 1)
(three 3 1 2)

; 1.4 Observe that our model of evaluation allows for combinations whose operators are compound expressions.
; Use this observation to describe the behavior of the following procedure:
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
; 过程：
; 函数 a-plus-abs-b 接受两个参数（a，b），
; 判断参数 b 是否大于 0，如果值为真，将 "+" 作为运算符，否则将 "-" 作为运算符。
; 描述：a + |b|

