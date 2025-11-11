import SwiftUI

struct Video: View {
    @State var blogPost: BlogPost;

    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            Image(uiImage: UIImage(data: try! Data(contentsOf: URL(string: blogPost.thumbnail.path)!))!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            HStack {
                Image(uiImage: UIImage(data: try! Data(contentsOf: URL(string: blogPost.channel.icon.path)!))!)
                    .resizable()
                    .frame(width: 50, height: 50) // temporary sizing solution
                    .clipShape(Circle())
                Text(blogPost.title)
                    .bold()
                    .multilineTextAlignment(.leading)
            }
        }
        .padding()
    }
}