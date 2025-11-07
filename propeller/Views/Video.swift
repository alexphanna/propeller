import SwiftUI

struct Video: View {
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            RoundedRectangle(cornerRadius: 10.0)
                .fill(Color.gray)
                .aspectRatio(CGSize(width: 16, height: 9), contentMode: .fit)
            Text("Title")
                .bold()
        }
        .padding()
    }
}