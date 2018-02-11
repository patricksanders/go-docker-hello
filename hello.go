package main

import log "github.com/inconshreveable/log15"

func main() {
	log.Info("hello world")
}

func add(a int, b int) int {
	return a + b
}
