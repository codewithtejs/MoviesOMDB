//
//  String+Extensions.swift
//  MoviesOMDB1
//
//  Created by Gurtej Singh on 2024-05-13.
//

import Foundation

extension String {
    
    // MARK: - Public Methods
    
    /// Returns an escaped version of the string suitable for use in a URL.
    func escaped() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
}
