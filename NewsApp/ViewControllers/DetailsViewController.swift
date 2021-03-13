//
//  DetailsViewController.swift
//  NewsApp
//
//  Created by Daniel Yamrak on 13.03.2021.
//

import UIKit

class DetailsViewController: UIViewController {

    var news: Article?
    
    
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsBodyTextView: UITextView!
    
    @IBAction func backItemTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("🐥 Init Details VC")

        prepareView()

    
    }
    
    deinit { print("🔥 deinit DetailVC") }
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.navigationBar.isHidden = true
    }
    
    func prepareView() {
        //print("🐷 Prepare view()")
        if news != nil && news!.urlToImage != nil {
            if let url = URL(string: news!.urlToImage!) {
                newsImageView.load(url: url)
            }
        }
        newsTitleLabel.text = news?.title
        newsBodyTextView.text = news?.content
        
    } // end func


}
