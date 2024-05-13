//
//  Movie.swift
//  MoviesOMDB1
//
//  Created by Gurtej Singh on 2024-05-13.
//

import Foundation

// MARK: - SearchResult Struct
struct SearchResult: Codable {
    let search: [Movie]
    
    // MARK: - CodingKeys Enum
    enum CodingKeys: String, CodingKey {
        case search = "Search"
    }
}

// MARK: - Movie Struct
struct Movie: Codable {
    let title: String
    let year: String
    let posterURL: String
    
    // MARK: - CodingKeys Enum
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case posterURL = "Poster"
    }
}
