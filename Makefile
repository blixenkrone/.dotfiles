.PHONY: run

build:
	go build -o setup.run ./setup/setup.go

reset:
	rm ./setup.run

run:
	go run ./setup/setup.go
