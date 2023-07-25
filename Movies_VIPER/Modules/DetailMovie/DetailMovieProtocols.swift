//
//  DetailMovieProtocols.swift
//  Movies_VIPER
//
//  Created by Paulina Sanchez on 18/07/23.
//  
//

import Foundation

//View
protocol DetailMovieViewProtocol: AnyObject {
    var presenter: DetailMoviePresenterProtocol? {get set}
    
    func update(detailMovie: DetailMovieViewModel)
}

//Interactor
protocol DetailMovieInteractorInputProtocol: AnyObject {
    //Presenter -> Interactor
    var presenter: DetailMovieInteractorOutputProtocol? {get set}
    
    func getDetailMovie(withId id: String) async -> DetailMovieEntity
    func map(entity: DetailMovieEntity) -> DetailMovieViewModel
}


protocol DetailMovieInteractorOutputProtocol: AnyObject {
    //Interactor->Presenter
}

//Presenter
protocol DetailMoviePresenterProtocol: AnyObject {
    var interactor: DetailMovieInteractorInputProtocol? {get set}
    
    var movieId: String? {get set}
    
    func onViewAppear()
}

//Router
protocol DetailMovieRouterProtocol: AnyObject {
    
}
