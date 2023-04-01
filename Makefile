all: fmt lint

fmt:
	cargo +nightly fmt

lint:
	cargo clippy --workspace
	cargo clippy --workspace --tests

musl_lint:
	if [ `uname -s` = "Linux" ]; then \
		cargo clippy --workspace --target=x86_64-unknown-linux-musl; \
	fi

test:
	cargo test --workspace -- --nocapture

update:
	rustup update stable
	cargo update

clean:
	cargo clean
