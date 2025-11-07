import SwiftUI

struct CreatorsView: View {
    @State private var searchText: String = ""

    var body: some View {
        NavigationStack {
            Text("Searching for \(searchText)")
                .navigationTitle("Creators")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Menu {
                            Text("Sort by")
                        } label: {
                            Image(systemName: "ellipsis.circle")
                        }
                    }
                }
        }
        .searchable(text: $searchText)
    }
}