# lack-middleware-user

## Usage

Wrap app:

```lisp
(funcall lack/middleware/user:*lack-middleware-user*
         *app*)
```

Lack Builder:

```lisp
(lack:builder
 (:user :current #'(lambda (env)
                     (myapp:current-user env)))
 *web*)
```

Please note that the `current` keyword argument is optional; without the argument, you can still set `LACK/MIDDLEWARE/USER:*CURRENT-USER*` from your application.

## Development

Run tests:

```lisp
(asdf:test-system :foo.lisp.lack-middleware-user)
```

## Installation

Not in Quicklisp, so clone the repository to  "local-projects/".

## Author

* John Newton (<a href="mailto:jnewton@lisplizards.dev">jnewton@lisplizards.dev</a>)

## Copyright

Copyright (c) 2024 John Newton

## License

Apache-2.0
