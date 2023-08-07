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
    ///viper
    var interactor: ListOfMoviesInteractorInputProtocol?
    weak private var view: ListOfMoviesViewProtocol?
    private let router: ListOfMoviesRouterProtocol
    
    ///others properties
    var viewModel: [MovieViewModel]?
    var models: [PopularMovieEntity]?
    
    init(interface: ListOfMoviesViewProtocol, interactor: ListOfMoviesInteractorInputProtocol, router: ListOfMoviesRouterProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}

extension ListOfMoviesPresenter: ListOfMoviesPresenterProtocol {
    
    func onViewAppear() {
        interactor?.getListOfMovies()
    }
    
    func onTapCell(atIndex: Int) {
        let movieId = models?[atIndex].id
        router.showDetailMovie(withMovieId: movieId!.description)
    }
}

extension ListOfMoviesPresenter: ListOfMoviesInteractorOutputProtocol {
    func setListOfMovies(data: [PopularMovieEntity]) {
        models = data
        if let models {
            interactor?.map(entity: models)
        }
    }
    
    func setListOfMovies(data: [MovieViewModel]) {
        viewModel = data
        view?.update(movies: viewModel!)
    }
}
