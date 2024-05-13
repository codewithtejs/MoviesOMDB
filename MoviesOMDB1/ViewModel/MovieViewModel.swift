//
//  MovieViewModel.swift
//  MoviesOMDB1
//
//  Created by Gurtej Singh on 2024-05-13.
//

import Foundation

class MovieListViewModel{
    
    // MARK: - Callbacks
    var onMoviesUpdated: (()->Void)?
    
    // MARK: - Variables
    private(set) var movieViewModel: [MovieViewModel] = [] {
        didSet {
            self.onMoviesUpdated?()
        }
    }
}
extension MovieListViewModel{
    
    func movieViewModel(at index:Int) -> MovieViewModel{
        return self.movieViewModel[index]
    }
    func fetchMovies(searchTerm: String) {
        guard let movieUrl = Constants.Urls.urlForMovieSearch(key: searchTerm) else { return}
        let resource = Resource<SearchResult>(url: movieUrl)
        Webservice().load(resource: resource) {[weak self] result in
            switch result{
            case .success(let result):
                self?.movieViewModel = result.search.map(MovieViewModel.init)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
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
