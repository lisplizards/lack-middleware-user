;; Copyright (c) 2024 John Newton
;; SPDX-License-Identifier: Apache-2.0

(defpackage #:lack/middleware/user
  (:use #:cl)
  (:export #:*lack-middleware-user*
           #:*current-user*))
