//
//  ViewController.swift
//  StantMovieDb
//
//  Created by GDX on 27/10/22.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var movies: [Movie] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
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
                let myMovies = try decoder.decode(Movie.self, from: data)
                self.movies.append(myMovies)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell() // Not a serious return
        //if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as?
        // TO DO: kingfisher
    }
    
}

