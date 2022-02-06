#lang racket

; 黑箱子
#|
(define (square x) (* x x)) ; 第一个箱子

(define (square x) ; 第二个箱子
  (exp (double (log x))))
(define (double x) (+ x x))

 局部名
(define (square x) (* x x)) ; 过程的意义应该不依赖于其作者为形式参数所选用的名字
(define (square y) (* y y))
(define (good-enough? guess x) ; good-enough? 的x 于square x 互不相干
   (< (abs (- (square guess) x)) 0.001)) 
|#

; 内部定义和块结构
#|
(define (sqrt x)
  (sqrt-iter 1.0 x))
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))
(define (improve guess x)
  (average guess (/ x guess)))
(define (average x y)
  (/ (+ x y) 2))
|#

; 将这一系列定义局部化
; 这种嵌套的定义称为块结构
#|(define (sqrt x)
  (define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess x)
    (define (average x y)
  (/ (+ x y) 2))
    (average guess (/ x guess)))
  (define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)))
  (sqrt-iter 1.0 x))
|#  
; 让sqrt的 x 显示地被内部调用
#|(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (define (average x y)
      (/ (+ x y) 2))
    (average guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))
|#

; Racket下使用 letrec 的实现
#|
(define (sqrt x)
  (letrec ([sqrt-iter (lambda (guess)
                        (if (good-enough? guess)
                            guess
                            (sqrt-iter (improve guess))))]
         [good-enough? (lambda (guess)
                         (< (abs (- (square guess) x)) 0.001))]
         [improve (lambda (guess)
                    (average guess (/ x guess)))]
         [average (lambda (x y)
                    (/ (+ x y) 2))]
         [square (lambda (x) (* x x))])
    (sqrt-iter 1.0)))
|#