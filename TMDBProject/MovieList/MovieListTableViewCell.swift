//
//  MovieListTableViewCell.swift
//  TMDBProject
//
//  Created by 김태현 on 2022/08/08.
//

import UIKit

import Kingfisher

class MovieListTableViewCell: UITableViewCell {

    
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var clipImageView: UIImageView!
    @IBOutlet weak var rateWordLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    @IBOutlet weak var aboutLabel: UILabel!
    @IBOutlet weak var aboutImageView: UIImageView!
    
    
    func bindingMovieData(data: Movie) {
        releaseDateLabel.text = data.releaseDate
        // genreLabel.text
        
        let url = URL(string: EndPoint.getMovieImgURL + data.posterPath)
        posterImageView.kf.setImage(with: url)
        
        rateLabel.text = String(data.rate)
        
        titleLabel.text = data.title
        
        overviewLabel.text = data.overview
        
    }
}
