//
//  MovieProtocol.swift
//  OrangeTask
//
//  Created by Elkilany on 02/12/2023.
//

import Foundation

protocol MovieViewProtocol: AnyObject { // viewController
    var presenter: MoviePresenterProtocol? {get set}
    func reloadData()
    func searchBarIsEmpty() -> Bool
}

protocol MoviePresenterProtocol: AnyObject {
    var  view: MovieViewProtocol? {get set}
    func viewDidLoad()
    var  numberOfRows: Int {get}
    func categorizedMovies()
    var  numberOfSection: Int {get}
    func numberOfRowInSection(section:Int)->Int
    func getTitleInSection(section:Int)->String
    func configureCell(cell:MovieCellView,index:IndexPath)
    func getTop5RatedMovie(searchText:String)
    var  isFilterd:Bool {get}
    func didSelectMovie(selectMovie: MovieItem)
    func getSelectedMovie(index:IndexPath)-> MovieItem?
}

protocol MovieRouterProtocol {
    func pushToDetails( movie: MovieItem)
}

protocol MovieInteractorInputProtocol { // used in presenter
    var presenter: MovieInteractorOutputProtocol? { get set }
    func getMovies()
}

protocol MovieInteractorOutputProtocol: AnyObject {
    func getMovieList(movie:[MovieItem])
    func getMovieError(error:String)
}


protocol MovieCellView {
    func configure(entity:MovieEntity)
}
