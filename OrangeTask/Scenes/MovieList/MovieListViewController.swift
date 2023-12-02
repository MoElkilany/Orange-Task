//
//  MovieListViewController.swift
//  OrangeTask
//
//  Created by Elkilany on 02/12/2023.
//

import UIKit

class MovieListViewController: UIViewController, MovieViewProtocol {
   
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var moviesTableView: UITableView!
    
    var presenter: MoviePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Movies"
        setupTableView()
        setupSearchBar()
        presenter?.viewDidLoad()
        presenter?.categorizedMovies()
    }
    
    private func setupTableView(){
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
        moviesTableView.register(UINib(nibName: MovieCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: MovieCell.reuseIdentifier)
    }
    
    private func setupSearchBar(){
        searchBar.placeholder = "movie name"
        searchBar.delegate = self
    }
    
    
    func reloadData() {
        DispatchQueue.main.async {
            self.moviesTableView.reloadData()
        }
    }
    
    func searchBarIsEmpty() -> Bool {
        return searchBar.text?.isEmpty ?? true
    }
}


extension MovieListViewController: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter?.numberOfSection ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowInSection(section: section  ) ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return  presenter?.getTitleInSection(section:section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.reuseIdentifier) as? MovieCell
        presenter?.configureCell(cell: cell!  , index: indexPath)
        return cell ?? UITableViewCell()
    }
}


extension MovieListViewController:UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.presenter?.getTop5RatedMovie(searchText: searchText)
    }
}
