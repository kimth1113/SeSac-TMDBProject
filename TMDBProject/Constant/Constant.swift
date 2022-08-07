//
//  APIKey.swift
//  TMDBProject
//
//  Created by 김태현 on 2022/08/08.
//

import Foundation

class APIKey {
    
    static let TMDB_KEY = "149448f6e724f29673f8ce8767dd1425"
    static let TMDB_TOKEN =  "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxNDk0NDhmNmU3MjRmMjk2NzNmOGNlODc2N2RkMTQyNSIsInN1YiI6IjYwMTM4ZTAwOTlkNWMzMDA0MDVhZThhNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.7N1zr0qCIrKGBB-izDZjmdBR77lPDT5f4MEjuguVwz4"
}


class EndPoint {
    
    static let getMovieListURL = "https://api.themoviedb.org/3/movie/popular?"
    static let getMovieImgURL = "https://image.tmdb.org/t/p/w500/"
}
