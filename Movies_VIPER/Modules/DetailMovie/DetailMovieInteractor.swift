//
//  DetailMovieInteractor.swift
//  Movies_VIPER
//
//  Created by Paulina Sanchez on 18/07/23.
//  
//

import Foundation

class DetailMovieInteractor: DetailMovieInteractorInputProtocol {
    weak var presenter: DetailMovieInteractorOutputProtocol?
    
    func getDetailMovie(withId id: String) async -> DetailMovieEntity {
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)?api_key=7d681f214b74dd3d5038832ab57ded6b")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return try! jsonDecoder.decode(DetailMovieEntity.self, from: data)
    }
    
    
    func map(entity: DetailMovieEntity) -> DetailMovieViewModel {
        .init(title: entity.title, overview: entity.overview, backdropPath: URL(string: "https://image.tmdb.org/t/p/w200" + entity.backdropPath))
    }
}
