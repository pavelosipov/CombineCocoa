// swift-tools-version:5.6

import PackageDescription

let package = Package(
  name: "CombineCocoa",
  platforms: [.iOS(.v12)],
  products: [
    .library(name: "CombineCocoa", targets: ["CombineCocoa"]),
  ],
  dependencies: [
    .package(url: "https://github.com/OpenCombine/OpenCombine", from: "0.13.0"),
  ],
  targets: [
    .target(
      name: "CombineCocoa",
      dependencies: [
        "Runtime",
        .product(name: "OpenCombine", package: "OpenCombine"),
        .product(name: "OpenCombineFoundation", package: "OpenCombine"),
        .product(name: "OpenCombineDispatch", package: "OpenCombine"),
      ],
      linkerSettings: [
        .linkedFramework("UIKit")
      ]
    ),
    .target(name: "Runtime", dependencies: [])
  ]
)
