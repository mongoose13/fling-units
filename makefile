deps := pubspec.lock
built := lib/src/generated
pana := ~/.pub-cache/bin/pana

$(built): $(deps)
	dart run build_runner build

.PHONY: clean
clean:
	rm -rf --interactive=never $(built)

.PHONY: reset
reset:
	rm -rf --interactive=never $(deps)

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
	rm -rf --interactive=never $(built)

$(pana):
	dart pub global activate pana
