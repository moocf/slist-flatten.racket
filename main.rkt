#lang racket

; (slist.flatten-sexp-to sexp to): SE X L -> L
; return list of symbols in sexp added to list "to"
(define slist.flatten-sexp-to
  (lambda (sexp to)
    (if (not (list? sexp))
        (cons sexp to)
        (slist.flatten-to sexp to))))

; (slist.flatten-to slist to): SL X L -> L
; returns list of symbols in slist added to list "to"
(define slist.flatten-to
  (lambda (slist to)
    (if (null? slist)
        to
        (slist.flatten-sexp-to (car slist) (slist.flatten-to (cdr slist) to)))))

; (slist.flatten slist): SL -> L
; returns list of symbols in slist in the same order
(define slist.flatten
  (lambda (slist)
    (slist.flatten-to slist (list))))
