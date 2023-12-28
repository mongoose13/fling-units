# Change Log for fling\_units
Dependency-free, type-safe Dart unit conversion library. Decouple specific unit
types you need to work with from the rest of your code.

## Edge
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

[Unreleased]: https://bitbucket.org/mongoose13/fling-units/commits/
[2.2.5]: https://bitbucket.org/mongoose13/fling-units/commits/tag/2.2.5
[2.2.4]: https://bitbucket.org/mongoose13/fling-units/commits/tag/2.2.4
[2.2.3]: https://bitbucket.org/mongoose13/fling-units/commits/tag/2.2.3
[2.2.2]: https://bitbucket.org/mongoose13/fling-units/commits/tag/2.2.2
[2.2.1]: https://bitbucket.org/mongoose13/fling-units/commits/tag/2.2.1
[2.2.0]: https://bitbucket.org/mongoose13/fling-units/commits/tag/2.2.0
[2.1.1]: https://bitbucket.org/mongoose13/fling-units/commits/tag/2.1.1
[2.1.0]: https://bitbucket.org/mongoose13/fling-units/commits/tag/2.1.0
[2.0.2]: https://bitbucket.org/mongoose13/fling-units/commits/tag/2.0.2
[2.0.1]: https://bitbucket.org/mongoose13/fling-units/commits/tag/2.0.1
[2.0.0]: https://bitbucket.org/mongoose13/fling-units/commits/tag/2.0.0
[1.4.1]: https://bitbucket.org/mongoose13/fling-units/commits/tag/1.4.1
[1.4.0]: https://bitbucket.org/mongoose13/fling-units/commits/tag/1.4.0
[1.3.0]: https://bitbucket.org/mongoose13/fling-units/commits/tag/1.3.0
[1.2.0]: https://bitbucket.org/mongoose13/fling-units/commits/tag/1.2.0
[1.1.2]: https://bitbucket.org/mongoose13/fling-units/commits/tag/1.1.2
[1.1.1]: https://bitbucket.org/mongoose13/fling-units/commits/tag/v1.1.1
[1.1.0]: https://bitbucket.org/mongoose13/fling-units/commits/tag/v1.1.0
[1.0.1]: https://bitbucket.org/mongoose13/fling-units/commits/tag/v1.0.1
[1.0.0]: https://bitbucket.org/mongoose13/fling-units/commits/tag/v1.0.0
[0.4.1]: https://bitbucket.org/mongoose13/fling-units/commits/tag/v0.4.1
[0.4.0]: https://bitbucket.org/mongoose13/fling-units/commits/tag/v0.4.0
[0.3.2]: https://bitbucket.org/mongoose13/fling-units/commits/tag/v0.3.2
[0.3.1]: https://bitbucket.org/mongoose13/fling-units/commits/tag/v0.3.1
[0.3.0]: https://bitbucket.org/mongoose13/fling-units/commits/tag/v0.3.0
[0.2.1]: https://bitbucket.org/mongoose13/fling-units/commits/tag/v0.2.1
[0.2.0]: https://bitbucket.org/mongoose13/fling-units/commits/tag/v0.2.0
[0.1.0]: https://bitbucket.org/mongoose13/fling-units/commits/tag/v0.1.0
[0.0.1]: https://bitbucket.org/mongoose13/fling-units/commits/tag/v0.0.1