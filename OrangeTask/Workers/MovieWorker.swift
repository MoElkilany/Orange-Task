//
//  MovieWorker.swift
//  OrangeTask
//
//  Created by Elkilany on 02/12/2023.
//

import Foundation

class MovieWorker {
    
    private let localData = LocalData()
    
    func getMovies(completionHandler: @escaping ( (MovieModel?,String?)->() ) ){
        localData.decodeMoviesFromJSON(completionHandler: completionHandler)
    }
}
