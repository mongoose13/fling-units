# Change Log for fling_units
Dependency-free, type-safe Dart unit conversion library. Decouple specific unit types you need to work with from the rest of your code.

## Unreleased

### Feature
  * Magnitude comparisons via truncating division and a special division method

### Docs
  * Update supported metric prefixes
  * Markdown style suggestions

### Refactor
  * Allow const instances of units

## [v1.1.0](https://bitbucket.org/gelbermungo/fling-units/commits/tag/v1.1.0) - 2021-03-17

### Feature
  * Support for nano- and pico-seconds
  * Support for micro, nano-, and pico-meters

### Docs
  * Add Fling logo to README

## [v1.0.1](https://bitbucket.org/gelbermungo/fling-units/commits/tag/v1.0.1) - 2021-03-16

### Docs
  * Satisfy pana formatting guidelines [8cdde3c](https://bitbucket.org/gelbermungo/fling-units/commits/8cdde3cd085fa070532c779e35e26a06e3d2e20a)

## [v1.0.0](https://bitbucket.org/gelbermungo/fling-units/commits/tag/v1.0.0) - 2021-03-15

### Feature
  * Clone a measurement with a specific precision [0ded461](https://bitbucket.org/gelbermungo/fling-units/commits/0ded461dee698269e61572258b3d04fa9078ca13)
  * Null safety support [f6eab54](https://bitbucket.org/gelbermungo/fling-units/commits/f6eab545e6e7535c7774ab041aec7dd91ef47d21)
  * Mass measurements [13b6b11](https://bitbucket.org/gelbermungo/fling-units/commits/13b6b11741a42cad59778819c5172ecb5310ce30)
  * Time measurements [ef996c7](https://bitbucket.org/gelbermungo/fling-units/commits/ef996c7c01411240643a3349a5d14195f0d8f696)

### Refactor
  * Dart analyze and dartdoc fixes [c8e7073](https://bitbucket.org/gelbermungo/fling-units/commits/c8e70736e898c213d9ca5b0610caf50d22d6705c)
  * Arrange library parts [86ce2ae](https://bitbucket.org/gelbermungo/fling-units/commits/86ce2aeb689f49442f4680f53abc8b5c7725f679)
  * Method renaming and API simplification [1d3008a](https://bitbucket.org/gelbermungo/fling-units/commits/1d3008a385ba6fccf91532519e522895c8881cfa)

## [v0.4.1](https://bitbucket.org/gelbermungo/fling-units/commits/tag/v0.4.1) - 2021-03-11

### Docs
  * Follow the Effective Dart guide to documentation [ca0674d](https://bitbucket.org/gelbermungo/fling-units/commits/ca0674d38c97b1caf6e8a91cbd09ed38ccdf593f)
  * Update README with precision example and features [e8d3dee](https://bitbucket.org/gelbermungo/fling-units/commits/e8d3dee48fe577e0c7d43580b623fd56c13d564b)

## [v0.4.0](https://bitbucket.org/gelbermungo/fling-units/commits/tag/v0.4.0) - 2021-03-10

### Feature
  * Derived measurements [2716a3a](https://bitbucket.org/gelbermungo/fling-units/commits/2716a3a89682a6ae44111e95da2e75f101c29743)
  * Precision on measurements [9f07029](https://bitbucket.org/gelbermungo/fling-units/commits/9f07029b5d87f95043495ea88cefc0a88c8f2a5c)

## [v0.3.2](https://bitbucket.org/gelbermungo/fling-units/commits/tag/v0.3.2) - 2021-03-07

### Bugs
  * Export Temperature class from the main library [6b4c2e4](https://bitbucket.org/gelbermungo/fling-units/commits/6b4c2e4abdbef01e9b0771fd9d687a60fd86154d)

## [v0.3.1](https://bitbucket.org/gelbermungo/fling-units/commits/tag/v0.3.1) - 2021-03-06

### Feature
  * Negation for Volume, Distance, and TemperatureChange [1e1dffa](https://bitbucket.org/gelbermungo/fling-units/commit/1e1dffac9edc5579aa0e0b620d97c5d262c1724a)
  * Piecemeal constructors for Volume and Distance measurements [34c3922](https://bitbucket.org/gelbermungo/fling-units/commit/34c39224f0a95a7b4292e6b6f95345ea933b616a)

### Docs
  * More helpful home page [039cbd0](https://bitbucket.org/gelbermungo/fling-units/commit/039cbd02b8e22b5612c98bdb7ee79982a2841c7d)

## [v0.3.0](https://bitbucket.org/gelbermungo/fling-units/commits/tag/v0.3.0) - 2021-03-06

### Feature
  * Type-safe Temperature conversions [eb08dcf](https://bitbucket.org/gelbermungo/fling-units/commit/eb08dcf10d3dd30c1fe4dd13cd09c2a639830ecb)
  * Checks for whether a quantity is NaN [9fffbf8](https://bitbucket.org/gelbermungo/fling-units/commit/9fffbf8b070c45da57c03316f2cb97eb8786beeb)
  * Checks for whether a quantity is finite or not [add636e](https://bitbucket.org/gelbermungo/fling-units/commit/add636e7f503ace20c6b46165eb1d1774ee4b451)

### Docs
  * Fix broken links in CHANGELOG [5cfb081](https://bitbucket.org/gelbermungo/fling-units/commit/5cfb08153075499497ca823ddccf7f63bbc2d022)
  * Refer to pub.dev page as the homepage [3cfe488](https://bitbucket.org/gelbermungo/fling-units/commit/3cfe48813074a9fc777bb7ff9fa5ea369b4335a9)

## [v0.2.1](https://bitbucket.org/gelbermungo/fling-units/commits/tag/v0.2.1) - 2021-03-06

### Bugs
  * Correct US cup conversion rate [47e54bc](https://bitbucket.org/gelbermungo/fling-units/commit/47e54bcfed45b287a6f5567086f6c012e39ec2ae)

### Docs
  * Simplify the Operations in the README [0a56edd](https://bitbucket.org/gelbermungo/fling-units/commit/0a56edd6f636102577c5099bd2edf108070fcf1a)
  * Include a basic example app [4ac3ba7](https://bitbucket.org/gelbermungo/fling-units/commit/4ac3ba79d04757e9afba7b20b5cb5ca5a460362d)

## [v0.2.0](https://bitbucket.org/gelbermungo/fling-units/commits/tag/v0.2.0) - 2021-03-05

### Feature
  * Minor version bump [0d231fd](https://bitbucket.org/gelbermungo/fling-units/commit/0d231fdac71338104b38e5b38c58d0cb803de8d0)
  * Type-safe Volume conversions [03cfad8](https://bitbucket.org/gelbermungo/fling-units/commit/03cfad821da7185a1159857a89858dda58b97eb6)

### Docs
  * Changelog update for 0.2.0 [3f0dab3](https://bitbucket.org/gelbermungo/fling-units/commit/3f0dab39c7523296b67b48c205626daa71f967c9)

## [v0.1.0](https://bitbucket.org/gelbermungo/fling-units/commits/tag/v0.1.0) - 2021-03-05

### Feature
  * Type-safe distance conversions [49422bb](https://bitbucket.org/gelbermungo/fling-units/commit/49422bb8282ecebaed00b67b5197eb1c84a76be5)

### Fixes
  * Ignore IDE files in VCS [e238ce9](https://bitbucket.org/gelbermungo/fling-units/commit/e238ce973b7c7baac98b4d894bcfcaf604788854)

### Docs
  * Add Modified BSD License [a04c174](https://bitbucket.org/gelbermungo/fling-units/commit/a04c174c5ff486f490d90c76747d302685b698c3)
  * Document all public Distance APIs [b3481ae](https://bitbucket.org/gelbermungo/fling-units/commit/b3481aec272405a3b610fedd54505bb6205920df)

### Refactor
  * Update module naming to match the Fling convention [7b295bf](https://bitbucket.org/gelbermungo/fling-units/commit/7b295bf6cbe68e8592c3acbac1a5109c61a47eb6)

## [v0.0.1](https://bitbucket.org/gelbermungo/fling-units/commits/tag/v0.0.1) - 2021-03-04

### Chore
  * Initial package setup [402188d](https://bitbucket.org/gelbermungo/fling-units/commit/402188dbcc53bc2fd4a1fd2074e86ed877d9fe13)
