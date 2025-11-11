import SwiftUI
import AVKit

struct VideoContentView: View {
    @State private(set) var videoContentViewModel: VideoContentViewModel

    var body: some View {
        NavigationStack {
            if videoContentViewModel.player != nil {
                VideoPlayer(player: videoContentViewModel.player)
            }
        }
        .onAppear {
            Task {
                await videoContentViewModel.fetchVideo()
            }
        }
    }
}