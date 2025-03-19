import Foundation

struct Place: Codable {
    let name: String?
    let lat: Double
    let long: Double
}

extension Place: Identifiable {
    var id: UUID {
        return UUID()
    }
}

extension Place {
    var locationURL: URL? {
        URL(string: "wikipedia://places?lat=\(lat)&lon=\(long)")
    }
}

struct PlacesResponse: Codable {
    var locations: [Place]
}
