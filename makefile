build:
	dart pub get
	dart run build_runner build

.PHONY: clean
clean:
	rm -rf lib/src/generated
	rm -rf lib/src/library.dart

.PHONY: test
test:
	dart test

.PHONY: example
example:
	dart run example/lib/example.dart