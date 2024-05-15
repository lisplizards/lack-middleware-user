;; Copyright (c) 2024 John Newton
;; SPDX-License-Identifier: Apache-2.0

(defsystem "foo.lisp.lack-middleware-user"
  :version "1.0.0"
  :author "John Newton"
  :license "Apache-2.0"
  :homepage "https://github.com/lisplizards/lack-middleware-user"
  :bug-tracker "https://github.com/lisplizards/lack-middleware-user/issues"
  :source-control (:git "https://github.com/lisplizards/lack-middleware-user.git")
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "middleware" :depends-on ("package"))
                 (:file "package"))))
  :description "Lack middleware to set a current user"
  :in-order-to ((test-op (test-op "foo.lisp.lack-middleware-user/tests"))))

(defsystem "foo.lisp.lack-middleware-user/tests"
  :author "John Newton"
  :license "Apache-2.0"
  :depends-on ("foo.lisp.lack-middleware-user"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "middleware" :depends-on ("package"))
                 (:file "package"))))
  :description "Test system for foo.lisp.lack-middleware-user"
  :perform (test-op (op c) (symbol-call :rove :run c)))
