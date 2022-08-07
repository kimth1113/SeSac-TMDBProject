//
//  TMDBAPIManager.swift
//  TMDBProject
//
//  Created by 김태현 on 2022/08/08.
//

import Foundation

import Alamofire
import Kingfisher
import SwiftyJSON

class TMDBAPIManager {
    
    private init() { }
    
    static let shared = TMDBAPIManager()
    
    typealias completionHandler = (Int, [Movie]) -> Void
    
    func getMovieList(startPage: Int, completionHandler: @escaping completionHandler) {
        
        let url = EndPoint.getMovieListURL + "api_key=\(APIKey.TMDB_KEY)&language=ko-KR&page=\(startPage)"
        
        AF.request(url, method: .get).validate().responseJSON(queue: .global()) { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                
                let newMovieList = json["results"].arrayValue
                let list = newMovieList.map {
                    Movie(
                        releaseDate: $0["release_date"].stringValue,
                        genreList: $0["genre_ids"].rawValue as! [Int],
                        posterPath: $0["poster_path"].stringValue,
                        rate: $0["vote_average"].doubleValue,
                        title: $0["title"].stringValue,
                        overview: $0["overview"].stringValue
                    )
                }
                
                let totalCount = list.count
                
                completionHandler(totalCount, list)
            case .failure(let error):
                print(error)
            }
        }
    }
}
