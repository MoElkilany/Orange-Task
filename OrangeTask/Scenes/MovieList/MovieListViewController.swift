//
//  MovieListViewController.swift
//  OrangeTask
//
//  Created by Elkilany on 02/12/2023.
//

import UIKit

class MovieListViewController: UIViewController {

    @IBOutlet weak var moviesTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Movies"
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
        moviesTableView.register(UINib(nibName: MovieCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: MovieCell.reuseIdentifier)
    }
 
}

extension MovieListViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.reuseIdentifier) as? MovieCell
        
        return cell ?? UITableViewCell()
    }
    
}
