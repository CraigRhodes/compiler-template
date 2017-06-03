import PackageDescription

let package = Package(
  name: "NewLanguage",
  dependencies: [
		.Package(url: "https://github.com/sharplet/Regex.git", majorVersion: 0, minor: 4),
  ]
)
