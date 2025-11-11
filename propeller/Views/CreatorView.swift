import SwiftUI

struct CreatorView: View {
    @State private(set) var creatorViewModel: CreatorViewModel

    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(creatorViewModel.blogPosts) { blogPost in
                    NavigationLink {
                        VideoContentView(videoContentViewModel: VideoContentViewModel(videoContent: blogPost))
                    } label: {
                        Video(blogPost: blogPost)
                    }
                    .buttonStyle(PlainButtonStyle()) // stops text from being blue
                }
            }
            .navigationTitle(creatorViewModel.creator.title)
        }
        .onAppear {
            Task {
                await creatorViewModel.fetchBlogPosts()
            }
        }
    }
}