//
//  ViewControllerExtensions.swift
//  MovieApp
//
//  Created by Chu Yu Min on 2022/02/13.
//

import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieModel?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as! MovieTableViewCell
        let currency = self.movieModel?.results?[indexPath.row].currency ?? ""
        let price = self.movieModel?.results?[indexPath.row].trackPrice ?? 0
        
        cell.titleLabel.text = self.movieModel?.results?[indexPath.row].trackName
        cell.descriptionLabel.text = self.movieModel?.results?[indexPath.row].shortDescription
        cell.priceLabel.text = "\(currency) \(price)"
        
        return cell
    }
    
}

extension ViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
}
