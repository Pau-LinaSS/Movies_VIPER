//
//  ListOfMoviesProtocols.swift
//  Movies_VIPER
//
//  Created by Paulina Sanchez on 21/06/23.
//  
//

import Foundation

//View
protocol ListOfMoviesViewProtocol: AnyObject {
    var presenter: ListOfMoviesPresenterProtocol? {get set}
    
    func update(movies: [MovieViewModel])
}

//Interactor
protocol ListOfMoviesInteractorInputProtocol: AnyObject {
    //Presenter -> Interactor
    var presenter: ListOfMoviesInteractorOutputProtocol? {get set}
    
    func getListOfMovies()
    func getListOfMoviesMock() //this not need repeat
    func map(entity: [PopularMovieEntity])
}


protocol ListOfMoviesInteractorOutputProtocol: AnyObject {
    //Interactor->Presenter
    func setListOfMovies(data: [PopularMovieEntity])
    func setListOfMovies(data: [MovieViewModel])
}

//Presenter
protocol ListOfMoviesPresenterProtocol: AnyObject {
    var interactor: ListOfMoviesInteractorInputProtocol? {get set}
    
    var viewModel: [MovieViewModel]? {get set}
    var models: [PopularMovieEntity]? {get set}
    
    func onViewAppear()
    func onTapCell(atIndex: Int)
}

//Router
protocol ListOfMoviesRouterProtocol: AnyObject {
    func showDetailMovie(withMovieId movieId: String)
}
