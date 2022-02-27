//
//  NetworkLayer.swift
//  MovieApp
//
//  Created by Chu Yu Min on 2022/02/27.
//

import Foundation

enum MovieAPIType {
    case justURL(urlString: String) //url
    case searchMovie(querys: [URLQueryItem]) //url + param
    
}

enum MovieAPIError: Error {
    case urlException
}
class NetworkLayer {
    
    typealias NetworkCompletion = ( _ data: Data?, _ response: URLResponse?, _ error: Error? ) -> Void
    
    func request(type: MovieAPIType, completion: @escaping NetworkCompletion) {
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        
        do {
            let request = try buildRequest(type: type)
            session.dataTask(with: request) { data, response, error in
                print( (response as! HTTPURLResponse).statusCode )
                
                completion(data, response, error)
                
            }.resume()
            session.finishTasksAndInvalidate()
            
        } catch {
            print(error)
        }
        
    }
    
    func buildRequest(type: MovieAPIType) throws -> URLRequest {
        
        switch type {
            
        case .justURL(urlString: let urlString):
            guard let hasURL = URL(string: urlString) else {
                throw MovieAPIError.urlException
            }
            
            var request = URLRequest(url: hasURL)
            request.httpMethod = "GET"
            return request
            
        case .searchMovie(querys: let querys):
            var components = URLComponents(string: "https://itunes.apple.com/search")
            components?.queryItems = querys
            
            guard let hasUrl = components?.url else {
                throw MovieAPIError.urlException
            }
            
            var request = URLRequest(url: hasUrl)
            request.httpMethod = "GET"
            return request
        }
    }
}
