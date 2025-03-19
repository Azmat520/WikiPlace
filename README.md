# Wikipedia Places Deep Linking
## Description
This project extends the Wikipedia iOS app by modifying its deep linking capabilities. Now, external apps can open Wikipedia directly in the Places tab and display a specified location using longitude and latitude coordinates instead of the current location.

Additionally, a SwiftUI test app (WikipediaPlace) is created to demonstrate this functionality. This app: <br>
- ✅ Fetches a list of locations from a remote JSON file.
- ✅ Allows users to select a location or enter custom coordinates.
- ✅ Opens the Wikipedia app and navigates to the Places tab with the specified location.
- ✅ Caches the locations for offline use.

## Installation & Setup
### 1. Clone & Set Up the Wikipedia iOS App
Clone the repository and run setup script `./scripts/setup` <br><br>
Note: This script installs dependencies like Homebrew, SwiftLint, and ClangFormat.
It also sets up a pre-commit hook for linting Objective-C code.

- ✅ Open Wikipedia.xcodeproj in Xcode (version 16.0+).
- ✅ Run the Wikipedia app once on a physical device or simulator.

**This step is required to install Wikipedia, so the deep linking feature can work.**

### 2. Run the Wiki Place App

- ✅ In Xcode, select the WikipediaPlace target.
- ✅ Run the app on a simulator or device.

## How It Works
- 1️⃣ The test app fetches locations if there is not local json file.
- 2️⃣ Users can select a location or enter a custom location.
- 3️⃣ The test app opens Wikipedia via deep linking, showing the specified location.

## Modified Code in Wikipedia iOS App
NSUserActivity+WMFExtensions -> wmf_placesActivityWithURL
PlacesViewController -> showArticleURL
## Source code Wikipedia Place App
📂 Packages → WMFComponents → Sources → WMFComponents → Components → Places

## Testing
Unit tests are included in WikipediaPlaceTests, however it cannot be runned due to the build errors.
