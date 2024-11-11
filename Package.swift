// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "SwiftyCalendarView",
    platforms: [
        .iOS(.v14) // Specify the minimum iOS version supported
    ],
    products: [
        .library(
            name: "SwiftyCalendarView",
            targets: ["SwiftyCalendarView"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SwiftyCalendarView",
            dependencies: []
        ),
        .testTarget(
            name: "SwiftyCalendarViewTests",
            dependencies: ["SwiftyCalendarView"]
        ),
    ]
)
