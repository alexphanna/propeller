import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                Video()
                Video()
                Video()
            }
            .navigationTitle("Home")
        }
    }
}