//
//  URLRequest+Extensions.swift
//  MoviesOMDB1
//
//  Created by Gurtej Singh on 2024-05-13.
//

import Foundation

extension URLRequest {
    
    // MARK: - Public Methods
    
    /// Adds values to the URLRequest headers.
    mutating func addValues() {
        self.setValue(HTTP.Headers.Value.applicationJson.rawValue, forHTTPHeaderField: HTTP.Headers.Key.contentType.rawValue)
    }
}
