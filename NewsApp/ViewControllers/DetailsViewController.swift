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
    
    @IBAction func backItemTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = true

    }
    


}
