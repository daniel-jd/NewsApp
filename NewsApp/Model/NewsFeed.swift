//
//  NewsFeed.swift
//  NewsApp
//
//  Created by Daniel Yamrak on 27.02.2021.
//

import Foundation

struct NewsFeed: Decodable {
    
    var status: String = "" // если точно знаешь, что не будет nil
    var totalResults: Int = 0
    var articles: [Article]?
}
