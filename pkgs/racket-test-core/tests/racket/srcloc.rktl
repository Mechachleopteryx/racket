(load-relative "../racket/loadtest.rktl")

(Section 'srcloc)
(require syntax/srcloc)
(require racket/shared)

(test #t source-location? #f)
(test #f source-location? #t)
(test #t source-location? (list #f #f #f #f #f))
(test #t source-location? (list 'here 1 0 1 0))
(test #t source-location? (list #f 1 0 1 0))
(test #f source-location? (list 'here #f 0 1 0))
(test #f source-location? (list 'here 1 #f 1 0))
(test #t source-location? (list 'here 1 0 #f 0))
(test #t source-location? (list 'here 1 0 1 #f))
(test #f source-location? (list 'here 1 -1 1 0))
(test #f source-location? (list 'here 1 0 0 0))
(test #f source-location? (list 'here 1 0 1 -1))
(test #f source-location? (shared ([x (list* 'here 1 0 1 0 x)]) x))
(test #t source-location? (vector #f #f #f #f #f))
(test #t source-location? (vector 'here 1 0 1 0))
(test #t source-location? (vector #f 1 0 1 0))
(test #f source-location? (vector 'here #f 0 1 0))
(test #f source-location? (vector 'here 1 #f 1 0))
(test #t source-location? (vector 'here 1 0 #f 0))
(test #t source-location? (vector 'here 1 0 1 #f))
(test #f source-location? (vector 'here 0 0 1 0))
(test #f source-location? (vector 'here 1 -1 1 0))
(test #f source-location? (vector 'here 1 0 0 0))
(test #f source-location? (vector 'here 1 0 1 -1))
(test #t source-location? (make-srcloc #f #f #f #f #f))
(test #t source-location? (make-srcloc 'here 1 0 1 0))
(test #t source-location? (make-srcloc #f 1 0 1 0))
(test #f source-location? (make-srcloc 'here #f 0 1 0))
(test #f source-location? (make-srcloc 'here 1 #f 1 0))
(test #t source-location? (make-srcloc 'here 1 0 #f 0))
(test #t source-location? (make-srcloc 'here 1 0 1 #f))
(test #t source-location? (datum->syntax #f null #f))
(test #t source-location? (datum->syntax #f null (list 'here 1 0 1 0)))
(test #t source-location? (datum->syntax #f null (list #f 1 0 1 0)))
;;(test #f source-location? (datum->syntax #f null (list 'here #f 0 1 0))) ;; won't run
;;(test #f source-location? (datum->syntax #f null (list 'here 1 #f 1 0))) ;; won't run
(test #t source-location? (datum->syntax #f null (list 'here 1 0 #f 0)))
(test #t source-location? (datum->syntax #f null (list 'here 1 0 1 #f)))

(test #f source-location-list? #f)
(test #t source-location-list? (list #f #f #f #f #f))
(test #t source-location-list? (list 'here 1 0 1 0))
(test #t source-location-list? (list #f 1 0 1 0))
(test #f source-location-list? (list 'here #f 0 1 0))
(test #f source-location-list? (list 'here 1 #f 1 0))
(test #t source-location-list? (list 'here 1 0 #f 0))
(test #t source-location-list? (list 'here 1 0 1 #f))
(test #f source-location-list? (list 'here 0 0 1 0))
(test #f source-location-list? (list 'here 1 -1 1 0))
(test #f source-location-list? (list 'here 1 0 0 0))
(test #f source-location-list? (list 'here 1 0 1 -1))
(test #f source-location-list? (shared ([x (list* 'here 1 0 1 0 x)]) x))
(test #f source-location-list? (vector 'here 1 0 1 0))
(test #f source-location-list? (make-srcloc 'here 1 0 1 0))
(test #f source-location-list? (datum->syntax #f null #f))
(test #f source-location-list? (datum->syntax #f null (list 'here 1 0 1 0)))

(test #f source-location-vector? #f)
(test #f source-location-vector? (list 'here 1 0 1 0))
(test #t source-location-vector? (vector #f 1 0 1 0))
(test #f source-location-vector? (vector 'here #f 0 1 0))
(test #f source-location-vector? (vector 'here 1 #f 1 0))
(test #t source-location-vector? (vector 'here 1 0 #f 0))
(test #t source-location-vector? (vector 'here 1 0 1 #f))
(test #t source-location-vector? (vector #f #f #f #f #f))
(test #t source-location-vector? (vector 'here 1 0 1 0))
(test #f source-location-vector? (vector 'here 0 0 1 0))
(test #f source-location-vector? (vector 'here 1 -1 1 0))
(test #f source-location-vector? (vector 'here 1 0 0 0))
(test #f source-location-vector? (vector 'here 1 0 1 -1))
(test #f source-location-vector? (make-srcloc 'here 1 0 1 0))
(test #f source-location-vector? (datum->syntax #f null #f))
(test #f source-location-vector? (datum->syntax #f null (list 'here 1 0 1 0)))

(test (void) check-source-location! 'test-srcloc #f)
(err/rt-test (check-source-location! 'test-srcloc #t) exn:fail:contract?)
(test (void) check-source-location! 'test-srcloc (list #f #f #f #f #f))
(test (void) check-source-location! 'test-srcloc (list 'here 1 0 1 0))
(test (void) check-source-location! 'test-srcloc (list #f 1 0 1 0))
(err/rt-test (check-source-location! 'test-srcloc (list 'here #f 0 1 0)) exn:fail:contract?)
(err/rt-test (check-source-location! 'test-srcloc (list 'here 1 #f 1 0)) exn:fail:contract?)
(test (void) check-source-location! 'test-srcloc (list 'here 1 0 #f 0))
(test (void) check-source-location! 'test-srcloc (list 'here 1 0 1 #f))
(err/rt-test (check-source-location! 'test-srcloc (list 'here 0 0 1 0)) exn:fail:contract?)
(err/rt-test (check-source-location! 'test-srcloc (list 'here 1 -1 1 0)) exn:fail:contract?)
(err/rt-test (check-source-location! 'test-srcloc (list 'here 1 0 0 0)) exn:fail:contract?)
(err/rt-test (check-source-location! 'test-srcloc (list 'here 1 0 1 -1)) exn:fail:contract?)
(err/rt-test (check-source-location! 'test-srcloc (shared ([x (list* 'here 1 0 1 0 x)]) x)) exn:fail:contract?)
(test (void) check-source-location! 'test-srcloc (vector #f #f #f #f #f))
(test (void) check-source-location! 'test-srcloc (vector 'here 1 0 1 0))
(test (void) check-source-location! 'test-srcloc (vector #f 1 0 1 0))
(err/rt-test (check-source-location! 'test-srcloc (vector 'here #f 0 1 0)) exn:fail:contract?)
(err/rt-test (check-source-location! 'test-srcloc (vector 'here 1 #f 1 0)) exn:fail:contract?)
(test (void) check-source-location! 'test-srcloc (vector 'here 1 0 #f 0))
(test (void) check-source-location! 'test-srcloc (vector 'here 1 0 1 #f))
(err/rt-test (check-source-location! 'test-srcloc (vector 'here 0 0 1 0)) exn:fail:contract?)
(err/rt-test (check-source-location! 'test-srcloc (vector 'here 1 -1 1 0)) exn:fail:contract?)
(err/rt-test (check-source-location! 'test-srcloc (vector 'here 1 0 0 0)) exn:fail:contract?)
(err/rt-test (check-source-location! 'test-srcloc (vector 'here 1 0 1 -1)) exn:fail:contract?)
(test (void) check-source-location! 'test-srcloc (make-srcloc #f #f #f #f #f))
(test (void) check-source-location! 'test-srcloc (make-srcloc 'here 1 0 1 0))
(test (void) check-source-location! 'test-srcloc (make-srcloc #f 1 0 1 0))
(err/rt-test (check-source-location! 'test-srcloc (make-srcloc 'here #f 0 1 0)) exn:fail:contract?)
(err/rt-test (check-source-location! 'test-srcloc (make-srcloc 'here 1 #f 1 0)) exn:fail:contract?)
(test (void) check-source-location! 'test-srcloc (make-srcloc 'here 1 0 #f 0))
(test (void) check-source-location! 'test-srcloc (make-srcloc 'here 1 0 1 #f))
(test (void) check-source-location! 'test-srcloc (datum->syntax #f null #f))
(test (void) check-source-location! 'test-srcloc (datum->syntax #f null (list 'here 1 0 1 0)))
(test (void) check-source-location! 'test-srcloc (datum->syntax #f null (list #f 1 0 1 0)))
;;(err/rt-test (check-source-location! 'test-srcloc (datum->syntax #f null (list 'here #f 0 1 0))) exn:fail:contract?) ;; won't run
;;(err/rt-test (check-source-location! 'test-srcloc (datum->syntax #f null (list 'here 1 #f 1 0))) exn:fail:contract?) ;; won't run
(test (void) check-source-location! 'test-srcloc (datum->syntax #f null (list 'here 1 0 #f 0)))
(test (void) check-source-location! 'test-srcloc (datum->syntax #f null (list 'here 1 0 1 #f)))

(test (make-srcloc #f #f #f #f #f) build-source-location)
(test (make-srcloc #f #f #f #f #f) build-source-location #f)
(test (make-srcloc 'here 1 0 1 0) build-source-location (make-srcloc 'here 1 0 1 0))
(test (make-srcloc 'here 1 0 1 0) build-source-location (vector 'here 1 0 1 0))
(test (make-srcloc 'here 1 0 1 0) build-source-location (list 'here 1 0 1 0))
(test (make-srcloc 'here 1 0 1 0) build-source-location (datum->syntax #f null (list 'here 1 0 1 0)))
(test (make-srcloc 'here 1 0 1 3) build-source-location (list 'here 1 0 1 0) (vector 'here 2 1 3 1))
(test (make-srcloc 'here 1 0 1 3) build-source-location (vector 'here 2 1 3 1) (list 'here 1 0 1 0))
(test (make-srcloc #f #f #f #f #f) build-source-location (vector 'here 2 1 3 1) (list 'there 1 0 1 0))
(err/rt-test (build-source-location (list 'bad 0 0 0 0)) exn:fail:contract?)

(test (list #f #f #f #f #f) build-source-location-list)
(test (list #f #f #f #f #f) build-source-location-list #f)
(test (list 'here 1 0 1 0) build-source-location-list (make-srcloc 'here 1 0 1 0))
(test (list 'here 1 0 1 0) build-source-location-list (vector 'here 1 0 1 0))
(test (list 'here 1 0 1 0) build-source-location-list (list 'here 1 0 1 0))
(test (list 'here 1 0 1 0) build-source-location-list (datum->syntax #f null (list 'here 1 0 1 0)))
(test (list 'here 1 0 1 3) build-source-location-list (list 'here 1 0 1 0) (vector 'here 2 1 3 1))
(test (list 'here 1 0 1 3) build-source-location-list (vector 'here 2 1 3 1) (list 'here 1 0 1 0))
(test (list #f #f #f #f #f) build-source-location-list (vector 'here 2 1 3 1) (list 'there 1 0 1 0))
(err/rt-test (build-source-location-list (list 'bad 0 0 0 0)) exn:fail:contract?)

(test (vector #f #f #f #f #f) build-source-location-vector)
(test (vector #f #f #f #f #f) build-source-location-vector #f)
(test (vector 'here 1 0 1 0) build-source-location-vector (make-srcloc 'here 1 0 1 0))
(test (vector 'here 1 0 1 0) build-source-location-vector (vector 'here 1 0 1 0))
(test (vector 'here 1 0 1 0) build-source-location-vector (list 'here 1 0 1 0))
(test (vector 'here 1 0 1 0) build-source-location-vector (datum->syntax #f null (list 'here 1 0 1 0)))
(test (vector 'here 1 0 1 3) build-source-location-vector (list 'here 1 0 1 0) (vector 'here 2 1 3 1))
(test (vector 'here 1 0 1 3) build-source-location-vector (vector 'here 2 1 3 1) (list 'here 1 0 1 0))
(test (vector #f #f #f #f #f) build-source-location-vector (vector 'here 2 1 3 1) (list 'there 1 0 1 0))
(err/rt-test (build-source-location-vector (list 'bad 0 0 0 0)) exn:fail:contract?)

(define-syntax-rule (test-stx-srcloc (list src line col pos span) fn arg ...)
  (begin
    (test #t syntax? (fn arg ...))
    (test src syntax-source (fn arg ...))
    (test line syntax-line (fn arg ...))
    (test col syntax-column (fn arg ...))
    (test pos syntax-position (fn arg ...))
    (test span syntax-span (fn arg ...))))

(test-stx-srcloc (list #f #f #f #f #f) build-source-location-syntax)
(test-stx-srcloc (list #f #f #f #f #f) build-source-location-syntax #f)
(test-stx-srcloc (list 'here 1 0 1 0) build-source-location-syntax (make-srcloc 'here 1 0 1 0))
(test-stx-srcloc (list 'here 1 0 1 0) build-source-location-syntax (vector 'here 1 0 1 0))
(test-stx-srcloc (list 'here 1 0 1 0) build-source-location-syntax (list 'here 1 0 1 0))
(test-stx-srcloc (list 'here 1 0 1 0) build-source-location-syntax (datum->syntax #f null (list 'here 1 0 1 0)))
(test-stx-srcloc (list 'here 1 0 1 3) build-source-location-syntax (list 'here 1 0 1 0) (vector 'here 2 1 3 1))
(test-stx-srcloc (list 'here 1 0 1 3) build-source-location-syntax (vector 'here 2 1 3 1) (list 'here 1 0 1 0))
(test-stx-srcloc (list #f #f #f #f #f) build-source-location-syntax (vector 'here 2 1 3 1) (list 'there 1 0 1 0))
(err/rt-test (build-source-location-syntax (list 'bad 0 0 0 0)) exn:fail:contract?)

(test #f source-location-known? #f)
(test #t source-location-known? (list 'here 1 0 1 0))
(test #f source-location-known? (list #f #f #f #f #f))
(test #t source-location-known? (vector 'here 1 0 1 0))
(test #f source-location-known? (vector #f #f #f #f #f))
(test #t source-location-known? (make-srcloc 'here 1 0 1 0))
(test #f source-location-known? (make-srcloc #f #f #f #f #f))
(test #t source-location-known? (datum->syntax #f null (list 'here 1 0 1 0)))
(test #f source-location-known? (datum->syntax #f null (list #f #f #f #f #f)))

(test #f source-location-source #f)
(test 'here source-location-source (list 'here 1 2 3 4))
(test 'here source-location-source (vector 'here 1 2 3 4))
(test 'here source-location-source (make-srcloc 'here 1 2 3 4))
(test 'here source-location-source (datum->syntax #f null (list 'here 1 2 3 4)))

(test #f source-location-line #f)
(test 1 source-location-line (list 'here 1 2 3 4))
(test 1 source-location-line (vector 'here 1 2 3 4))
(test 1 source-location-line (make-srcloc 'here 1 2 3 4))
(test 1 source-location-line (datum->syntax #f null (list 'here 1 2 3 4)))

(test #f source-location-column #f)
(test 2 source-location-column (list 'here 1 2 3 4))
(test 2 source-location-column (vector 'here 1 2 3 4))
(test 2 source-location-column (make-srcloc 'here 1 2 3 4))
(test 2 source-location-column (datum->syntax #f null (list 'here 1 2 3 4)))

(test #f source-location-position #f)
(test 3 source-location-position (list 'here 1 2 3 4))
(test 3 source-location-position (vector 'here 1 2 3 4))
(test 3 source-location-position (make-srcloc 'here 1 2 3 4))
(test 3 source-location-position (datum->syntax #f null (list 'here 1 2 3 4)))

(test #f source-location-span #f)
(test 4 source-location-span (list 'here 1 2 3 4))
(test 4 source-location-span (vector 'here 1 2 3 4))
(test 4 source-location-span (make-srcloc 'here 1 2 3 4))
(test 4 source-location-span (datum->syntax #f null (list 'here 1 2 3 4)))

(test #f source-location-end #f)
(test 7 source-location-end (list 'here 1 2 3 4))
(test #f source-location-end (list 'here 1 2 #f 4))
(test #f source-location-end (list 'here 1 2 3 #f))
(test 7 source-location-end (vector 'here 1 2 3 4))
(test #f source-location-end (vector 'here 1 2 #f 4))
(test #f source-location-end (vector 'here 1 2 3 #f))
(test 7 source-location-end (make-srcloc 'here 1 2 3 4))
(test #f source-location-end (make-srcloc 'here 1 2 #f 4))
(test #f source-location-end (make-srcloc 'here 1 2 3 #f))
(test 7 source-location-end (datum->syntax #f null (list 'here 1 2 3 4)))
(test #f source-location-end (datum->syntax #f null (list 'here 1 2 #f 4)))
(test #f source-location-end (datum->syntax #f null (list 'here 1 2 3 #f)))

(test "" source-location->string #f)

(test "" source-location->string (list #f #f #f #f #f))
(test "here" source-location->string (list 'here #f #f #f #f))
(test "here:1.2" source-location->string (list 'here 1 2 3 #f))
(test "here::3" source-location->string (list 'here #f #f 3 #f))
(test "::3-7" source-location->string (list #f #f #f 3 4))
(test ":1.2" source-location->string (list #f 1 2 3 #f))
(test "::3" source-location->string (list #f #f #f 3 #f))
(test "::3-7" source-location->string (list #f #f #f 3 4))

(test "" source-location->string (vector #f #f #f #f #f))
(test "here" source-location->string (vector 'here #f #f #f #f))
(test "here:1.2" source-location->string (vector 'here 1 2 3 #f))
(test "here::3" source-location->string (vector 'here #f #f 3 #f))
(test "::3-7" source-location->string (vector #f #f #f 3 4))
(test ":1.2" source-location->string (vector #f 1 2 3 #f))
(test "::3" source-location->string (vector #f #f #f 3 #f))
(test "::3-7" source-location->string (vector #f #f #f 3 4))

(test "" source-location->string (make-srcloc #f #f #f #f #f))
(test "here" source-location->string (make-srcloc 'here #f #f #f #f))
(test "here:1.2" source-location->string (make-srcloc 'here 1 2 3 #f))
(test "here::3" source-location->string (make-srcloc 'here #f #f 3 #f))
(test "::3-7" source-location->string (make-srcloc #f #f #f 3 4))
(test ":1.2" source-location->string (make-srcloc #f 1 2 3 #f))
(test "::3" source-location->string (make-srcloc #f #f #f 3 #f))
(test "::3-7" source-location->string (make-srcloc #f #f #f 3 4))

(test "" source-location->string (datum->syntax #f null (list #f #f #f #f #f)))
(test "here" source-location->string (datum->syntax #f null (list 'here #f #f #f #f)))
(test "here:1.2" source-location->string (datum->syntax #f null (list 'here 1 2 3 #f)))
(test "here::3" source-location->string (datum->syntax #f null (list 'here #f #f 3 #f)))
(test "::3-7" source-location->string (datum->syntax #f null (list #f #f #f 3 4)))
(test ":1.2" source-location->string (datum->syntax #f null (list #f 1 2 3 #f)))
(test "::3" source-location->string (datum->syntax #f null (list #f #f #f 3 #f)))
(test "::3-7" source-location->string (datum->syntax #f null (list #f #f #f 3 4)))

(test "" source-location->prefix #f)

(test "" source-location->prefix (list #f #f #f #f #f))
(test "here: " source-location->prefix (list 'here #f #f #f #f))
(test "here:1.2: " source-location->prefix (list 'here 1 2 3 #f))
(test "here::3: " source-location->prefix (list 'here #f #f 3 #f))
(test "::3-7: " source-location->prefix (list #f #f #f 3 4))
(test ":1.2: " source-location->prefix (list #f 1 2 3 #f))
(test "::3: " source-location->prefix (list #f #f #f 3 #f))
(test "::3-7: " source-location->prefix (list #f #f #f 3 4))

(test "" source-location->prefix (vector #f #f #f #f #f))
(test "here: " source-location->prefix (vector 'here #f #f #f #f))
(test "here:1.2: " source-location->prefix (vector 'here 1 2 3 #f))
(test "here::3: " source-location->prefix (vector 'here #f #f 3 #f))
(test "::3-7: " source-location->prefix (vector #f #f #f 3 4))
(test ":1.2: " source-location->prefix (vector #f 1 2 3 #f))
(test "::3: " source-location->prefix (vector #f #f #f 3 #f))
(test "::3-7: " source-location->prefix (vector #f #f #f 3 4))

(test "" source-location->prefix (make-srcloc #f #f #f #f #f))
(test "here: " source-location->prefix (make-srcloc 'here #f #f #f #f))
(test "here:1.2: " source-location->prefix (make-srcloc 'here 1 2 3 #f))
(test "here::3: " source-location->prefix (make-srcloc 'here #f #f 3 #f))
(test "::3-7: " source-location->prefix (make-srcloc #f #f #f 3 4))
(test ":1.2: " source-location->prefix (make-srcloc #f 1 2 3 #f))
(test "::3: " source-location->prefix (make-srcloc #f #f #f 3 #f))
(test "::3-7: " source-location->prefix (make-srcloc #f #f #f 3 4))

(test "" source-location->prefix (datum->syntax #f null (list #f #f #f #f #f)))
(test "here: " source-location->prefix (datum->syntax #f null (list 'here #f #f #f #f)))
(test "here:1.2: " source-location->prefix (datum->syntax #f null (list 'here 1 2 3 #f)))
(test "here::3: " source-location->prefix (datum->syntax #f null (list 'here #f #f 3 #f)))
(test "::3-7: " source-location->prefix (datum->syntax #f null (list #f #f #f 3 4)))
(test ":1.2: " source-location->prefix (datum->syntax #f null (list #f 1 2 3 #f)))
(test "::3: " source-location->prefix (datum->syntax #f null (list #f #f #f 3 #f)))
(test "::3-7: " source-location->prefix (datum->syntax #f null (list #f #f #f 3 4)))

(test (srcloc 'm #f #f #f #f)
      build-source-location (srcloc 'm #f #f #f 0) (srcloc 'm #f #f #f 0))
(test (srcloc 'm 1 2 3 0)
      build-source-location (srcloc 'm 1 2 3 0) (srcloc 'm #f #f #f 0))
(test (srcloc 'm 1 2 3 0)
      build-source-location (srcloc 'm #f #f #f 0) (srcloc 'm 1 2 3 0))

(err/rt-test (let ()
               (struct a () #:property prop:exn:srclocs 'no)
               'not-ok))

;; Check that the error display handler uses `prop:exn:srclocs`:
(let ()
  (struct a exn:fail (srclocs)
    #:property prop:exn:srclocs (lambda (a) (a-srclocs a)))
  (define (go a #:catch? [catch? #f])
    (define o (open-output-bytes))
    ((if catch?
         (lambda (thunk)
           (let/ec k
             (parameterize ([error-escape-handler (lambda () (k))])
               (thunk))))
         (lambda (thunk) (thunk)))
     (lambda ()
       (parameterize ([current-error-port o])
         ((error-display-handler) "fail" a))))
    (get-output-bytes o))
  (test #t regexp-match? #rx"here:1:2" (go (a "msg" (current-continuation-marks)
                                              (list (srcloc "here" 1 2 3 4)))))
  (test #t regexp-match? #rx"there:10:20" (go (a "msg" (current-continuation-marks)
                                                 (list (srcloc "here" 1 2 3 4)
                                                       (srcloc "there" 10 20 30 40)))))
  (test #t regexp-match? #rx"listof srcloc[?]" (go (a "msg" (current-continuation-marks)
                                                      'oops)
                                                   #:catch? #t))
  (parameterize ([error-print-context-length 0])
    (test #f regexp-match? #rx"here" (go (a "msg" (current-continuation-marks)
                                            (list (srcloc "here" 1 2 3 4)
                                                  (srcloc "there" 10 20 30 40))))))

  (void))

(report-errs)
