(defpackage #:moba
  (:use :cl)
  (:use :sb-ext)
  (:use :hunchensocket)
  (:export :init)
  (:export :test))
(in-package :moba)
(defvar *input* ())
(defvar *names* "qwertyuiopasdfghjklzxcvbnm")
(defvar *port* 8080)

(defun define-node (a b c d)
  "defines a single datapoint of a song, with storage space for whatever happens during that moment"
  (let ((milis a) (chord b) (intensity c) (direction d) (actions ()))
    (return-from define-node (list
      :get-time (lambda () milis)
      :get-chord (lambda () chord)
      :get-intensity (lambda () intensity)
      :get-direction (lambda () direction)
      :get-actions (lambda () actions)
      :set-actions (lambda (act) (setf actions act) actions)))))

(defun list-exec (ls ex &optional (n -1))
  "takes a plist and a :property-name and executes the funcion at that location. Optionally operates on the :property of a list at nth of the given list"
  (unless (= -1 n) (setf ls (nth n ls)))
  (funcall (getf ls ex)))

(defvar *players* ())
(defun define-player (a b c d)
  "defines a single player, with storage space for pending actions"
  (let ((name a) (current-move "") (current-action "") (sock d))
    (return-from define-player (list
      :get-name (lambda () name)
      :get-sock (lambda () sock)
      :get-move (lambda () current-move)
      :get-action (lambda () current-action)
      :set-move (lambda (mov) (setf current-move act) current-move)
      :set-action (lambda (act) (setf current-action act) current-action)))))

