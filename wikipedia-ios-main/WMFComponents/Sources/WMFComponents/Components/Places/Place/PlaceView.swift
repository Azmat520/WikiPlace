import SwiftUI

struct PlaceView: View {
    @Environment(\.openURL) var openURL
    let place: Place
    
    var body: some View {
        Button {
            if let url = place.locationURL {
                openURL(url)
            }
        } label: {
            LabeledContent(place.name ?? "Unknown place", value: "Wiki me!")
        }
        .accessibilityHint("Link to external app. Opent in Wikipedia.")
    }
}

#Preview {
    PlaceView(place: Place(name: "Test", lat: 1.23, long: 2.33))
}
