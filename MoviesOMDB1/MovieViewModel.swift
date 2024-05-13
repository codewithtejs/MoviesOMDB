//
//  MovieViewModel.swift
//  MoviesOMDB1
//
//  Created by Gurtej Singh on 2024-05-13.
//

import Foundation

struct MovieListViewModel{
    var movieViewModel : [MovieViewModel]
}
extension MovieListViewModel{
    init() {
        self.movieViewModel = [MovieViewModel]()
    }
}
extension MovieListViewModel{
    
    func movieViewModel(at index:Int) -> MovieViewModel{
        return self.movieViewModel[index]
    }
}

extension MovieListViewModel{
    var numberOfSection : Int {
        return 1
    }
    var numberOfRows : Int {
        return movieViewModel.count
    }
}

struct MovieViewModel{
    let movie : Movie
}
extension MovieViewModel{
    var title : String {
        return movie.title
    }
    var poster : String{
        return movie.posterURL
    }
    var year : String {
        return movie.year
    }
}
