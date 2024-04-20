// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "Resolver",
    platforms: [
        .iOS(.v12),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v8),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "Resolver",
            targets: ["Resolver"]
        ),
        .library(
            name: "Resolver-Static",
            type: .static,
            targets: ["Resolver"]
        ),
        .library(
            name: "Resolver-Dynamic",
            type: .dynamic,
            targets: ["Resolver"]
        ),
    ],
    dependencies: [.package(url: "https://github.com/pointfreeco/xctest-dynamic-overlay", from: "1.1.0")],
    targets: [
        .target(
            name: "Resolver",
            dependencies: [.product(name: "XCTestDynamicOverlay", package: "xctest-dynamic-overlay")],
            resources: [.copy("PrivacyInfo.xcprivacy")]
        ),
        .testTarget(
            name: "ResolverTests",
            dependencies: ["Resolver"]
        ),
    ]
)
