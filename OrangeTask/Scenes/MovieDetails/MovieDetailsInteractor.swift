//
//  MovieDetailsInteractor.swift
//  OrangeTask
//
//  Created by Elkilany on 02/12/2023.
//

import Foundation

class MovieDetailsInteractor:MovieDetailsInteractorInputProtocol {
    
    weak var presenter: MovieDetailsInteractorOutputProtocol?
    
    private let photosWorkers = MovieDetailsWorker()
    
    func getPhotos(movieTitle: String, page: Int) {
        presenter?.isFetching = true
        photosWorkers.getMoviePhotos(movieTitle: movieTitle, page: page) { [weak self] result in
            guard let self = self else { return }
       
                self.presenter?.isFetching = false
                 
            
            switch result {
            case .success(let photosModel):
                self.presenter?.photosFetchedSuccessfully(photosModel: photosModel)
            case .failure(let error):
                self.presenter?.photosFetchedFailed(withError: error)
            }
        }
    }
    
}
