//
//  MovieListViewController.swift
//  TMDBProject
//
//  Created by 김태현 on 2022/08/08.
//

import UIKit

class MovieListViewController: UIViewController {

    var genreList: [Int: String] = [:]
    
    var movieList: [Movie] = []
    var startPage = 1
    var totalCount = 0
    
    @IBOutlet weak var movieListTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        designNavigationBar()
        movieListTableView.separatorStyle = .none
        
        movieListTableView.delegate = self
        movieListTableView.dataSource = self
        
        movieListTableView.register(UINib(nibName: MovieListTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: MovieListTableViewCell.reuseIdentifier)
        
        DispatchQueue.main.async {
            self.requestGenreList()
            self.requestMovieList()
        }
    }

    
    func requestMovieList() {
        
        TMDBAPIManager.shared.getMovieList(startPage: startPage) { totalCount, list in
            
            self.totalCount = totalCount
            self.movieList.append(contentsOf: list)
            
            DispatchQueue.main.async {
                
                self.movieListTableView.reloadData()
            }
        }
    }
    
    func requestGenreList() {
        TMDBAPIManager.shared.getGenreList { genreDictionary in
            
            self.genreList = genreDictionary
        }
    }
}


extension MovieListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = movieListTableView.dequeueReusableCell(withIdentifier: MovieListTableViewCell.reuseIdentifier) as? MovieListTableViewCell else { return UITableViewCell() }
        
        let data = movieList[indexPath.row]
        
        let genreList: [String] = data.genreList.map { self.genreList[$0] ?? "알수없음" }
        
        cell.bindingMovieData(data: data, genreList: genreList)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: MovieDetailViewController.reuseIdentifier) as? MovieDetailViewController else {
            return
        }
        
        vc.movieData = movieList[indexPath.row]
        
        
        TMDBAPIManager.shared.getCreditList(movieId: self.movieList[indexPath.row].movieId) { list in
            vc.creditList = list
            
            DispatchQueue.main.async {
                
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
        
        

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = view.bounds.width * 1.1
        
        return height
    }
    
}


extension MovieListViewController {
    
    func designNavigationBar() {
        
        let navibarAppearance = UINavigationBarAppearance()
        navibarAppearance.backgroundColor = .white
        navigationItem.scrollEdgeAppearance = navibarAppearance
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.dash"), style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: nil)
        
    }
}
