//
//  MoviePresenter.swift
//  OrangeTask
//
//  Created by Elkilany on 02/12/2023.
//

import Foundation

class MoviePresenter:MoviePresenterProtocol, MovieInteractorOutputProtocol {
       
    weak var view: MovieViewProtocol?
    private let interactor: MovieInteractorInputProtocol?
    private let router: MovieRouterProtocol?
    private var moviesList = [MovieItem]()
    private var categorizedMoviesByYear: [Int: [MovieItem]] = [:]
    private var filtedMovies: [Int: [MovieItem]] = [:]
    
    init(view: MovieViewProtocol? , interactor: MovieInteractorInputProtocol?, router: MovieRouterProtocol?) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        interactor?.getMovies()
    }
    
    func getMovieList(movie: [MovieItem]) {
        self.moviesList.append(contentsOf: movie)
        view?.reloadData()
    }
    
    func getMovieError(error: String) {
        print("\(error)")
    }
    var numberOfRows: Int{
        return moviesList.count
    }
    
    var numberOfSection: Int{
        return  isFilterd ?  filtedMovies.keys.count : categorizedMoviesByYear.keys.count
    }
    
    func numberOfRowInSection(section: Int) -> Int {
        let year = Array(  isFilterd ?  filtedMovies.keys.sorted() : categorizedMoviesByYear.keys.sorted())[section]
        return isFilterd ?  filtedMovies[year]?.count ?? 0 :  categorizedMoviesByYear[year]?.count ?? 0
    }
  
    
    func configureCell(cell: MovieCellView, index: IndexPath) {
        
        let year = Array( isFilterd ?  filtedMovies.keys.sorted() : categorizedMoviesByYear.keys.sorted() )[index.section]
        if  let movie = isFilterd ?  filtedMovies[year]?[index.row] : categorizedMoviesByYear[year]?[index.row]{
            let entity = MovieEntity(movieItem: movie)
            cell.configure(entity: entity)
        }
        
    }
        
    func categorizedMovies(){
        let groupedMovies = Dictionary(grouping: self.moviesList, by: { $0.year })
        var categorizedMovies: [Int: [MovieItem]] = [:]
        for (year, moviesInYear) in groupedMovies {
            categorizedMovies[year] = moviesInYear
        }
        self.categorizedMoviesByYear = categorizedMovies
    }
    
    
    func getTitleInSection(section: Int) -> String {
        let sortedYears: [Int] =  isFilterd ?  filtedMovies.keys.sorted() : categorizedMoviesByYear.keys.sorted()
        return  String(sortedYears[section])
    }
    
    
    func getTop5RatedMovie(searchText: String) {
        
        let filteredMovies = moviesList.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        
        var categorizedMovies: [Int: [MovieItem]] = [:]
        let groupedMovies = Dictionary(grouping: filteredMovies, by: { $0.year })
        for (year, moviesInYear) in groupedMovies {
            let sortedMovies = moviesInYear.sorted { $0.rating > $1.rating }
            let topMovies = Array(sortedMovies.prefix(5))
            categorizedMovies[year] = topMovies
        }
        self.filtedMovies = categorizedMovies
        self.view?.reloadData()
    }
    
    
    var isFilterd: Bool {
        return  !(self.view?.searchBarIsEmpty() ?? true)
    }
    
}
