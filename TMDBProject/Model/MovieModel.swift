//
//  MovieModel.swift
//  TMDBProject
//
//  Created by 김태현 on 2022/08/08.
//

import Foundation

struct Movie {
    let releaseDate: String
    let genreList: [Int]
    let posterPath: String
    let rate: Double
    let title: String
    let overview: String
}
