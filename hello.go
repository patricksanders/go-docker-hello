package main

import (
	"fmt"
	"net/http"
	"runtime"

	log "github.com/inconshreveable/log15"
)

var goVersion string

func main() {
	port := 8080
	goVersion = runtime.Version()

	log.Info("starting server", "port", port)
	http.HandleFunc("/", helloHandler)
	http.ListenAndServe(fmt.Sprintf(":%d", port), nil)
}

func add(a int, b int) int {
	return a + b
}

func helloHandler(w http.ResponseWriter, r *http.Request) {
	log.Debug("handling request", "method", r.Method, "remote_address", r.RemoteAddr, "path", r.URL)
	fmt.Fprintf(w, "Hello from %s", goVersion)
}