;(defun match-start (song)
;  (let ((init-time (encode-universal-time 0 0 0 1 1 1970 0)))
;    (bordeaux-threads:make-thread
;      (dolist song



(defclass chat-room (hunchensocket:websocket-resource)
  ((name :initarg :name :initform (error "Name this room!") :reader name))
  (:default-initargs :client-class 'user))

(defclass user (hunchensocket:websocket-client)
  ((name :initarg :user-agent :reader name :initform (error "Name this user!"))))

(defvar *chat-rooms* (list (make-instance 'chat-room :name "/bongo")
                           (make-instance 'chat-room :name "/fury")))

(defun find-room (request)
  (find (hunchentoot:script-name request) *chat-rooms* :test #'string= :key #'name))

(pushnew 'find-room hunchensocket:*websocket-dispatch-table*)

(defun broadcast (room message &rest args)
  (loop for peer in (hunchensocket:clients room)
        do (hunchensocket:send-text-message peer (apply #'format nil message args))))

(defmethod hunchensocket:client-connected ((room chat-room) user)
(let ((name (make-name)))
  (push (define-player name "" "" user) *players*)
  (hunchensocket:send-text-message user (format nil "~a" name)))
)

(defun make-name () (format t "new thread ~%")
  (let* ((rand (random (length *names*)))(name (subseq *names* (- rand 1) rand)))(setf *names* (concatenate 'string (subseq *names* 0 (- rand 1)) (subseq *names* rand))) name))

(defmethod hunchensocket:client-disconnected ((room chat-room) user)
  (broadcast room "~a has left ~a" (name user) (name room)))

(defmethod hunchensocket:text-message-received ((room chat-room) user message)
  ;(broadcast room "~a says ~a" (name user) message)
  (parse message))

(defun parse (message)
  (format t "~a~%" message))

(defvar *server* (make-instance 'hunchensocket:websocket-acceptor :port 12345))
(hunchentoot:start *server*)

(broadcast (car *chat-rooms*) "correct horse")






(defvar *tempo* 250)
(defvar *taking-over* (list
  (define-node (* 0 *tempo*) 0 50 0)
  (define-node (* 1 *tempo*) 1 50 0)
  (define-node (* 2 *tempo*) 2 50 0)
  (define-node (* 3 *tempo*) 3 50 0)
  (define-node (* 4 *tempo*) 0 50 0)
  (define-node (* 5 *tempo*) 1 50 0)
  (define-node (* 6 *tempo*) 2 50 0)
  (define-node (* 7 *tempo*) 3 50 0)
  (define-node (* 8 *tempo*) 0 50 0)
  (define-node (* 9 *tempo*) 1 50 0)
  (define-node (* 10 *tempo*) 2 50 0)
  (define-node (* 11 *tempo*) 3 50 0)
  (define-node (* 12 *tempo*) 0 50 0)
  (define-node (* 13 *tempo*) 1 50 0)
  (define-node (* 14 *tempo*) 2 50 0)
  (define-node (* 15 *tempo*) 3 50 0)
  (define-node (* 16 *tempo*) 0 50 0)
  (define-node (* 17 *tempo*) 1 50 0)
  (define-node (* 18 *tempo*) 2 50 0)
  (define-node (* 19 *tempo*) 3 50 0)
  (define-node (* 20 *tempo*) 0 50 0)
  (define-node (* 21 *tempo*) 1 50 0)
  (define-node (* 22 *tempo*) 2 50 0)
  (define-node (* 23 *tempo*) 3 50 0)
  (define-node (* 24 *tempo*) 0 50 0)
  (define-node (* 25 *tempo*) 1 50 0)
  (define-node (* 26 *tempo*) 2 50 0)
  (define-node (* 27 *tempo*) 3 50 0)
  (define-node (* 28 *tempo*) 0 50 0)
  (define-node (* 29 *tempo*) 1 50 0)
  (define-node (* 30 *tempo*) 2 50 0)
  (define-node (* 31 *tempo*) 3 50 0)
  (define-node (* 32 *tempo*) 0 50 0)
  (define-node (* 33 *tempo*) 1 50 0)
  (define-node (* 34 *tempo*) 2 50 0)
  (define-node (* 35 *tempo*) 3 50 0)
  (define-node (* 36 *tempo*) 0 50 0)
  (define-node (* 37 *tempo*) 1 50 0)
  (define-node (* 38 *tempo*) 2 50 0)
  (define-node (* 39 *tempo*) 3 50 0)
  (define-node (* 40 *tempo*) 0 50 0)
  (define-node (* 41 *tempo*) 1 50 0)
  (define-node (* 42 *tempo*) 2 50 0)
  (define-node (* 43 *tempo*) 3 50 0)
  (define-node (* 44 *tempo*) 0 50 0)
  (define-node (* 45 *tempo*) 1 50 0)
  (define-node (* 46 *tempo*) 2 50 0)
  (define-node (* 47 *tempo*) 3 50 0)
  (define-node (* 48 *tempo*) 0 50 0)
  (define-node (* 49 *tempo*) 1 50 0)
  (define-node (* 50 *tempo*) 2 50 0)
  (define-node (* 51 *tempo*) 3 50 0)
  (define-node (* 52 *tempo*) 0 50 0)
  (define-node (* 53 *tempo*) 1 50 0)
  (define-node (* 54 *tempo*) 2 50 0)
  (define-node (* 55 *tempo*) 3 50 0)
  (define-node (* 56 *tempo*) 0 50 0)
  (define-node (* 57 *tempo*) 1 50 0)
  (define-node (* 58 *tempo*) 2 50 0)
  (define-node (* 59 *tempo*) 3 50 0)
  (define-node (* 60 *tempo*) 0 50 0)
  (define-node (* 61 *tempo*) 1 50 0)
  (define-node (* 62 *tempo*) 2 50 0)
  (define-node (* 63 *tempo*) 3 50 0)
  (define-node (* 64 *tempo*) 0 50 0)
  (define-node (* 65 *tempo*) 1 50 0)
  (define-node (* 66 *tempo*) 2 50 0)
  (define-node (* 67 *tempo*) 3 50 0)
  (define-node (* 68 *tempo*) 0 50 0)
  (define-node (* 69 *tempo*) 1 50 0)
  (define-node (* 70 *tempo*) 2 50 0)
  (define-node (* 71 *tempo*) 3 50 0)
  (define-node (* 72 *tempo*) 0 50 0)
  (define-node (* 73 *tempo*) 1 50 0)
  (define-node (* 74 *tempo*) 2 50 0)
  (define-node (* 75 *tempo*) 3 50 0)
  (define-node (* 76 *tempo*) 0 50 0)
  (define-node (* 77 *tempo*) 1 50 0)
  (define-node (* 78 *tempo*) 2 50 0)
  (define-node (* 79 *tempo*) 3 50 0)
))