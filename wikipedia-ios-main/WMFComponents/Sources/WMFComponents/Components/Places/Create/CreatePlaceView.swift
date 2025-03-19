import SwiftUI

struct CreatePlaceView: View {
    @ObservedObject var viewModel: CreatePlaceViewModel
    
    var body: some View {
        Form {
            Section("Name:") {
                TextField("optional", text: $viewModel.name)
            }
            
            Section("Latitude:") {
                TextField("Required", text: $viewModel.lat)
                    .keyboardType(.decimalPad)
            }
            
            Section("Longitude:") {
                TextField("Required", text: $viewModel.long)
                    .keyboardType(.decimalPad)
            }
            
            if let error = viewModel.errorMessage {
                Text(error)
                    .foregroundStyle(.red)
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            
            Button("Create", action: viewModel.create)
                .buttonStyle(.borderedProminent)
                .listRowBackground(Color.clear)
                .frame(maxWidth: .infinity, alignment: .center)
        }
    }
}

#Preview {
    CreatePlaceView(viewModel: CreatePlaceViewModel(save: {_ in }))
}
