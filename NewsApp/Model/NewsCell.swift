//
//  NewsCellTableViewCell.swift
//  NewsApp
//
//  Created by Daniel Yamrak on 13.03.2021.
//

import UIKit

class NewsCell: UITableViewCell {
    
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var descriptionText: UILabel!
    @IBOutlet weak var dateText: UILabel!
    
    
    func setCell(article: Article) {
        newsTitle.text = article.title
        descriptionText.text = article.description
        dateText.text = article.publishedAt
        if article.urlToImage != nil {
            if let url = URL(string: article.urlToImage!) {
                newsImage.load(url: url)
            }
        }
    }
}
