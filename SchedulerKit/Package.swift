// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "SchedulerKit",
  platforms: [
    .macOS(.v10_15),
    .iOS(.v13),
    .watchOS(.v6),
    .tvOS(.v13)
  ],
  products: [
    .library(name: "SchedulerKit", targets: ["SchedulerKit"]),
  ],
  targets: [
    .target(name: "SchedulerKit"),
  ]
)
