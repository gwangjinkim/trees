#lang racket/base
(provide (all-defined-out))
(module+ test
  (require rackunit))

;; Notice
;; To install (from within the package directory):
;;   $ raco pkg install
;; To install (once uploaded to pkgs.racket-lang.org):
;;   $ raco pkg install <<name>>
;; To uninstall:
;;   $ raco pkg remove <<name>>
;; To view documentation:
;;   $ raco docs <<name>>
;;
;; For your convenience, we have included a LICENSE.txt file, which links to
;; the GNU Lesser General Public License.
;; If you would prefer to use a different license, replace LICENSE.txt with the
;; desired license.
;;
;; Some users like to add a `private/` directory, place auxiliary files there,
;; and require them in `main.rkt`.
;;
;; See the current version of the racket style guide here:
;; http://docs.racket-lang.org/style/index.html

;; Code here

(define make-type
  (lambda (name)
    name))

(define typed-value-packer
  (lambda (type)
    (lambda (value)
      (cons type value))))

(define typed-value-unpacker
  (lambda (type)
    (lambda (typed-value)
      (if (equal? type (car typed-value))
          (cdr typed-value)
          (error "type mismatch")))))

(define typed-value-predicate
  (lambda (type)
    (lambda (typed-value)
      (and (pair? typed-value)
           (equal? type (car typed-value))))))


(module+ test
  ;; Tests to be run with raco test
  (define prices-type (make-type 'prices))
  (define make-prices (typed-value-packer prices-type))
  (define prices-alist (typed-value-unpacker prices-type))
  )

(module+ main
  ;; Main entry point, executed when run with the `racket` executable or DrRacket.
  
  )
