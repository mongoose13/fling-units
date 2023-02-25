import 'package:fling_units/fling_units.dart';
import 'package:test/test.dart';

class TestVisitor implements MeasurementVisitor {
  final Map<Type, bool> _visits = {};

  bool wasVisited(final Type type) => _visits.containsKey(type);

  @override
  void visitArea(final Area area) {
    _visits[Area] = true;
  }

  @override
  void visitCharge(final Charge charge) {
    _visits[Charge] = true;
  }

  @override
  void visitDerived(final DerivedMeasurement measurement) {
    _visits[DerivedMeasurement] = true;
  }

  @override
  void visitDistance(final Distance distance) {
    _visits[Distance] = true;
  }

  @override
  void visitLuminosity(final Luminosity luminosity) {
    _visits[Luminosity] = true;
  }

  @override
  void visitMass(final Mass mass) {
    _visits[Mass] = true;
  }

  @override
  void visitQuantity(final Quantity quantity) {
    _visits[Quantity] = true;
  }

  @override
  void visitTemperature(final Temperature temperature) {
    _visits[Temperature] = true;
  }

  @override
  void visitTemperatureChange(final TemperatureChange temperatureChange) {
    _visits[TemperatureChange] = true;
  }

  @override
  void visitTime(final Time time) {
    _visits[Time] = true;
  }

  @override
  void visitVolume(final Volume volume) {
    _visits[Volume] = true;
  }

  @override
  void visitPressure(final Pressure pressure) {
    _visits[Pressure] = true;
  }
}

void main() {
  group('acceptVisitor', () {
    test('area', () {
      // given
      final visitor = TestVisitor();
      final measurement = Area.of(meters(1), meters(1));

      // when
      measurement.acceptVisitor(visitor);

      // then
      expect(visitor.wasVisited(Area), true);
    });
    test('charge', () {
      // given
      final visitor = TestVisitor();
      final measurement = amperes(1);

      // when
      measurement.acceptVisitor(visitor);

      // then
      expect(visitor.wasVisited(Charge), true);
    });
    test('derived', () {
      // given
      final visitor = TestVisitor();
      final measurement = DerivedMeasurement.multiply(meters(1), liters(1));

      // when
      measurement.acceptVisitor(visitor);

      // then
      expect(visitor.wasVisited(DerivedMeasurement), true);
    });
    test('distance', () {
      // given
      final visitor = TestVisitor();
      final measurement = meters(1);

      // when
      measurement.acceptVisitor(visitor);

      // then
      expect(visitor.wasVisited(Distance), true);
    });
    test('luminosity', () {
      // given
      final visitor = TestVisitor();
      final measurement = candela(1);

      // when
      measurement.acceptVisitor(visitor);

      // then
      expect(visitor.wasVisited(Luminosity), true);
    });
    test('mass', () {
      // given
      final visitor = TestVisitor();
      final measurement = grams(1);

      // when
      measurement.acceptVisitor(visitor);

      // then
      expect(visitor.wasVisited(Mass), true);
    });
    test('quantity', () {
      // given
      final visitor = TestVisitor();
      final measurement = units(1);

      // when
      measurement.acceptVisitor(visitor);

      // then
      expect(visitor.wasVisited(Quantity), true);
    });
    test('temperature', () {
      // given
      final visitor = TestVisitor();
      final measurement = Temperature.ofKelvin(1);

      // when
      measurement.acceptVisitor(visitor);

      // then
      expect(visitor.wasVisited(Temperature), true);
    });
    test('quantity', () {
      // given
      final visitor = TestVisitor();
      final measurement = kelvin(1);

      // when
      measurement.acceptVisitor(visitor);

      // then
      expect(visitor.wasVisited(TemperatureChange), true);
    });
    test('time', () {
      // given
      final visitor = TestVisitor();
      final measurement = seconds(1);

      // when
      measurement.acceptVisitor(visitor);

      // then
      expect(visitor.wasVisited(Time), true);
    });
    test('volume', () {
      // given
      final visitor = TestVisitor();
      final measurement = liters(1);

      // when
      measurement.acceptVisitor(visitor);

      // then
      expect(visitor.wasVisited(Volume), true);
    });
    test('pressure', () {
      // given
      final visitor = TestVisitor();
      final measurement = pascals(1);

      // when
      measurement.acceptVisitor(visitor);

      // then
      expect(visitor.wasVisited(Pressure), true);
    });
  });
}
