//
//  MovieModel.swift
//  TMDBProject
//
//  Created by κΉνν on 2022/08/08.
//

import Foundation

struct Movie {
    let movieId: Int
    let releaseDate: String
    let genreList: [Int]
    let posterPath: String
    let rate: Double
    let title: String
    let overview: String
}
