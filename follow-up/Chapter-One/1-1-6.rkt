#lang racket

; cond 是一种可多条件执行过程的形式,书写绝对值函数的一种方式:

(define (abs_1 x)

  (cond [(< x 0) (- x )]

        [else x]))

; if 是一种受限的特殊形式,书写绝对值函数的一种方式:

(define (abs_2 x)

  (if (< x 0)

      (- x)

      x))

; 逻辑复合运算符

; and
(define (test_1 t1)
  (if (and [> t1 1]
           [< t1 10]
           )
      t1
      (+ t1 1)))
(test_1 6)
(test_1 0)
(test_1 11)

; or
(define (test_2 t2)
  (if (or [> t2 1]
          [< t2 10]
          )
      t2
      (+ t2 1)))
(test_2 6)
(test_2 0)
(test_2 11)

; not
(define (test_3 t3)
  (if (not [> t3 1])
      t3
      (+ t3 1)))
(test_3 6)
(test_3 0)
