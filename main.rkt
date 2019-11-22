#lang racket

; (flatten.sexp sexp to): SE X L -> L
; return list of symbols in sexp added to list "to"
(define flatten.sexp
  (lambda (sexp to)
    (if (not (list? sexp))
        (cons sexp to)
        (flatten.slist sexp to))))

; (flatten.slist slist to): SL X L -> L
; returns list of symbols in slist added to list "to"
(define flatten.slist
  (lambda (slist to)
    (if (null? slist)
        to
        (flatten.sexp (car slist) (flatten.slist (cdr slist) to)))))

; (flatten slist): SL -> L
; returns list of symbols in slist in the same order
(define flatten
  (lambda (slist)
    (flatten.slist slist (list))))
