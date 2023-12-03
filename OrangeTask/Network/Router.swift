//
//  Router.swift
//  OrangeTask
//
//  Created by Elkilany on 02/12/2023.
//

import Foundation
import Alamofire
 
enum Router: URLRequestConvertible {
    
    case getPhotos(movieTitle: String, page: Int)
    
    var method: HTTPMethod {
        switch self {
        case .getPhotos:
            return .get
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .getPhotos(let movieTitle, let page):
            
            var params: [String: Any] = [
                "method": "flickr.photos.search",
                "api_key": Constants.apiKey,
                "format": "json",
                "nojsoncallback": 1,
                "text": movieTitle,
                "page": page,
                "per_page": 10
            ]
            return params
        }
    }
    
    var url: URL {
        switch self {
            
        case .getPhotos:
            var components = URLComponents(string: Constants.baseURL)!
            components.queryItems = parameters?.map { key, value in
                URLQueryItem(name: key, value: "\(value)")
            }
            return components.url!
            
        }
    }
    
    var encoding: ParameterEncoding {
        return URLEncoding.default
        
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        return try encoding.encode(urlRequest, with: parameters)
    }
}



