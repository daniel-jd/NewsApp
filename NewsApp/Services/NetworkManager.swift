//
//  NetworkCall.swift
//  NewsApp
//
//  Created by Daniel Yamrak on 06.03.2021.
//

import Foundation

class NetworkManager {
    
    private let baseURL = "https://newsapi.org/v2/"
    private let searchFor = "top-headlines?"
    private let API_KEY = "b2aa19d62b3e4c53b0df1e842c6c46a6"
    private let country = "ua"
    
    func loadNews(completionHandler: (()->Void)?) {
        
        var urlString: String {
            let fullURL = baseURL + searchFor + "country=" + country + "&apiKey=" + API_KEY
            print("✳️ " + fullURL)
            return fullURL
        }
        
        
        guard let url = URL(string: urlString) else {
            print("🍄 url is nil")
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            // Check for errors
            if error == nil && data != nil {
                
                // Parse JSON now, cause there is no errors!!!
                let decoder = JSONDecoder()
                
                do {
                    let newsFeed = try decoder.decode(NewsFeed.self, from: data!)
                    print(newsFeed)
                }
                catch {
                    print("🍄 Error in JSON parsing: \(error.localizedDescription)")
                }
            } else {
                print("⚠️ error: \(error!.localizedDescription)")
            }
        }
        
        //parseNews()
        //completionHandler?()
        
        // Make tha API call
        dataTask.resume()
    }

    func parseNews() {
        print("🐥 parseNews function called!!!")
    }
    
}
