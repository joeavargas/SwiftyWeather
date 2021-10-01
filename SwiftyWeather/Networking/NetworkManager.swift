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
    static func fetchData(for url: URL, completion: @escaping (Result<T, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            // Handle session error
            guard error == nil else {
                print("DEBUG: \(error!.localizedDescription)")
                print(#function)
                completion(.failure(.error(err: error!.localizedDescription)))
                return
            }
            
            // Handle response error
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                print(#function)
                return
            }
            
            switch httpResponse.statusCode {
            
            case 200:
                print("DEBUG: response status OK")
                
            case 429:
                print("DEBUG: Status code 429: temporary blocked due to exceeding of requests limitation of your ")
                
            default:
                break
            }
            
            // Handle data
            guard let data = data else {
                completion(.failure(.invalidData))
                print(#function)
                return
            }
            
            do {
                let json = try JSONDecoder().decode(T.self, from: data)
                completion(.success(json))
            } catch let err {
                print("DEBUG: \(err.localizedDescription)")
                completion(.failure(.decodingError(err: err.localizedDescription)))
                print(#function)
            }
        }.resume()
    }
}
