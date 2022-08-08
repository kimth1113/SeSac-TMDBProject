//
//  CastTableViewCell.swift
//  TMDBProject
//
//  Created by 김태현 on 2022/08/08.
//

import UIKit

import Kingfisher

class CastTableViewCell: UITableViewCell {

    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var originalNameLabel: UILabel!
    @IBOutlet weak var characterLabel: UILabel!
    
    func bindingCastData(profilePath: String, name: String, character: String) {
        
        let url = URL(string: EndPoint.getCastProfilePathURL + profilePath)
        profileImageView.kf.setImage(with: url)
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.layer.cornerRadius = 10
        profileImageView.backgroundColor = .systemGray4
        
        originalNameLabel.text = name
        originalNameLabel.font = .boldSystemFont(ofSize: 20)
        
        characterLabel.text = character
        characterLabel.font = .boldSystemFont(ofSize: 16)
        characterLabel.textColor = .darkGray
    }
}
