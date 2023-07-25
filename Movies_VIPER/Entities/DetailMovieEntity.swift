//
//  DetailMovieEntity.swift
//  Movies_VIPER
//
//  Created by Paulina Sanchez on 18/07/23.
//

import Foundation

struct DetailMovieEntity: Decodable {
    let title: String
    let overview: String
    let backdropPath: String
    let status: String
    let releaseDate: String
    let voteAverage: Double
    let voteCount: Int
}
