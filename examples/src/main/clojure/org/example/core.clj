(ns org.example.core
  (:require [net.http.server :as http])
  (:gen-class :main true))

(defn handler
  [request]
  {:status  200
   :headers {"Content-Type"   "text/plain"
             "Content-Length" "6"}
   :body    "hello\n"})

(defn -main
  [& _]
  (http/run-server {:host "0.0.0.0"
                    :port 8080
                    :ring-handler handler}))
