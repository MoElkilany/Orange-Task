//
//  NetworkLayer.swift
//  OrangeTask
//
//  Created by Elkilany on 02/12/2023.
//

import Foundation
import Alamofire

enum Result<T> {
    case success(T)
    case failure(Error)
}

class NetworkLayer {
    
    func request<T: Codable>(_ request: URLRequestConvertible, decodeToType type: T.Type, completionHandler: @escaping (Result<T>) -> ()) {
        AF.request(request).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let decoded = try JSONDecoder().decode(T.self, from: data)
                    completionHandler(.success(decoded))
                } catch {
                    completionHandler(.failure(error))
                }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
}
