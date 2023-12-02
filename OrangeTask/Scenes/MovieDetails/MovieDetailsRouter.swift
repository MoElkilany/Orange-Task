//
//  MovieDetailsRouter.swift
//  OrangeTask
//
//  Created by Elkilany on 02/12/2023.
//

import UIKit

class MovieDetailsRouter:MovieDetailsRouterProtocol {
    
    weak var viewController: UIViewController?

    static func createModule(selectItem:MovieItem)->UIViewController {
        let view = MovieDetailsViewController()
        let interactor = MovieDetailsInteractor()
        let router = MovieDetailsRouter()
        let presenter = MovieDetailsPresenter(view: view, interactor: interactor, router: router)
        presenter.selectMovie = selectItem
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
    
}
