// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftPlot",
    products: [
       // Products define the executables and libraries produced by a package, and make them visible to other packages.
       .library(
       name: "SwiftPlot",
       targets: ["AGG", "lodepng", "CPPAGGRenderer", "CAGGRenderer", "SwiftPlot", "SVGRenderer", "AGGRenderer"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
	.target(
            name: "AGG",
            dependencies: [],
    	    path: "framework/AGG"),
        .target(
            name: "lodepng",
            dependencies: [],
       	    path: "framework/lodepng"),
	.target(
            name: "CPPAGGRenderer",
            dependencies: ["AGG","lodepng"],
    	    path: "framework/CPPAGGRenderer"),
	.target(
            name: "CAGGRenderer",
            dependencies: ["CPPAGGRenderer"],
    	    path: "framework/CAGGRenderer"),
  .target(
            name: "SwiftPlot",
            dependencies: [],
  	        path: "framework/SwiftPlot"),
  .target(
            name: "AGGRenderer",
            dependencies: ["CAGGRenderer","SwiftPlot"],
            path: "framework/AGGRenderer"),
  .target(
            name: "SVGRenderer",
            dependencies: ["SwiftPlot"],
            path: "framework/SVGRenderer"),
	.target(
            name: "LineChartSingleSeriesExample",
            dependencies: ["AGGRenderer", "SVGRenderer", "SwiftPlot"],
  	        path: "examples/LineChartSingleSeries"),
  .target(
            name: "LineChartMultipleSeriesExample",
            dependencies: ["AGGRenderer", "SVGRenderer", "SwiftPlot"],
        	  path: "examples/LineChartMultipleSeries"),
  .target(
            name: "LineChartSubPlotHorizontallyStackedExample",
            dependencies: ["AGGRenderer", "SVGRenderer", "SwiftPlot"],
            path: "examples/LineChartSubPlotHorizontallyStacked"),
  .target(
            name: "LineChartSubPlotVerticallyStackedExample",
            dependencies: ["AGGRenderer", "SVGRenderer", "SwiftPlot"],
            path: "examples/LineChartSubPlotVerticallyStacked"),
  .target(
            name: "LineChartSubPlotGridStackedExample",
            dependencies: ["AGGRenderer", "SVGRenderer", "SwiftPlot"],
            path: "examples/LineChartSubPlotGridStacked"),
  .target(
            name: "LineChartFunctionPlotExample",
            dependencies: ["AGGRenderer", "SVGRenderer", "SwiftPlot"],
            path: "examples/LineChartFunctionPlot"),
        //.testTarget(
        //  name: "swiftplotTests",
        //  dependencies: ["swiftplot"]),
    ]
)
