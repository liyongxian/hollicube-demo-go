package main

import (
	"fmt"
	"net/http"
	"log"
	"os"
)

// const webContent = "Hello World!中国、长城！"

func main() {
	http.HandleFunc("/", helloHandler)
	log.Fatal(http.ListenAndServe(":8010", nil))
}

func helloHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprint(w, os.Getenv("NODE_HOSTNAME"))
}