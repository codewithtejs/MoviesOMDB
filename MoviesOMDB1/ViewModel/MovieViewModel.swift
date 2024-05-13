//
//  MovieViewModel.swift
//  MoviesOMDB1
//
//  Created by Gurtej Singh on 2024-05-13.
//

import Foundation

// MARK: - Movie List View Model
class MovieListViewModel {
    
    // MARK: - Callbacks
    var onMoviesUpdated: (() -> Void)?
    
    // MARK: - Variables
    private(set) var movieViewModel: [MovieViewModel] = [] {
        didSet {
            self.onMoviesUpdated?()
        }
    }
}

extension MovieListViewModel {
    
    // MARK: - Public Methods
    
    /// Returns the view model for the movie at the specified index.
    func movieViewModel(at index: Int) -> MovieViewModel {
        return self.movieViewModel[index]
    }
    
    /// Fetches movies from the OMDB API based on the search term.
    func fetchMovies(searchTerm: String) {
        guard let movieUrl = Constants.Urls.urlForMovieSearch(key: searchTerm) else { return }
        let resource = Resource<SearchResult>(url: movieUrl)
        Webservice().load(resource: resource) { [weak self] result in
            switch result {
            case .success(let result):
                self?.movieViewModel = result.search.map(MovieViewModel.init)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension MovieListViewModel {
    
    // MARK: - Computed Properties
    
    /// Number of sections in the table view.
    var numberOfSection: Int {
        return 1
    }
    
    /// Number of rows in the table view.
    var numberOfRows: Int {
        return movieViewModel.count
    }
}

// MARK: - Movie View Model
struct MovieViewModel {
    let movie: Movie
}

extension MovieViewModel {
    
    // MARK: - Computed Properties
    
    /// Title of the movie.
    var title: String {
        return movie.title
    }
    
    /// URL string for the movie's poster image.
    var poster: String {
        return movie.posterURL
    }
    
    /// Year of release for the movie.
    var year: String {
        return movie.year
    }
}
