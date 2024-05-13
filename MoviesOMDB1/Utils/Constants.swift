//
//  Constants.swift
//  MoviesOMDB1
//
//  Created by Gurtej Singh on 2024-05-13.
//

import Foundation

struct Constants{
    struct Urls{
        static func urlForMovieSearch(key: String) -> URL? {
            let apiKey = "c16c712f"
            return URL(string: "http://www.omdbapi.com/?s=\(key.escaped())&apikey=\(apiKey)")
        }
    }
}
