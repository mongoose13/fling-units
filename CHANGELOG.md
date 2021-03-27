# Change Log for fling\_units
Dependency-free, type-safe Dart unit conversion library. Decouple specific unit types you need to work with from the rest of your code.

## [Unreleased]
### Added
- Update toString methods for a few measurement types
- Support for Quantity measurements (e.g. moles)
- Support for daltons and electron rest mass

## [1.2.0] - 2021-03-25
Note: a lot of the old methods are marked "deprecated" as of 1.2.0 - these methods will remain in the library
until 2.0.0, but will not be enhanced or expanded further. Hints for migrating are provided with each deprecated
method, and our hope is that this update will allow us to build a more flexible and scalable library for future
releases. We encourage you to use the replacement methods now and to give us feedback on how well they work!

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
- Magnitude comparisons via truncating division and a special division method
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
- Satisfy pana formatting guidelines

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

[Unreleased]: https://bitbucket.org/gelbermungo/fling-units/commits/tag/HEAD/
[1.2.0]: https://bitbucket.org/gelbermungo/fling-units/commits/tag/1.2.0/
[1.1.2]: https://bitbucket.org/gelbermungo/fling-units/commits/tag/1.1.2/
[1.1.1]: https://bitbucket.org/gelbermungo/fling-units/commits/tag/v1.1.1
[1.1.0]: https://bitbucket.org/gelbermungo/fling-units/commits/tag/v1.1.0
[1.0.1]: https://bitbucket.org/gelbermungo/fling-units/commits/tag/v1.0.1
[1.0.0]: https://bitbucket.org/gelbermungo/fling-units/commits/tag/v1.0.0
[0.4.1]: https://bitbucket.org/gelbermungo/fling-units/commits/tag/v0.4.1
[0.4.0]: https://bitbucket.org/gelbermungo/fling-units/commits/tag/v0.4.0
[0.3.2]: https://bitbucket.org/gelbermungo/fling-units/commits/tag/v0.3.2
[0.3.1]: https://bitbucket.org/gelbermungo/fling-units/commits/tag/v0.3.1
[0.3.0]: https://bitbucket.org/gelbermungo/fling-units/commits/tag/v0.3.0
[0.2.1]: https://bitbucket.org/gelbermungo/fling-units/commits/tag/v0.2.1
[0.2.0]: https://bitbucket.org/gelbermungo/fling-units/commits/tag/v0.2.0
[0.1.0]: https://bitbucket.org/gelbermungo/fling-units/commits/tag/v0.1.0
[0.0.1]: https://bitbucket.org/gelbermungo/fling-units/commits/tag/v0.0.1
