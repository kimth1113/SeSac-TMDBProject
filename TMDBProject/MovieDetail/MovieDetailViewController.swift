//
//  MovieDetailViewController.swift
//  TMDBProject
//
//  Created by 김태현 on 2022/08/08.
//

import UIKit

class MovieDetailViewController: UIViewController {

    var creditList: [Actor] = []
    var movieData: Movie?
    
    @IBOutlet weak var detailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailTableView.tableHeaderView = designHeaderView()
        
        detailTableView.delegate = self
        detailTableView.dataSource = self
        
        detailTableView.register(UINib(nibName: OverViewTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: OverViewTableViewCell.reuseIdentifier)
        detailTableView.register(UINib(nibName: CastTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: CastTableViewCell.reuseIdentifier)
    }

    func designHeaderView() -> UIView {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width / 1.6))
        header.backgroundColor = .black
        
        let headerImageView = UIImageView(frame: header.bounds)
        
        let url = URL(string: EndPoint.getMovieImgURL + (movieData?.posterPath)!)
        headerImageView.kf.setImage(with: url)
        headerImageView.contentMode = .scaleAspectFill
        headerImageView.layer.masksToBounds = true
        
        header.addSubview(headerImageView)
        
        return header
    }
}

extension MovieDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : creditList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let overviewCell = detailTableView.dequeueReusableCell(withIdentifier: OverViewTableViewCell.reuseIdentifier) as? OverViewTableViewCell else { return UITableViewCell() }
        
        overviewCell.bindingOverviewData(overview: (movieData?.overview)!)
        
        guard let castCell = detailTableView.dequeueReusableCell(withIdentifier: CastTableViewCell.reuseIdentifier) as? CastTableViewCell else { return UITableViewCell() }
        
        castCell.bindingCastData(profilePath: creditList[indexPath.row].profileImageURL, name: creditList[indexPath.row].name, character: creditList[indexPath.row].character)
        
        
        
        return indexPath[0] == 0 ? overviewCell : castCell
    }
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Overview" : "Cast"
    }
    
}
