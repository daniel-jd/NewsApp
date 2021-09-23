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
        
        tableView.rowHeight = 88

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
            //Refresh data in the tableView on the main thread
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articlesList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ID.cellIdentifier, for: indexPath) as! NewsCell // Используем нашу кастомную ячейку!
        let article = articlesList[indexPath.row]
        cell.setCell(article: article)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // go to DetailsVC screen
        let storyboard = UIStoryboard(name: Storyboards.main, bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "DetailsViewController") as! DetailsViewController
        
        // Передаем выбранную новость на DetailsViewController в переменную news
        vc.news = articlesList[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }

}
