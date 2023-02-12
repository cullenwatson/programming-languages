;;;; 1. Hello World
(format t "Hello World from Cullen Watson~%")
(terpri)

;;; 2. Cond (condition) function
(format t "Enter your age: ")
(defparameter *age* (read)) ; Create variable age
(defvar *college-ready* nil)
;;; cond is like if else if else
(cond ( (>= *age* 18) ; If True do this
(setf *college-ready* 'yes)
(format t "Ready for College ~%~%"))
 ( (< *age* 18) ; Else If T do this
 (setf *college-ready* 'no)
(format t "Not Ready for College ~%~%"))
 ) 
 
 ;;;3. Get factorial of number
(format t "Enter a number to find the factorial of: ")
(defparameter *num* (read)) ; Create variable age

(defun factorial (n)
    (cond
      ((= n 1) 1)
      (t (* n (factorial (- n 1))))))  ; t means true; nil means false
(print (factorial *num*))
(terpri)
(terpri)

;;; 4. Fibonacci Sequence
(defun fibs (n &optional (a 0) (b 1) (acc ()))
  (if (zerop n)
      (nreverse acc)
      (fibs (1- n) b (+ a b) (cons a acc))))

(format t "How many Fibonacci number do you like to have? ")
(defparameter *age* (read))
(format t "~%The following are the ")
(princ *age*)
(format t " Fibonacci numbers.")
(print (fibs *age*))
(terpri)
(terpri)

;;; 5. Get all the items from list
(loop for x in '(superman batman aquaman flash joker) do
(format t "~s ~%" x)
)
;;; Use car/cdr operation 
(format t "4th Item = ~a ~%" (cadddr '(superman batman aquaman flash joker)))

