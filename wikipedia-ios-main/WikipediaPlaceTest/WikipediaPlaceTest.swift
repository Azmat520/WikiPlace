import Testing

@testable import WMFComponents

struct WikipediaPlaceTest {

    @Suite("Create Location")
    struct CreateLocation {
        
        @Test("Latitude cannot be empty")
        @MainActor func showErrorWhenLatitudeIsEmpty() {
            let createLocationViewModel = CreatePlaceViewModel(save: { _ in })
            createLocationViewModel.create()
            #expect(createLocationViewModel.errorMessage == "Latitude is required")
        }
        
        @Test("Longitude cannot empty")
        @MainActor func showErrorWhenLongitudeIsEmpty() {
            let createLocationViewModel = CreatePlaceViewModel(save: { _ in })
            createLocationViewModel.create()
            #expect(createLocationViewModel.errorMessage == "Longitude is required")
        }
    }
}
