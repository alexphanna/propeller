import SwiftUI

struct HistoryView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                Video()
                Video()
                Video()
            }
            .navigationTitle("History")
        }
    }
}