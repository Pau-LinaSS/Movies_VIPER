//
//  ListOfMoviesPresenter.swift
//  Movies_VIPER
//
//  Created by Paulina Sanchez on 21/06/23.
//  
//

import Foundation

class ListOfMoviesPresenter {
    //MARK: Properties
    var interactor: ListOfMoviesInteractorInputProtocol?
    weak private var view: ListOfMoviesViewProtocol?
    private let router: ListOfMoviesRouterProtocol
    
    
    init(interface: ListOfMoviesViewProtocol, interactor: ListOfMoviesInteractorInputProtocol, router: ListOfMoviesRouterProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}

extension ListOfMoviesPresenter: ListOfMoviesPresenterProtocol {
    
    func onViewAppear() {
        Task {
            let models = await interactor?.getListOfMovies()
            view?.update(movies: models!.results)
        }
    }
    
}

extension ListOfMoviesPresenter: ListOfMoviesInteractorOutputProtocol {
    
}
