//
//  NetworkCall.swift
//  NewsApp
//
//  Created by Daniel Yamrak on 06.03.2021.
//

import Foundation

func loadNews(completionHandler: (()->Void)?) {
    
//    let urlString = "http://newsapi.org/v2/top-headlines?country=ua&apiKey=b2aa19d62b3e4c53b0df1e842c6c46a6"
    let urlString = "http://newsapi.org/v2/top-headlines?country=ua&apiKey=b2aa19d62b3e4c53b0df1e842c6c46a6"
    
    
    let url = URL(string: urlString)
    guard url != nil else {
        print("🍄 url is nil")
        return
    }
    
    let session = URLSession.shared
    
    let dataTask = session.dataTask(with: url!) { (data, response, error) in
        
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
        }
    }
    
    parseNews()
    completionHandler?()
    
    // Make tha API call
    dataTask.resume()
}

func parseNews() {
    print("🐥 parseNews function called!!!")
}
