import Algorithms

struct Day01: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

  // Splits input data into its component parts and convert from string.
  var entities: [[Int]] {
    data.split(separator: "\n").map {
      $0.split(separator: "   ").compactMap { Int($0) }
    }
  }

  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
    // Calculate the sum of the first set of input data
    let sortedFirst = (entities.map { $0.first.unsafelyUnwrapped }).sorted(),
        sortedSecond = (entities.map { $0.last.unsafelyUnwrapped }).sorted()
    return (zip(sortedFirst, sortedSecond).map { abs($0 - $1) }).reduce(0, +)
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
    // Sum the maximum entries in each set of data
    let first = entities.map {$0.first.unsafelyUnwrapped}, second = entities.map {$0.last.unsafelyUnwrapped}
    let secondContains = (first.map { first in
      (second.map { $0 == first ? 1 : 0 }).reduce(0, +)
    })
    return (zip(first, secondContains).map { $0.0 * $0.1 }).reduce(0, +)
  }
}
