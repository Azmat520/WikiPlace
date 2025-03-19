import Foundation

@MainActor
final class CreatePlaceViewModel: ObservableObject, Identifiable {
    @Published var name: String = ""
    @Published var lat: String = ""
    @Published var long: String = ""
    @Published var errorMessage: String?
    
    private let save: (Place) -> Void
    
    init(save: @escaping (Place) -> Void) {
        self.save = save
    }
    
    func create() {
        errorMessage = nil
        
        guard let doubleLat = Double(lat.replacingOccurrences(of: ",", with: ".")), doubleLat != 0.0 else {
            errorMessage = "Latitude is required"
            return
        }
        
        guard let doubleLong = Double(long.replacingOccurrences(of: ",", with: ".")), doubleLong != 0.0 else {
            errorMessage = "Longitude is required"
            return
        }
        
        if errorMessage == nil {
            save(Place(name: name.isEmpty ? nil : name, lat: doubleLat, long: doubleLong))
        }
    }
}
