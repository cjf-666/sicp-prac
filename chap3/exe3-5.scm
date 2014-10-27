(define (estimate-integral trials x1 x2 y1 y2 predict)
  (* (* (- x2 x1) (- y2 y1)) (monte-carlo trials (lambda () (predict (random-in-range x1 x2) (random-in-range y1 y2))))))

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (pred-within x y)
  (<= (+ (* x x) (* y y)) 1.0))

(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
	   (/ trials-passed trials))
	  ((experiment)
	   (iter (- trials-remaining 1) (+ trials-passed 1)))
	  (else
	   (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))
