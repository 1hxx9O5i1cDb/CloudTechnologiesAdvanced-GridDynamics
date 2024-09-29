package main

import (
    "encoding/json"
    "net/http"
    "log"
)

type Message struct {
    Message string `json:"message"`
}

func messageHandler(w http.ResponseWriter, r *http.Request) {
    response := Message{Message: "Hello from the Go backend!"}
    w.Header().Set("Content-Type", "application/json")
    json.NewEncoder(w).Encode(response)
}

func main() {
    http.HandleFunc("/api/message", messageHandler)

    log.Println("Backend server is running on port 8080...")
    if err := http.ListenAndServe(":8080", nil); err != nil {
        log.Fatal(err)
    }
}
