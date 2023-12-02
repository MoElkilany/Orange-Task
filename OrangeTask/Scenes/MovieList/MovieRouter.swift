//
//  MovieRouter.swift
//  OrangeTask
//
//  Created by Elkilany on 02/12/2023.
//

import UIKit

class MovieRouter:MovieRouterProtocol {
    weak var viewController: UIViewController?
    
    static func createModule()->UIViewController {
        let view = MovieListViewController()
        let interactor = MovieInteractor()
        let router = MovieRouter()
        let presenter = MoviePresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
    
    
    func pushToDetails(movie: MovieItem) {
        let movieDetailsViewController = MovieDetailsRouter.createModule(selectItem: movie)
        viewController?.navigationController?.pushViewController(movieDetailsViewController, animated: true)
        
        
//        let detailsModuleViewController = DetailsRouter.assembleModule(article)
//        viewController?.navigationController?.pushViewController(detailsModuleViewController, animated: true)
    }
    
}
