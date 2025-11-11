import SwiftUI
import AVKit

@Observable
class VideoContentViewModel {
    var videoContent : BlogPost
    var player: AVPlayer?

    init(videoContent : BlogPost) {
        self.videoContent = videoContent
    }

    func fetchVideo() async {
        var request = URLRequest(url: URL(string: "https://www.floatplane.com/api/v3/delivery/info?scenario=onDemand&entityId=\(videoContent.videoAttachments[0])")!)
        request.addValue("", forHTTPHeaderField: "Cookie")

        let httpCookie = HTTPCookie(properties: [
            .domain: ".floatplane.com",
            .path: "/",
            .name: "sails.sid",
            .value: "",
            .secure: "Secure",
        ])
        HTTPCookieStorage.shared.setCookies([httpCookie!], for: URL(string: "https://www.floatplane.com"), mainDocumentURL: nil)
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>

                var url = ""
                url += ((json["groups"] as! [Dictionary<String, AnyObject>])[0]["origins"] as! [Dictionary<String, AnyObject>])[0]["url"] as! String
                url += ((json["groups"] as! [Dictionary<String, AnyObject>])[0]["variants"] as! [Dictionary<String, AnyObject>])[1]["url"] as! String

                let cookiesArray = HTTPCookieStorage.shared.cookies!
                let values = HTTPCookie.requestHeaderFields(with: cookiesArray)
                let cookieArrayOptions = ["AVURLAssetHTTPHeaderFieldsKey": values]
                let assets = AVURLAsset(url: URL(string: url)!, options: cookieArrayOptions)
                let item = AVPlayerItem(asset: assets)
                self.player = AVPlayer(playerItem: item)
            } catch {
                print("error")
            }
        })

        task.resume()
    }
}