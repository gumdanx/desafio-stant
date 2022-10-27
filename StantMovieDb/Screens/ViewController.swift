//
//  ViewController.swift
//  StantMovieDb
//
//  Created by GDX on 27/10/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        didRequestMovies()
    }

    func didRequestMovies() {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.themoviedb.org"
        components.path = "/4/list/1"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: "f321a808e68611f41312aa8408531476"),
        ]
        guard let url = components.url else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            if let existentError = error {
                // trata erro
                print(existentError)
            }
            
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            do {
                let movies = try decoder.decode(Movie.self, from: data)
                print(movies)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}

