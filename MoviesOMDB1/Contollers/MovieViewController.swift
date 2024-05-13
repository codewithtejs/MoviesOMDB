//
//  MovieViewController.swift
//  MoviesOMDB1
//
//  Created by Gurtej Singh on 2024-05-13.
//

import UIKit

class MovieViewController: UIViewController{
    
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: - Properties
    var movieListViewModel = MovieListViewModel()
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        setupViewModel()
    }
    
    // MARK: - Private Methods
    private func setDelegates() {
        movieListViewModel.delegate = self
        // Setup UI elements
    }
    
    private func setupViewModel() {
        // Setup movieListViewModel
        movieListViewModel.onMoviesUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension MovieViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as! MovieTableViewCell
        cell.setupCell(movieListViewModel.movieViewModel(at: indexPath.row))
        cell.cellDelegate = self
        cell.btnAction.tag = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieListViewModel.numberOfRows
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return movieListViewModel.numberOfSection
    }
    
}

// MARK: - UISearchBarDelegate
extension MovieViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else { return }
        movieListViewModel.fetchMovies(searchTerm: searchTerm)
        searchBar.resignFirstResponder()
    }
    
}

// MARK: - MovieCellDelegate
extension MovieViewController: MovieCellDelegate {
    
    func didPressButton(_ tag: Int) {
        print("Button tapped on movie: \(movieListViewModel.movieViewModel[tag].title)")
    }
    
}
// MARK: - MovieCellDelegate
extension MovieViewController: MovieListViewModelDelegate {
    
    func showError(_ message: String) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "Error!", message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }
    }
}

