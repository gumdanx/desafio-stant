//
//  MovieCell.swift
//  StantMovieDb
//
//  Created by GDX on 31/10/22.
//

import UIKit
import Kingfisher

class MovieCell: UICollectionViewCell {
    
    private let imageBaseURL = "https://image.tmdb.org/t/p/w500"
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var releaseAtLabel: UILabel!
    
    static let identifier = "MovieCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(movie: Movie) {
        title.text = movie.title ?? ""
        genreLabel.text =  "ids = "
        releaseAtLabel.text = movie.releaseDate ?? ""
        
        let imageLink = movie.backdropPath ?? ""
        
        if let url = URL(string: imageBaseURL + imageLink) {
            movieImage.kf.setImage(with: url)
        }
    }
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
