CS149 Programming Assignment 1 -- Chat Server

ChatServer.java
We created a thread pool of 8 workers to handle incoming requests. Incoming
requests were put in a LinkedList called connections. When a request is
received, the lock on connections is obtained, the new request is put in 
connections, and all the other threads are notified. Each thread tries to 
acquire a lock on connections and checks if connections has requests. If it
does not, then each thread will wait on connections to have requests. If it 
does, then the thread with the lock on connections handles the request.


ChatState.java
Each request is either a PUSH or PULL request. A PUSH request corresponds to
the method addMessage(). All the messages will be stored in a LinkedList 
called history. addMessage() will acquire a lock on history, add the message
to history, and notify all threads waiting on history. A PULL request
corresponds to the method recentMessages(). This method will acquire the lock
on history and check if there are any new messages. If so, it will write the
new messages to the buffer. Otherwise, it will wait until either it is
notified of a new message or until 15 seconds have passed.
