//
//  MovieDetailsProtocol.swift
//  OrangeTask
//
//  Created by Elkilany on 02/12/2023.
//

import Foundation

protocol MovieDetailsViewProtocol: AnyObject {
    var presenter: MovieDetailsPresenterProtocol? {get set}
}

protocol MovieDetailsPresenterProtocol: AnyObject {
    var view: MovieDetailsViewProtocol? {get set}
    func showSelectedMovie()
}

protocol MovieDetailsRouterProtocol {
}

protocol MovieDetailsInteractorInputProtocol {
    var presenter: MovieDetailsInteractorOutputProtocol? { get set }
}

protocol MovieDetailsInteractorOutputProtocol: AnyObject {
    
}
