all: bindata fmt ui

ui:
	go install .

bindata: bindata-deps
	-rm assets/assets.go
	go-bindata -o assets/assets.go -pkg assets assets/...

bindata-deps:
	go get github.com/mailcache/go-bindata/...

fmt:
	go fmt ./...

.PNONY: all ui bindata bindata-deps fmt
