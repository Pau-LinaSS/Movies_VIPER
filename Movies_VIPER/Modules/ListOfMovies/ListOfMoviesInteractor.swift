//
//  ListOfMoviesInteractor.swift
//  Movies_VIPER
//
//  Created by Paulina Sanchez on 21/06/23.
//  
//

import Foundation

class ListOfMoviesInteractor: ListOfMoviesInteractorInputProtocol {
    weak var presenter: ListOfMoviesInteractorOutputProtocol?
    
    
    func getListOfMovies() async -> PopularMovieResponseEntity {
        let url = URL(string: "https//api.themoviedb.org/3/movie/popular?api_key=7d681f214b74dd3d5038832ab57ded6b")!
        
        let (data, _) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(PopularMovieResponseEntity.self, from: data)
    }
    
    func map(entity: PopularMovieEntity) -> MovieViewModel {
        MovieViewModel(title: entity.title,
                  overview: entity.overview,
                  imageURL: URL(string: "https://image.tmdb.org/t/p/w200\(entity.imageURL)"))
    }
    
    
    func getListOfMoviesMock() async -> PopularMovieResponseEntity {
        return PopularMovieResponseEntity(results: [
            .init(id: 0, title: "Name Movie", overview: "Aprende Swift", imageURL: "", votes: 10),
            .init(id: 1, title: "Name Movie", overview: "Aprende Swift", imageURL: "", votes: 10),
            .init(id: 2, title: "Name Movie", overview: "Aprende Swift", imageURL: "", votes: 10),
            .init(id: 3, title: "Name Movie", overview: "Aprende Swift", imageURL: "", votes: 10),
            .init(id: 4, title: "Name Movie", overview: "Aprende Swift", imageURL: "", votes: 10),
            .init(id: 5, title: "Name Movie", overview: "Aprende Swift", imageURL: "", votes: 10),
        ])
    }
}
