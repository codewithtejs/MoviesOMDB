//
//  Webservice.swift
//  MoviesOMDB1
//
//  Created by Gurtej Singh on 2024-05-13.
//

import Foundation
enum NetworkError : Error{
    case decodingError
    case domainError
    case urlError
}


struct Resource <T:Codable>{
    let url : URL
    var httpMethod : HTTP.Method = .get
    var body : Data? = nil
}

class Webservice{
    func load<T>(resource : Resource<T>, completion : @escaping (Result<T, NetworkError>) -> Void){
        var request = URLRequest(url: resource.url)
        request.httpMethod = resource.httpMethod.rawValue
        request.httpBody = resource.body
        request.addValues()
        
        URLSession.shared.dataTask(with: request) { data, response, error in
           guard let data = data, error == nil else{
                completion(.failure(.domainError))
                return
            }
            let result = try? JSONDecoder().decode(T.self, from: data)
            if let result = result{
                DispatchQueue.main.async {
                    completion(.success(result))
                }
            }
        }.resume()
    }
}
