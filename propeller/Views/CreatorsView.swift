import SwiftUI

struct CreatorsView: View {
    @State private var searchText: String = ""
    @State private var creatorsViewModel = CreatorsViewModel()

    var body: some View {
        NavigationStack {
            List(creatorsViewModel.sortedCreators) { creator in
                Text(creator.title)
            }
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