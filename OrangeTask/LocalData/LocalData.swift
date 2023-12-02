//
//  LocalData.swift
//  OrangeTask
//
//  Created by Elkilany on 02/12/2023.
//

import Foundation

class LocalData {
    
    func decodeMoviesFromJSON() {
        guard let filePath = Bundle.main.path(forResource: "movies", ofType: "json") else {
            return
        }
        
        guard let jsonString = try? String(contentsOfFile: filePath) else {
            return
        }

        do {
            let jsonData = Data(jsonString.utf8)
            let movies = try JSONDecoder().decode(MovieModel.self, from: jsonData)
        } catch {
            print("Error decoding JSON: \(error)")
        }
    }
}
