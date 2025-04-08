import 'package:fling_units/fling_units.dart';

import 'package:test/test.dart';

//import 'dart:isolate';

void main() {
  group("type safety", () {
    group("Unit", () {
      group("as", () {
        test("valid", () {
          // given
          final unit = seconds.per.gram;

          // then
          unit(1).as(DerivedUnit2.build(seconds, grams.inverted));
        });
      });
      /*
      group("using", () {
        test("valid sandboxed", () async {
          final uri = Uri.dataFromString('''
import "dart:isolate";
import "package:fling_units/fling_units.dart";

void main(_, SendPort port) {
  // given
  final unit = seconds.per.gram;

  // then
  port.send(unit.using(1.minutes, 1.ounces).toString());
}
''');
          final port = ReceivePort();
          expect(
            Isolate.spawnUri(
              uri,
              [],
              port.sendPort,
            ),
            completes,
          );

          final result = await port.first;
          expect(result, isA<String>());
        });
        test("invalid sandboxed", () async {
          final uri = Uri.dataFromString('''
import "dart:isolate";
import "package:fling_units/fling_units.dart";

void main(_, SendPort port) {
  // given
  final unit = seconds.per.gram;

  // then
  port.send(unit.using(1.meters, 1.seconds).toString());
}
''');
          final port = ReceivePort();
          expect(
            () async => await Isolate.spawnUri(
              uri,
              [],
              port.sendPort,
            ),
            throwsException,
          );
        });
      });
      */
    });
  });
}
