import SwiftUI

struct CreatorsView: View {
    @State private var searchText: String = ""
    @State private var creatorsViewModel = CreatorsViewModel()

    var body: some View {
        NavigationStack {
            List(creatorsViewModel.sortedCreators) { creator in
                NavigationLink(creator.title, destination: CreatorView(creatorViewModel: CreatorViewModel(creator: creator)))
            }
            .navigationTitle("Creators")
        }
        .searchable(text: $searchText)
        .onAppear {
            Task {
                await creatorsViewModel.fetchCreators()
            }
        }
    }
}