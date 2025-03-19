import SwiftUI

public struct PlacesListView: View {
    @StateObject private var viewModel = PlacesListViewModel()
    
    public init() {}
    
    public var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.places) { place in
                    PlaceView(place: place)
                }
            }
            .navigationTitle("Wiki Places")
            .toolbar {
                Button("", systemImage: "plus", action: viewModel.createPlace)
                    .labelStyle(.iconOnly)
            }
            .sheet(item: $viewModel.createPlaceViewModel) { viewModel in
                CreatePlaceView(viewModel: viewModel)
            }
        }
    }
}

#Preview {
    PlacesListView()
}
