import SwiftUI

@Observable
class CreatorViewModel {
    var creator: Creator
    var blogPosts: [BlogPost]

    init(creator: Creator) {
        self.creator = creator
        self.blogPosts = [];
    }

    func fetchBlogPosts() async {
        print("creator fetched")

        var request = URLRequest(url: URL(string: "https://www.floatplane.com/api/v3/content/creator?id=\(creator.id)")!)
        request.addValue("", forHTTPHeaderField: "Cookie")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! [Dictionary<String, AnyObject>]
                print(json)
                let decoder = JSONDecoder()
                self.blogPosts = try decoder.decode([BlogPost].self, from: data!)
            } catch {
                print("error")
            }
        })

        task.resume()
    }
}