// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppPackage",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "TCDCore", targets: ["TCDCore"]),
        .library(name: "SharedModels", targets: ["SharedModels"]),
        .library(name: "TCDDomain", targets: ["TCDDomain"]),
        .library(name: "TCDData", targets: ["TCDData"])
    ],
    targets: [
        .target(
            name: "TCDCore"
        ),
        .target(
            name: "SharedModels"
        ),
        .target(
            name: "TCDDomain",
            dependencies: [
                "TCDCore",
                "SharedModels"
            ]
        ),
        .target(
            name: "TCDData",
            dependencies: ["TCDDomain"]
        ),
    ]
)
