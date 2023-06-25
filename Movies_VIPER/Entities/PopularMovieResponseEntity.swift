//
//  PopularMovieResponseEntity.swift
//  Movies_VIPER
//
//  Created by Paulina Sanchez on 25/06/23.
//

import Foundation

struct PopularMovieResponseEntity: Decodable {
    let results: [PopularMovieEntity]
}
