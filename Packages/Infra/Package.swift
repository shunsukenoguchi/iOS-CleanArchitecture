// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Infra",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "Infra",
            targets: ["Infra"]),
    ],
    dependencies: [
        .package(path: "../Domain")
    ],
    targets: [
        .target(
            name: "Infra",
            dependencies: ["Domain"]),
        .testTarget(
            name: "InfraTests",
            dependencies: ["Infra"]),
    ]
)

