//
//  MovieDetailViewController.swift
//  StantMovieDb
//
//  Created by GDX on 31/10/22.
//

import UIKit
import Kingfisher

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var backdropImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var releaseAtLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    var movie: Movie?
    private let imageBaseURL = "https://image.tmdb.org/t/p/w500"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let exitentMovie = movie {
            print("daaale")
            // Configura as outlet (titleLabel.text = movie.title)
            titleLabel.text = movie?.title
            languageLabel.text = "lang = "
            genreLabel.text = "id = "
            releaseAtLabel.text = movie?.releaseDate
            overviewLabel.text = movie?.overview
            
            let imageLink = movie?.posterPath ?? ""
            if let url = URL(string: imageBaseURL + imageLink) {
                backdropImage.kf.setImage(with: url)
            }        }
    }

}
