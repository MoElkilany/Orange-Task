//
//  MovieModel.swift
//  OrangeTask
//
//  Created by Elkilany on 02/12/2023.
//

import Foundation

struct MovieModel: Codable {
    let movies: [MovieItem]
}

struct MovieItem: Codable {
    let title: String
    let year: Int
    let cast: [String]
    let genres: [String]
    let rating: Int
}
