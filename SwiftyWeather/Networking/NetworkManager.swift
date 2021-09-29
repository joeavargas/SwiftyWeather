//
//  NetworkManager.swift
//  SwiftyWeather
//
//  Created by Joe Vargas on 9/29/21.
//

import Foundation

enum NetworkError: Error {
    case invalidResponse
    case invalidData
    case error(err: String)
    case decodingError(err: String)
}

final class NetworkManager<T:Codable> {
    static func fetchData(from url: URL, completion: @escaping (Result<T, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            // Handle session error
            guard error == nil else {
                completion(.failure(.error(err: error!.localizedDescription)))
                return
            }
            
            // Handle response error
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            // Handle data
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let json = try JSONDecoder().decode(T.self, from: data)
                completion(.success(json))
            } catch let err {
                completion(.failure(.decodingError(err: err.localizedDescription)))
            }
        }.resume()
    }
}
