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
    
    func update(movies: [PopularMovieEntity])
}

//Interactor
protocol ListOfMoviesInteractorInputProtocol: AnyObject {
    //Presenter -> Interactor
    var presenter: ListOfMoviesInteractorOutputProtocol? {get set}
    
    func getListOfMovies() async -> PopularMovieResponseEntity
}


protocol ListOfMoviesInteractorOutputProtocol: AnyObject {
    //Interactor->Presenter
}

//Presenter
protocol ListOfMoviesPresenterProtocol: AnyObject {
    var interactor: ListOfMoviesInteractorInputProtocol? {get set}
    
    func onViewAppear()
}

//Router
protocol ListOfMoviesRouterProtocol: AnyObject {
    
}
