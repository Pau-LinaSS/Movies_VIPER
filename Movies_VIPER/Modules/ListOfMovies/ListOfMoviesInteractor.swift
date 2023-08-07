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
    
    
    func getListOfMovies() {
        let url = URL(string: "https//api.themoviedb.org/3/movie/popular?api_key=7d681f214b74dd3d5038832ab57ded6b")!
        
        Task {
            let (data, _) = try! await URLSession.shared.data(from: url)
            let movies = try! JSONDecoder().decode(PopularMovieResponseEntity.self, from: data)
            presenter?.setListOfMovies(data: movies.results)
        }
    }
    
    func map(entity: [PopularMovieEntity]) {
        let listOfMovies = entity.map { popularMovie in
            MovieViewModel(title: popularMovie.title,
                      overview: popularMovie.overview,
                      imageURL: URL(string: "https://image.tmdb.org/t/p/w200\(popularMovie.imageURL)"))
        }
        
        presenter?.setListOfMovies(data: listOfMovies)
    }
    
    func getListOfMoviesMock() {
        let listOfMovies = PopularMovieResponseEntity(results: [
            .init(id: 0, title: "Name Movie", overview: "Aprende Swift", imageURL: "", votes: 10),
            .init(id: 1, title: "Name Movie", overview: "Aprende Swift", imageURL: "", votes: 10),
            .init(id: 2, title: "Name Movie", overview: "Aprende Swift", imageURL: "", votes: 10),
            .init(id: 3, title: "Name Movie", overview: "Aprende Swift", imageURL: "", votes: 10),
            .init(id: 4, title: "Name Movie", overview: "Aprende Swift", imageURL: "", votes: 10),
            .init(id: 5, title: "Name Movie", overview: "Aprende Swift", imageURL: "", votes: 10),
        ])
        
        presenter?.setListOfMovies(data: listOfMovies.results)
    }
}
