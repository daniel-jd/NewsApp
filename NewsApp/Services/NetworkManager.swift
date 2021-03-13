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
    private let feedURL = "http://newsapi.org/v2/everything?q=apple&from=2021-03-12&to=2021-03-12&sortBy=popularity"
    private let API_KEY = "&apiKey=b2aa19d62b3e4c53b0df1e842c6c46a6"
    private let country = "country=ua"
    
    
    func loadNews(completion: @escaping (Result<[Article], Error>) -> Void) {
        
        var urlString: String {
            let fullURL = baseURL + searchFor + country + API_KEY
            return fullURL
//            let url2 = feedURL + API_KEY
//            return url2
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
                    // TODO: Check for nil!!!
                    completion(.success(newsFeed.articles!))
                    print()
                }
                catch {
                    print("⚠️ Error in JSON parsing: \(error.localizedDescription)")
                }
            } else {
                print("⚠️ Error: \(error!.localizedDescription)")
            }
        }
        // Make tha API call
        dataTask.resume()
    }

    
}
