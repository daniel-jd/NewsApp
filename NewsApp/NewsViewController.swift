//
//  ViewController.swift
//  NewsApp
//
//  Created by Daniel Yamrak on 27.02.2021.
//

import UIKit

class NewsViewController: UITableViewController {
    
    let manager = NetworkManager()
    var articlesList = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Instanse of NetworkManager to make networking calls, etc
        manager.loadNews { [weak self] result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let articles):
                for item in articles {
                    self?.articlesList.append(item)
                }
            }
            //Refresh data in the tableView in the main thread
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // количество ячеек, которое будем выводить равно количеству статей или 1
        return articlesList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let article = articlesList[indexPath.row]

        cell.textLabel?.text = article.title
        cell.detailTextLabel?.text = article.description

        return cell
    }

    
    
} // end class ViewController

