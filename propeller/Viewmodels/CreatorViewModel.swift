import SwiftUI

@Observable
class CreatorsViewModel {
    var creators: [Creator]

    var sortBy: String
    var sortedCreators: [Creator] {
        return creators.sorted { ($0.title) < ($1.title)  }
    }

    init() {
        self.creators = [];
        self.sortBy = "name";

        var request = URLRequest(url: URL(string: "https://www.floatplane.com/api/v3/creator/list")!)
        request.addValue("[COOKIE HERE]", forHTTPHeaderField: "Cookie")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                let decoder = JSONDecoder()
                self.creators = try decoder.decode([Creator].self, from: data!)
            } catch {
                print("error")
            }
        })

        task.resume()
    }
}