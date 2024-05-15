;; Copyright (c) 2024 John Newton
;; SPDX-License-Identifier: Apache-2.0

(in-package #:lack/middleware/user/tests)

(declaim (optimize (speed 0) (safety 3) (debug 3)))

(defstruct user
  id)

(defun app (env)
  (declare (ignore env))
  (setq lack/middleware/user:*current-user*
        (make-user :id "D87FD132-3A8F-4B44-9A3C-80B74644EF97"))
  (assert (not (null lack/middleware/user:*current-user*)))
  `(200
    (:content-type "text/plain"
     :content-length 43)
    (,(format nil "Hello, ~A" (user-id lack/middleware/user:*current-user*)))))

(deftest test-current-user-binding
    (testing "allows setting *CURRENT-USER* for the request"
             (ok (boundp lack/middleware/user:*current-user*))
             (ok (null lack/middleware/user:*current-user*))
             (let* ((app (funcall lack/middleware/user:*lack-middleware-user*
                                  #'app))
                    (response (funcall app ())))
               (ok (equalp response
                           `(200
                             (:content-type "text/plain"
                              :content-length 43)
                             ("Hello, D87FD132-3A8F-4B44-9A3C-80B74644EF97"))))
               (ok (null lack/middleware/user:*current-user*)))))
