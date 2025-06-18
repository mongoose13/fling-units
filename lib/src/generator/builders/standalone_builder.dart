import 'package:build/build.dart';
import 'package:glob/glob.dart';

import 'builder.dart';
import 'dimension_builder.dart';
import 'builder_library.dart';

class FlingStandaloneBuilder extends FlingBuilder {
  final BuildStep _buildStep;
  Future<Iterable<MeasurementDetails>>? _measurements;
  Future<Iterable<PrefixDetails>>? _prefixes;

  FlingStandaloneBuilder(this._buildStep);

  Future<Iterable<MeasurementDetails>> get measurements {
    _measurements ??= _readMeasurements();
    return _measurements!;
  }

  Future<Iterable<PrefixDetails>> get prefixes {
    _prefixes ??= _readPrefixes();
    return _prefixes!;
  }

  /// Reads generated measurement piece files into a list of measurements.
  ///
  /// This allows us to have an iterator over all configured measurements,
  /// rather than having to look at them each one at a time.
  ///
  /// Files are written at: [MeasurementIdentifierBuilder]
  Future<Iterable<MeasurementDetails>> _readMeasurements() async {
    final assets =
        await _buildStep.findAssets(Glob('**/*.measurements')).toList();
    final pairs = await Future.wait(assets.map((asset) => _buildStep
        .readAsString(asset)
        .then((line) => (asset: asset, line: line.split(",")))));
    return pairs.map(
      (pair) {
        final header = pair.line.first.split("|");
        return MeasurementDetails(
          name: header[0],
          dimensions: header[1] == "null"
              ? null
              : header[1].split(".").map(
                    (name) => DimensionDetails(name: name),
                  ),
          asset: pair.asset,
          units: pair.line.skip(1).map(
            (names) {
              final components = names.split(";");
              return UnitDetails(
                name: components[0],
                shortName: components[1],
                singularName: components[2],
                multiplier: double.parse(components[3]),
                isVisible: bool.parse(components[4]),
                isSI: bool.parse(components[5]),
              );
            },
          ),
        );
      },
    );
  }

  Future<Iterable<PrefixDetails>> _readPrefixes() async {
    final assets = await _buildStep.findAssets(Glob('**/*.prefixes')).toList();
    final data = await Future.wait(assets.map((asset) => _buildStep
        .readAsString(asset)
        .then((file) => (asset: asset, lines: file.split("\n")))));
    return data.expand((asset) {
      return asset.lines.map((line) {
        final parts = line.split(",");
        return PrefixDetails(
          name: parts.first,
          shortName: parts.skip(1).first,
          multiplier: double.parse(parts.skip(2).first),
        );
      });
    });
  }
}
