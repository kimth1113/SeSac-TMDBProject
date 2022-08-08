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
    
    @IBOutlet weak var underLineView: UIView!
    
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var mainView: UIView!
    
    func bindingMovieData(data: Movie, genreList: [String]) {
        releaseDateLabel.text = data.releaseDate.replacingOccurrences(of: "-", with: "/")
        releaseDateLabel.font = .boldSystemFont(ofSize: 16)
        releaseDateLabel.textColor = .systemGray
        
        
        var genreTitle = ""
        for genre in genreList {
            genreTitle.append("#\(genre) ")
        }
        genreLabel.text = genreTitle
        genreLabel.font = .boldSystemFont(ofSize: 20)
        
        let url = URL(string: EndPoint.getMovieImgURL + data.posterPath)
        posterImageView.kf.setImage(with: url)
        posterImageView.contentMode = .scaleAspectFill
        
        clipImageView.image = UIImage(systemName: "paperclip.circle.fill")
        clipImageView.tintColor = .white
        
        rateWordLabel.text = "평점"
        rateWordLabel.font = .boldSystemFont(ofSize: 16)
        rateWordLabel.textColor = .white
        rateWordLabel.backgroundColor = .systemBlue
        rateLabel.text = String(data.rate)
        rateLabel.font = .systemFont(ofSize: 16)
        rateLabel.backgroundColor = .white
        
        titleLabel.text = data.title
        titleLabel.font = .boldSystemFont(ofSize: 20)
        
        overviewLabel.text = data.overview
        overviewLabel.textColor = .darkGray
        overviewLabel.font = .systemFont(ofSize: 14)
        
        aboutLabel.text = "자세히 보기"
        aboutLabel.font = .boldSystemFont(ofSize: 14)
        aboutLabel.textColor = .darkGray
        
        aboutImageView.image = UIImage(systemName: "chevron.forward")
        aboutImageView.tintColor = .darkGray
        
        design()
    }
    
    func design() {
        let onlyBottomLineView = UIView(frame: CGRect(x: -4, y: underLineView.frame.height - 8, width: underLineView.bounds.width - 20, height: 0.4))
        onlyBottomLineView.backgroundColor = .black

        underLineView.addSubview(onlyBottomLineView)
        underLineView.backgroundColor = .clear
        
        shadowView.layer.shadowColor = UIColor.black.cgColor // 검정색 사용
        shadowView.layer.masksToBounds = false
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 0) // 반경에 대해서 너무 적용이 되어서 4point 정도 ㅐ림.
        shadowView.layer.shadowRadius = 5 // 반경?
        shadowView.layer.shadowOpacity = 0.8 // alpha값입니다.
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.cornerRadius = 10
//        shadowView.backgroundColor = .clear

        mainView.layer.masksToBounds = true
        mainView.layer.cornerRadius = 10
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 16.0, left: 8, bottom: 16, right: 8))
    }
}
