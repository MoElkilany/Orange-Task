//
//  MovieProtocol.swift
//  OrangeTask
//
//  Created by Elkilany on 02/12/2023.
//

import Foundation

protocol MovieViewProtocol: AnyObject { // viewController
    var presenter: MoviePresenterProtocol? {get set}
}

protocol MoviePresenterProtocol: AnyObject {
    var view: MovieViewProtocol? {get set}
    func viewDidLoad()
}

protocol MovieRouterProtocol {
    
}

protocol MovieInteractorInputProtocol { // used in presenter
    var presenter: MovieInteractorOutputProtocol? { get set }
    func getMovies()
}

protocol MovieInteractorOutputProtocol: AnyObject {
    
}
