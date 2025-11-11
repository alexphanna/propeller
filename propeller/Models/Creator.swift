class Creator : Codable, Identifiable {
    var title: String
    
    init(title: String) {
        self.title = title
    }
}