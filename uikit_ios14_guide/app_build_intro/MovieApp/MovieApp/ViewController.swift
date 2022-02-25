//
//  ViewController.swift
//  MovieApp
//
//  Created by Chu Yu Min on 2022/02/13.
//

import UIKit

class ViewController: UIViewController {
    
    var movieModel: MovieModel?

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
    }

    private func setConstraints() {
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        requestMovieAPI()
    }
    
    //network
    func requestMovieAPI() {
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        var components = URLComponents(string: "https://itunes.apple.com/search")
        
        //parameters
        let term = URLQueryItem(name: "term", value: "marvel") //key와 value 넣기
        let media = URLQueryItem(name: "media", value: "movie")
        
        components?.queryItems = [term, media]
        
        guard let url = components?.url else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request) { data, response, error in
            print( (response as! HTTPURLResponse).statusCode )
            
            if let data = data {
                do {
                    self.movieModel = try JSONDecoder().decode(MovieModel.self, from: data)
                    print(self.movieModel ?? "no data")
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }catch {
                    print(error)
                }
            }
            
        }
        
        task.resume()
        session.finishTasksAndInvalidate()
        
    }
}

