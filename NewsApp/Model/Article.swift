//
//  Article.swift
//  NewsApp
//
//  Created by Daniel Yamrak on 27.02.2021.
//

import Foundation

struct Article: Decodable {
    
    var source: Source?
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
}

struct Source: Decodable {
    var id: String?
    var name: String?
}
