//
//  MovieDetailsWorker.swift
//  OrangeTask
//
//  Created by Elkilany on 03/12/2023.
//


import Foundation

class MovieDetailsWorker {
    
    private let networkLayer = NetworkLayer()
    
    func getMoviePhotos(movieTitle: String, page:Int, completionHandler: @escaping (Result<MoviePhotosModel>) -> ()) {
        networkLayer.request(Router.getPhotos(movieTitle: movieTitle, page: page), decodeToType: MoviePhotosModel.self, completionHandler: completionHandler)
    }
    
}
