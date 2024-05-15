;; Copyright (c) 2024 John Newton
;; SPDX-License-Identifier: Apache-2.0

(in-package #:lack/middleware/user)

(defvar *current-user* nil)

(defparameter *lack-middleware-user*
  #'(lambda (app &key current)
      (declare (optimize (speed 0) (safety 3) (debug 3))
               (type function app)
               (type (or null function) current))
      (check-type current (or null function))
      #'(lambda (env)
          (declare (optimize (speed 3) (safety 0) (debug 0))
                   (type list env))
          (let ((*current-user* (and current
                                     (funcall current env))))
            (declare (special *current-user*))
            (funcall app env)))))
