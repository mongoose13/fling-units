# Change Log for fling\_units

Dependency-free, type-safe Dart unit conversion library. Decouple specific unit
types you need to work with from the rest of your code.

## [Unreleased]

### Changed

- Remove generated files from source control

## [3.0.8]

### Fixed

- Intrinsic volume unit conversion multipliers were inverted https://github.com/mongoose13/fling-units/issues/8

## [3.0.7]

### Fixed

- Equality works for units with prefixes

### Changed

- Improved makefile targets and automated build steps

### Added

- CONTRIBUTING documentation

## [3.0.6]

### Changed

- Enable strict type checking in analyzer
- Renamed Celcius to Celsius (correct spelling) per [Issue #2](https://github.com/mongoose13/fling-units/issues/2)

## [3.0.5]

### Changed

- Switched to Github hosting

## [3.0.4]

### Removed

- Deprecated the special measurement constructors

### Changed

- Updated the migration guide link

## [3.0.3]

### Fixed

- Basic arithmetic operators on measurements yielded incorrect results

## [3.0.2]

### Added

- Hashtag #convert
- Funding link to PayPal

### Changed

- Update links to new Atlassian site in readme and project spec
- Use makefile instead of Rake

## [3.0.1]

### Added

- Hashtags for the package in pub.dev

## [3.0.0]

### Changed

- See the [2.x-3.x migration guide] for details
- Derived units are standalone objects
- Syntactic sugar for many operations
- Static methods are globally accessible
- Confusing classes renamed to match standard vernacular

## [2.2.7]

### Changed

- Support for const constructors on all units

### Added

- Support the modulo operator for all measurements
- Support equals() method for all measurements
- Accept Precision as an int
- Frequency measurements

## [2.2.6]

### Changed

- Update dependency versions
- Dart suggested style fixes

## [2.2.5]

### Changed

- Make default interpreters optional for all units

## [2.2.4]

### Added

- Angle boolean checks: isAcute, isRight, isObtuse, isStraight
- Angle const constructors: right, straight
- Accessors for default interpreters and values

## [2.2.3]

### Added

- Angle measurement type and units

### Changed

- Use 'mixin' keyword for the *Prefix mixin classes

## [2.2.2]

### Added

- Pressure measurement type and units
- Perform dart analyze step during build

### Changed

- Renamed variables in measurement classes to avoid analyzer warnings

## [2.2.1]

### Added

- Update documentation to include new SI prefixes and toString() support
- Allow DerivedMeasurementInterpreters to be used in DerivedMeasurements

### Changed

- Reduce type constraints on inputs to measurements to allow new interpreter type support

## [2.2.0] - 2023-02-16

### Added

- toString() methods on interpreters produce the standard short form of the unit
- toString() methods on measurements use the interpreter that created the measurement
- Support for metric prefixes "quecto", "ronto", "ronna", "quetta"

## [2.1.1] - 2023-01-17

### Fixed

- Prevent precision cap breach when performing additions

## [2.1.0] - 2022-12-11

### Added

- Extensions on the num types to create any measurement
- Derived unit syntactic sugar with .by and .per

### Removed

- Caching all dependencies for each test run

### Changed

- Switched from pedantic to lints for static analysis
- Updated to the latest test version

## [2.0.2] - 2022-05-07

### Changed

- Updated all project URLs

## [2.0.1] - 2022-05-07

### Added

- CircleCI testing and validation

### Removed

- Travis CI configuration

## [2.0.0] - 2021-07-01

### Changed

- Upgraded dependencies to latest
- Removed all deprecated members

## [1.4.1] - 2021-03-30

### Changed

- Fix rounding errors on Quantity.units

## [1.4.0] - 2021-03-30

### Added

- Visitor pattern support for all measurement types

### Changed

- Organized source code

- Write Good suggestions for wordiness

## [1.3.0] - 2021-03-28

### Added

- Support for quantity measurements (e.g. moles)
- Support for electric charge measurements (e.g. amperes)
- Support for luminance measurements (e.g. candela)
- Support for daltons and electron rest mass

### Changed

- Addition and subtraction use correct result precision
- Update toString methods for measurement types
- Write Good suggestions for README

## [1.2.0] - 2021-03-25

### Changed

- Refactor unit converters for more flexibility
- Deprecate duplicated functionality
- Examples and documentation for unit converters

## [1.1.2] - 2021-03-21

### Changed

- Treat warnings as errors during dartanalyzer runs

### Fixed

- Correct template for CHANGELOG entries
- Fix Dart warnings in README

## [1.1.1] - 2021-03-20

### Added

- Cider-style CHANGELOG and config
- Comparisons via truncating division and a special division method
- Document supported metric prefixes

### Changed

- Allow const instances of units

### Fixed

- Markdown style suggestions in README

## [1.1.0] - 2021-03-17

### Added

- Support for nano- and pico-seconds
- Support for micro, nano-, and pico-meters
- Add Fling logo to README

## [1.0.1] - 2021-03-16

### Changed

- pana formatting guidelines

## [1.0.0] - 2021-03-15

### Added

- Clone a measurement with a specific precision
- Null safety support
- Mass measurements
- Time measurements

### Changed

- Method renaming and API simplification

### Fixed

- Dart analyze and dartdoc fixes
- Arrange library parts

## [0.4.1] - 2021-03-11

### Added

- Follow the Effective Dart guide to documentation
- Update README with precision example and features

## [0.4.0] - 2021-03-10

### Added

- Derived measurements
- Precision on measurements

## [0.3.2] - 2021-03-07

### Fixed

- Export Temperature class from the main library

## [0.3.1] - 2021-03-06

### Added

- Negation for Volume, Distance, and TemperatureChange
- Piecemeal constructors for Volume and Distance measurements

### Changed

- More helpful home page

## [0.3.0] - 2021-03-06

### Added

- Type-safe Temperature conversions
- Checks for whether a quantity is NaN
- Checks for whether a quantity is finite or not

### Changed

- Refer to pub.dev page as the homepage

### Fixed

- Fix broken links in CHANGELOG

## [0.2.1] - 2021-03-06

### Added

- Simplify the Operations in the README
- Include a basic example app

### Fixed

- Correct US cup conversion rate

## [0.2.0] - 2021-03-05

### Added

- Minor version bump
- Type-safe Volume conversions
- Changelog update for 0.2.0

## [0.1.0] - 2021-03-05

### Added

- Type-safe distance conversions
- Add Modified BSD License
- Document all public Distance APIs

### Changed

- Update module naming to match the Fling convention

### Fixed

- Ignore IDE files in VCS

## [0.0.1] - 2021-03-04

### Added

- Initial package setup

[Unreleased]: https://github.com/mongoose13/fling-units/compare/v3.0.8...HEAD
[3.0.8]: https://github.com/mongoose13/fling-units/compare/v3.0.7...v3.0.8
[3.0.7]: https://github.com/mongoose13/fling-units/compare/v3.0.6...v3.0.7
[3.0.6]: https://github.com/mongoose13/fling-units/compare/v3.0.5...v3.0.6
[3.0.5]: https://github.com/mongoose13/fling-units/compare/v3.0.4...v3.0.5
[3.0.4]: https://github.com/mongoose13/fling-units/compare/v3.0.3...v3.0.4
[3.0.3]: https://github.com/mongoose13/fling-units/compare/v3.0.2...v3.0.3
[3.0.2]: https://github.com/mongoose13/fling-units/compare/v3.0.1...v3.0.2
[3.0.1]: https://github.com/mongoose13/fling-units/compare/v3.0.0...v3.0.1
[3.0.0]: https://github.com/mongoose13/fling-units/compare/v2.2.7...v3.0.0
[2.2.7]: https://github.com/mongoose13/fling-units/compare/v2.2.6...v2.2.7
[2.2.6]: https://github.com/mongoose13/fling-units/compare/v2.2.5...v2.2.6
[2.2.5]: https://github.com/mongoose13/fling-units/compare/v2.2.4...v2.2.5
[2.2.4]: https://github.com/mongoose13/fling-units/compare/v2.2.3...v2.2.4
[2.2.3]: https://github.com/mongoose13/fling-units/compare/v2.2.2...v2.2.3
[2.2.2]: https://github.com/mongoose13/fling-units/compare/v2.2.1...v2.2.2
[2.2.1]: https://github.com/mongoose13/fling-units/compare/v2.2.0...v2.2.1
[2.2.0]: https://github.com/mongoose13/fling-units/compare/v2.1.1...v2.2.0
[2.1.1]: https://github.com/mongoose13/fling-units/compare/v2.1.0...v2.1.1
[2.1.0]: https://github.com/mongoose13/fling-units/compare/v2.0.2...v2.1.0
[2.0.2]: https://github.com/mongoose13/fling-units/compare/v2.0.1...v2.0.2
[2.0.1]: https://github.com/mongoose13/fling-units/compare/v2.0.0...v2.0.1
[2.0.0]: https://github.com/mongoose13/fling-units/compare/v1.4.1...v2.0.0
[1.4.1]: https://github.com/mongoose13/fling-units/compare/v1.4.0...v1.4.1
[1.4.0]: https://github.com/mongoose13/fling-units/compare/v1.3.0...v1.4.0
[1.3.0]: https://github.com/mongoose13/fling-units/compare/v1.2.0...v1.3.0
[1.2.0]: https://github.com/mongoose13/fling-units/compare/v1.1.2...v1.2.0
[1.1.2]: https://github.com/mongoose13/fling-units/compare/v1.1.1...v1.1.2
[1.1.1]: https://github.com/mongoose13/fling-units/compare/v1.1.0...v1.1.1
[1.1.0]: https://github.com/mongoose13/fling-units/compare/v1.0.1...v1.1.0
[1.0.1]: https://github.com/mongoose13/fling-units/compare/v1.0.0...v1.0.1
[1.0.0]: https://github.com/mongoose13/fling-units/compare/v0.4.1...v1.0.0
[0.4.1]: https://github.com/mongoose13/fling-units/compare/v0.4.0...v0.4.1
[0.4.0]: https://github.com/mongoose13/fling-units/compare/v0.3.2...v0.4.0
[0.3.2]: https://github.com/mongoose13/fling-units/compare/v0.3.1...v0.3.2
[0.3.1]: https://github.com/mongoose13/fling-units/compare/v0.3.0...v0.3.1
[0.3.0]: https://github.com/mongoose13/fling-units/compare/v0.2.1...v0.3.0
[0.2.1]: https://github.com/mongoose13/fling-units/compare/v0.2.0...v0.2.1
[0.2.0]: https://github.com/mongoose13/fling-units/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/mongoose13/fling-units/compare/v0.0.1...v0.1.0
[0.0.1]: https://github.com/mongoose13/fling-units/tree/v0.0.1

[2.x-3.x migration guide]: https://github.com/mongoose13/fling-units/wiki/Migration-Guide-2.x-to-3.x