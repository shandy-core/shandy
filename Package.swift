// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Shandy",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .executable(
            name: "shandy",
            targets: ["shandy"]),
        .executable(
            name: "shandy-get",
            targets: ["shandy-get"])
    ],
    dependencies: [
        .package(url: "https://github.com/shandy-core/libshandy.git", branch: "main"),
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.3.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "shandy",
            dependencies: ["libshandy"]),
        .executableTarget(
            name: "shandy-get",
            dependencies: [
                "libshandy",
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ]),
        .testTarget(
            name: "shandyTests",
            dependencies: ["shandy"]
        ),
    ],
    swiftLanguageModes: [
        .v6
    ]
)
