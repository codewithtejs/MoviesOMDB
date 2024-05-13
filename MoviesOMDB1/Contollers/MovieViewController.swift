//
//  MovieViewController.swift
//  MoviesOMDB1
//
//  Created by Gurtej Singh on 2024-05-13.
//

import UIKit

class MovieViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var movieListViewModel = MovieListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.movieListViewModel.onMoviesUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}
extension MovieViewController: UITableViewDataSource, UITableViewDelegate{
    
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
extension MovieViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else { return }
        movieListViewModel.fetchMovies(searchTerm: searchTerm)
        searchBar.resignFirstResponder()
    }
}
extension MovieViewController : MovieCellDelegate{
    func didPressButton(_ tag: Int) {
        print("Button tapped on movie: \(movieListViewModel.movieViewModel[tag].title)")
    }
}


