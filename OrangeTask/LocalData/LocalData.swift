//
//  LocalData.swift
//  OrangeTask
//
//  Created by Elkilany on 02/12/2023.
//

import Foundation

class LocalData {
    
    func decodeMoviesFromJSON(completionHandler: @escaping ((MovieModel?, String? )->() )) {
        guard let filePath = Bundle.main.path(forResource: "movies", ofType: "json") else {
            completionHandler(nil,"File not found")
            return
        }
        
        guard let jsonString = try? String(contentsOfFile: filePath) else {
            completionHandler(nil,"Unable to read file")
            return
        }
        
        do {
            let jsonData = Data(jsonString.utf8)
            let movies = try JSONDecoder().decode(MovieModel.self, from: jsonData)
            completionHandler(movies,nil)
        } catch {
            completionHandler(nil,"Error decoding JSON: \(error)")
        }
        
    }
    
    
}
