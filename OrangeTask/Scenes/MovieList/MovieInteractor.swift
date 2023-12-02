//
//  MovieInteractor.swift
//  OrangeTask
//
//  Created by Elkilany on 02/12/2023.
//

import Foundation

class MovieInteractor: MovieInteractorInputProtocol {
       
    weak var presenter: MovieInteractorOutputProtocol?
    private let movieWorkers = MovieWorker()
    
    func getMovies() {
        movieWorkers.getMovies { [weak self] movieData, error in
            guard let self = self else {return}
            self.presenter?.getMovieList(movie: movieData?.movies ?? [])
            self.presenter?.getMovieError(error: error ?? "" )
        }
    }
    
}
