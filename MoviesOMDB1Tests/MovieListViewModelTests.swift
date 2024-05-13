//
//  MovieListViewModelTests.swift
//  MoviesOMDB1Tests
//
//  Created by Gurtej Singh on 2024-05-13.
//

import XCTest
@testable import MoviesOMDB1
final class MovieListViewModelTests: XCTestCase {

    var movieListViewModel: MovieListViewModel!

        override func setUp() {
            super.setUp()
            movieListViewModel = MovieListViewModel()
        }

        override func tearDown() {
            movieListViewModel = nil
            super.tearDown()
        }

        func testFetchMovies() {
            // Ensure movieViewModel is initially empty
            XCTAssertEqual(movieListViewModel.numberOfRows, 0)
            // Fetch movies with a search term
            movieListViewModel.fetchMovies(searchTerm: "Avengers")
            movieListViewModel.onMoviesUpdated = { [weak self] in
   
                // After fetching, movieViewModel should be updated
                XCTAssertEqual(self?.movieListViewModel.numberOfRows, 10) // Assuming 10 movies were fetched
            }

    
        }
    }
