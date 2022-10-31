//
//  ViewController.swift
//  StantMovieDb
//
//  Created by GDX on 27/10/22.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var movies: [Movie] = []
    let apiService = ApiService()
    var page = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(MovieCell.nib(), forCellWithReuseIdentifier: MovieCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        fetchMovies()
    }

    private func fetchMovies() {
        apiService.fetchMovies { [weak self] movies in
            self?.movies.append(contentsOf: movies)
            self?.collectionView.reloadData()
        } onError: { error in
            print(error.localizedDescription)
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.identifier, for: indexPath) as? MovieCell else {
            return UICollectionViewCell()
        }

        cell.configure(movie: movies[indexPath.row])
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movieDetailViewController = MovieDetailViewController()
        movieDetailViewController.movie = movies[indexPath.row]
        
        self.present(movieDetailViewController, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == movies.count-1 {
            apiService.fetchMovies(page: page) { [weak self] moviesResult in
                self?.movies.append(contentsOf: moviesResult)
                self?.collectionView.reloadData()
                self?.page += 1
            } onError: { error in
                print(error.localizedDescription)
            }
        }
    }
}
