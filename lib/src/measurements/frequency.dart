part of "../core/library.dart";

typedef _FrequencyComponent = UnitDenominator<Unit<Time>>;

typedef FrequencyUnit = f.DerivedUnit1<_FrequencyComponent, Time>;

typedef FrequencyMeasurement
    = f.Measurement<Dimension1<_FrequencyComponent>>;

final FrequencyUnit hertz = f.DerivedUnit1.inverse(seconds, name: "Hz");

extension FrequencyExtensionNum on num {
  FrequencyMeasurement get hertz => f.hertz(this);
}

extension FrequencyNumExtension on f.NumExtension {
  FrequencyMeasurement get hertz => f.hertz.withPrefix(_prefix)(_value);
}

extension FrequencyMeasurementPrefix on MeasurementPrefix {
  FrequencyUnit get hertz => f.hertz.withPrefix(prefix);
}
