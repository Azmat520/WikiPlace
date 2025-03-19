import Foundation

@MainActor
final class PlacesListViewModel: ObservableObject {
    @Published var places: [Place] = []
    @Published var createPlaceViewModel: CreatePlaceViewModel?
    private var fileURL: URL?
    private let jsonURL = URL(string: "https://raw.githubusercontent.com/abnamrocoesd/assignment-ios/main/locations.json")
    private let fileManager = FileManager.default
    
    init () {
        if let documentDirectory = fileManager.urls(
            for: .documentDirectory,
            in: .userDomainMask
        ).first {
            fileURL = documentDirectory.appendingPathComponent("places.json")
        }
        
        Task {
            places = await getPlaces(from: fileURL) ?? []
        }
    }
    
    func createPlace() {
        createPlaceViewModel = CreatePlaceViewModel(save: savePlace(_:))
    }
}

// MARK: - Private functions
extension PlacesListViewModel {
    private func getPlaces(from url: URL?) async -> [Place]? {
        guard let url else { return [] }
        let path = url.path()
        
        if let data = fileManager.contents(atPath: path) {
            return data.decode(PlacesResponse.self)?.locations
        }

        guard let jsonURL else { return nil }
        
        do {
            let (data,_) = try await URLSession.shared.data(from: jsonURL)
            return data.decode(PlacesResponse.self)?.locations
        } catch {
            print("Failed to fetch JSON: \(error.localizedDescription)")
            return nil
        }
    }
    
    private func savePlace(_ newPlace: Place) {
        guard let path = fileURL?.path() else {
            print("No file url path set")
            return
        }
        
        do {
            let fileURL = URL(fileURLWithPath: path)
            let data = try Data(contentsOf: fileURL)
            
            var locationsWrapper = try JSONDecoder().decode(PlacesResponse.self, from: data)
            locationsWrapper.locations.append(newPlace)

            let updatedData = try JSONEncoder().encode(locationsWrapper)
            try updatedData.write(to: fileURL)
            
            places.append(newPlace)
            createPlaceViewModel = nil
        } catch {
            print("Error updating JSON: \(error.localizedDescription)")
        }
        
    }
}

extension Data {
    func decode<T>(_ type: T.Type) -> T? where T : Decodable {
        do {
            return try JSONDecoder().decode(T.self, from: self)
        } catch {
            print("Failed to decode \(T.self)")
            return nil
        }
    }
}
