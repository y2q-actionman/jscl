;;;; Tests for DEFUN

;;; Regression test for #111
(test (eql (defun foo () "foo's" ()) 'foo))


;;; Body, declarations and docstrings

(let ((actual
       (multiple-value-list
        (parse-body '((declare (integerp x)) "foo" 3)
                    :declarations t
                    :docstring t))))

  (test (equal actual '((3) ((DECLARE (INTEGERP X))) "foo"))))

(let ((actual
       (multiple-value-list
        (parse-body '((declare (integerp x)) "foo")
                    :declarations t
                    :docstring t))))

  (test (equal actual '(("foo") ((DECLARE (INTEGERP X))) nil))))


(let ((actual
       (multiple-value-list
        (parse-body '("foo" 3)
                    :declarations t
                    :docstring t))))

  (test (equal actual '((3) nil "foo"))))

