//
//  ViewController.swift
//  StackOverflowSampleProject
//
//  Created by dylan.bruschi on 12/6/18.
//  Copyright © 2018 dylan.bruschi. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    // MARK: Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Properties
    var questions = [Question]()
    let cellId = "cellId"
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: Tableview methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! SearchTableViewCell
        
        cell.question = questions[indexPath.row]
        
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            APIService.shared.fetchQuestionsWithSearchTerm(searchTerm: searchText) { questions in
                DispatchQueue.main.async {
                    self.questions = questions
                    self.tableView.reloadData()
                }
            }
    }
}

