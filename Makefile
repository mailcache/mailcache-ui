all: bindata fmt ui

ui:
	go install .

dev: bindata-deps css
	-rm assets/assets.go
	go-bindata -debug -o assets/assets.go -pkg assets assets/...
	go run .

bindata: bindata-deps css
	-rm assets/assets.go
	go-bindata -o assets/assets.go -pkg assets assets/...

bindata-deps:
	go get github.com/mailcache/go-bindata/...

css:
	tailwindcss -i tailwind/input.css -o assets/css/tailwind.css --minify

css-watch:
	tailwindcss -i tailwind/input.css -o assets/css/tailwind.css --watch

fmt:
	go fmt ./...

.PHONY: all ui dev bindata bindata-deps css css-watch fmt
