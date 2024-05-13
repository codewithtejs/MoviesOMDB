//
//  ViewController.swift
//  MoviesOMDB1
//
//  Created by Gurtej Singh on 2024-05-13.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var movieListViewModel = MovieListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        // Handle button tap
        print("Button tapped for movie: \(movieListViewModel.movieViewModel[sender.tag].title)")
    }
    
    func fetchMovies(searchTerm: String) {
        guard let movieUrl = Constants.Urls.urlForMovieSearch(key: searchTerm) else { return}
        let resource = Resource<SearchResult>(url: movieUrl)
        Webservice().load(resource: resource) { result in
            switch result{
            case .success(let result):
                self.movieListViewModel.movieViewModel = result.search.map(MovieViewModel.init)
                self.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as! MovieTableViewCell
        cell.setupCell(movieListViewModel.movieViewModel(at: indexPath.row))
        cell.btnAction.tag = indexPath.row
        cell.btnAction.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieListViewModel.numberOfRows
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return movieListViewModel.numberOfSection
    }
    
}
extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else { return }
        fetchMovies(searchTerm: searchTerm)
        searchBar.resignFirstResponder()
    }
}


