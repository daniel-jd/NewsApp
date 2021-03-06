//
//  Article.swift
//  NewsApp
//
//  Created by Daniel Yamrak on 27.02.2021.
//

import Foundation

struct Article: Codable {
    
    var source: String?
    var author: String?
    var title: String?
    var description: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
}
