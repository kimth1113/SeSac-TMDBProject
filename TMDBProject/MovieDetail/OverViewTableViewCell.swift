//
//  OverViewTableViewCell.swift
//  TMDBProject
//
//  Created by 김태현 on 2022/08/08.
//

import UIKit

class OverViewTableViewCell: UITableViewCell {

    
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var downImageView: UIImageView!
    
    
    func bindingOverviewData(overview: String) {
        overviewLabel.text = overview
        overviewLabel.numberOfLines = 2
        
        downImageView.image = UIImage(systemName: "chevron.down")
        downImageView.tintColor = .black
    }
    
    func clickedCell() {
        
        downImageView.isHidden = true
        overviewLabel.numberOfLines = 0
        
    }
    
    @IBAction func tappedCell(_ sender: UIButton) {
        clickedCell()
    }
    
}
