// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Repository",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "Repository",
            targets: ["Repository"]),
    ],
    dependencies: [
        .package(path: "../Domain"),
        .package(path: "../Infra")
    ],
    targets: [
        .target(
            name: "Repository",
            dependencies: ["Domain", "Infra"]),
        .testTarget(
            name: "RepositoryTests",
            dependencies: ["Repository"]),
    ]
)

