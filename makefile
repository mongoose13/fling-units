deps := pubspec.lock
built := lib/src/generated
pana := ~/.pub-cache/bin/pana

build: $(built)

$(built): $(deps)
	dart run build_runner build

.PHONY: clean
clean:
	rm -rf --interactive=never $(built) $(deps) lib/src/library.dart

.PHONY: test
test: build
	dart test

.PHONY: example
example: build
	dart run example/lib/example.dart

.PHONY: pana
pana: $(pana) build
	$(pana) . --no-warning --exit-code-threshold 0

# Tool-based outputs
$(deps): pubspec.yaml
	dart pub get

$(pana):
	dart pub global activate pana
