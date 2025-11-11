struct BlogPost : Codable, Identifiable {
    var id: String
    var title: String
    var videoAttachments: [String]
    var thumbnail: Thumbnail
    var channel: Channel
}

struct Thumbnail: Codable {
    var path: String
}

struct Channel: Codable {
    var icon: Icon
}
struct Icon: Codable {
    var path: String
}