deps := pubspec.lock
built := lib/src/generated
pana := ~/.pub-cache/bin/pana
remove := rm -rf --interactive=never

.PHONY: build
build:
	dart run build_runner build

$(built): build

.PHONY: clean
clean:
	$(remove) $(built)

.PHONY: reset
reset:
	$(remove) $(deps)

.PHONY: test
test: $(built)
	dart test

.PHONY: example
example: $(built)
	dart run example/lib/example.dart

.PHONY: pana
pana: $(pana) $(built)
	$(pana) . --no-warning --exit-code-threshold 0

# Tool-based outputs
$(deps): pubspec.yaml
	dart pub get
	$(remove) $(built)

$(pana):
	dart pub global activate pana
