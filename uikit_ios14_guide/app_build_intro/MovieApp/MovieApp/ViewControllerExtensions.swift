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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as! MovieTableViewCell
        cell.selectionStyle = .none
        let currency = self.movieModel?.results?[indexPath.row].currency ?? ""
        let price = self.movieModel?.results?[indexPath.row].trackPrice ?? 0
        
        cell.titleLabel.text = self.movieModel?.results?[indexPath.row].trackName
        cell.descriptionLabel.text = self.movieModel?.results?[indexPath.row].shortDescription
        cell.priceLabel.text = "\(currency) \(price)"
        
        if let hasUrl =  self.movieModel?.results?[indexPath.row].image {
            self.loadImage(urlString: hasUrl) { image in
                
                DispatchQueue.main.async {
                    cell.movieImageView.image = image
                }
            }
        }
        
        if let dateString = self.movieModel?.results?[indexPath.row].releaseDate {
            
            let formatter = ISO8601DateFormatter() //data 표준 규격
            if let isDate = formatter.date(from: dateString) {
                let myformatter = DateFormatter()
                myformatter.dateFormat = "yyyy-MM-dd"
               let dateString = myformatter.string(from: isDate)
                
                cell.dateLabel.text = dateString
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "DetailViewController", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
//        tableView.deselectRow(at: indexPath, animated: true) //자연스러운 선택 효과
        vc.movieResult = self.movieModel?.results?[indexPath.row]
        self.present(vc, animated: true, completion: nil)
    }
    
}

extension ViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
}
