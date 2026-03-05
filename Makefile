.PHONY: help generate lint clean

BUF_VERSION = 1.27.2

help:
	@echo "Mercury Protos - Available commands:"
	@echo ""
	@echo "  make generate    - Generate Go code from proto files"
	@echo "  make lint        - Lint proto files"
	@echo "  make clean       - Remove generated files"
	@echo ""

generate:
	@echo "Generating code..."
	buf generate
	@echo "Generation complete!"

lint:
	@echo "Linting proto files..."
	buf lint
	@echo "Lint complete!"

clean:
	@echo "Cleaning generated files..."
	rm -rf gen/
	@echo "Clean complete!"

# Установка buf (если нет)
install-buf:
	@echo "Installing buf $(BUF_VERSION)..."
	curl -sSL "https://github.com/bufbuild/buf/releases/download/v$(BUF_VERSION)/buf-$(shell uname -s)-$(shell uname -m).tar.gz" | tar -xzf - -C /tmp && sudo mv /tmp/bin/buf /usr/local/bin/
	@echo "Buf installed!"