package main

import "net/http"

func main() {
	http.HandleFunc("/bar", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("foobar"))
	})
	http.ListenAndServe(":8081", nil)
}
