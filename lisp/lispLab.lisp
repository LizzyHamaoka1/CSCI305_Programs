(defun sumList (list)
	(cond ((null list) 0)
		(t (+ (first list)
			(sumList (rest list)))))

)

(write(sumList '(-2 4 -3 5 -3 1 -2 3))) 
(terpri)


(defun maxList (list)
  (let ((maxSum 0) (currentSum 0) (end 0))
    (do ((list list (rest list))
         (i 0 (1+ i)))
        ((endp list))
      (setf currentSum (max 0 (+ currentSum (first list))))
      (when (> currentSum maxSum)
        (setf end i maxSum currentSum)))
    (let* ((sublist (subseq list 0 (1+ end)))
           (sum (reduce #'+ sublist)))
      (do ((start 0 (1+ start))
           (sublist sublist (rest sublist))
           (sum sum (- sum (first sublist))))
          ((or (endp sublist) (eql sum maxSum))
           (values maxSum sublist start (1+ end))))))
)

(write(maxList '(-2 4 -3 5 -3 1 -2 3)))
(terpri)
;;(defun sumList2 (list)
;;      (cond ((null list) 0)


;;)
;;(sumList2 '(-2 4 (-5 6) -3 1 -2 3)))


