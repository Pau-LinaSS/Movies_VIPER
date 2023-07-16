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
    
    func update(movies: [ViewModel])
}

//Interactor
protocol ListOfMoviesInteractorInputProtocol: AnyObject {
    //Presenter -> Interactor
    var presenter: ListOfMoviesInteractorOutputProtocol? {get set}
    
    func getListOfMovies() async -> PopularMovieResponseEntity
    func getListOfMoviesMock() async -> PopularMovieResponseEntity //this not need repeat
    func map(entity: PopularMovieEntity) -> ViewModel
}


protocol ListOfMoviesInteractorOutputProtocol: AnyObject {
    //Interactor->Presenter
    
}

//Presenter
protocol ListOfMoviesPresenterProtocol: AnyObject {
    var interactor: ListOfMoviesInteractorInputProtocol? {get set}
    
    var viewModel: [ViewModel]? {get set}
    
    func onViewAppear()
}

//Router
protocol ListOfMoviesRouterProtocol: AnyObject {
    
}
