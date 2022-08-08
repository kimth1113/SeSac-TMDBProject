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
        print(url)
        AF.request(url, method: .get).validate().responseJSON(queue: .global()) { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                
                let newMovieList = json["results"].arrayValue
                let list = newMovieList.map {
                    Movie(
                        movieId: $0["id"].intValue,
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
    
    
    func getGenreList(completionHandler: @escaping ([Int: String]) -> Void) {
        
        let url = EndPoint.getGenreListURL + "api_key=\(APIKey.TMDB_KEY)&language=ko-KR"
        
        AF.request(url, method: .get).validate().responseJSON(queue: .global()) { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                
                let genreList = json["genres"].arrayValue
                
                var genreDictionary: [Int: String] = [:]
                
                for genre in genreList {
                    genreDictionary[genre["id"].intValue] = genre["name"].stringValue
                    
                }
                
                completionHandler(genreDictionary)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    func getCreditList(movieId: Int, completionHandler: @escaping ([Actor]) -> Void) {
        
        let url = EndPoint.getCreditListURL + String(movieId) + "/credits?api_key=" + APIKey.TMDB_KEY + "&language=ko-KR"
        
        print(url)
        AF.request(url, method: .get).validate().responseJSON(queue: .global()) { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                
                let creditList = json["cast"].arrayValue
                let list: [Actor] = creditList.map { Actor(name: $0["name"].stringValue, profileImageURL: $0["profile_path"].stringValue, character: $0["character"].stringValue) }
                print(list)
                completionHandler(list)
            case .failure(let error):
                print(error)
            }
        }
    }
}
