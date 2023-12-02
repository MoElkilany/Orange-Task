//
//  MovieDetailsPresenter.swift
//  OrangeTask
//
//  Created by Elkilany on 02/12/2023.
//

import Foundation

class MovieDetailsPresenter: MovieDetailsPresenterProtocol , MovieDetailsInteractorOutputProtocol{
   
    
    weak var view: MovieDetailsViewProtocol?
    private let interactor: MovieDetailsInteractorInputProtocol?
    private let router: MovieDetailsRouterProtocol?
    
    var selectMovie:MovieItem?
    
    init(view: MovieDetailsViewProtocol? , interactor: MovieDetailsInteractorInputProtocol?, router: MovieDetailsRouterProtocol?) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    
    func showSelectedMovie() {
        print("The selected Movie will be \(selectMovie)")
    }
     
}
