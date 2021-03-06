//
//  ViewController.swift
//  NewsApp
//
//  Created by Daniel Yamrak on 27.02.2021.
//

import UIKit

class ViewController: UITableViewController {

    
//    @IBOutlet weak var imageView: UIImageView!
//    @IBOutlet weak var titleTextLabel: UILabel!
//    @IBOutlet weak var publishedTextLabel: UILabel!
    
    let newsFeed = NewsFeed()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let manager = NetworkManager()
        manager.loadNews {
            // Обновляем данные в таблице в ОСНОВНОМ потоке
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // количество ячеек, которое будем выводить равно количеству статей или 1
        return newsFeed.articles?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let article = newsFeed.articles?[indexPath.row]
        
        cell.textLabel?.text = article?.title
        cell.detailTextLabel?.text = article?.publishedAt
        
        // Set the Image for the corresponding article
        //cell.imageView?.image =

        return cell
    }
    
    
    
}

