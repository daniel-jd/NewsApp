//
//  DetailsViewController.swift
//  NewsApp
//
//  Created by Daniel Yamrak on 13.03.2021.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsBodyTextView: UITextView!

    var news: Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        prepareView()

    }
    
    func prepareView() {
        if news != nil && news!.urlToImage != nil {
            if let url = URL(string: news!.urlToImage!) {
                newsImageView.load(url: url)
            }
        }
        newsTitleLabel.text = news?.title
        newsBodyTextView.text = news?.content
    }

}
