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
}
