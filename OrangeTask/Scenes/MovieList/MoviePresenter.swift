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
    
    init(view: MovieViewProtocol? , interactor: MovieInteractorInputProtocol?, router: MovieRouterProtocol?) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    
    func viewDidLoad() {
        interactor?.getMovies()
        print("view didload")
        
    }
    
    
}
