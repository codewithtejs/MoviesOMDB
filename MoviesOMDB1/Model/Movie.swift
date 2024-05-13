//
//  Movie.swift
//  MoviesOMDB1
//
//  Created by Gurtej Singh on 2024-05-13.
//

import Foundation
struct SearchResult: Codable {
    let search: [Movie]
    enum CodingKeys: String, CodingKey {
        case search = "Search"
    }
}

struct Movie: Codable {
    let title: String
    let year: String
    let posterURL: String
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case posterURL = "Poster"
    }
}
