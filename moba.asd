(asdf:defsystem moba
  :version "0.5"
  :description "yet another dumb test"
  :maintainer "Michael Dorian <doby162@gmail.com>"
  :author "Michael Dorian <doby162@gmail.com>"
  :licence "BSD-2-Clause"
  :serial t
  :depends-on (:hunchensocket :bordeaux-threads)
  :components ((:file "moba")))
