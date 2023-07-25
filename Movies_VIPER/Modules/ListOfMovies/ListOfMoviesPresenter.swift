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
        Task {
            models = await interactor!.getListOfMovies().results
            viewModel = models?.map(interactor!.map(entity:))
            view?.update(movies: viewModel!)
        }
    }
    
    func onTapCell(atIndex: Int) {
        let movieId = models?[atIndex].id
        router.showDetailMovie(withMovieId: movieId!.description)
    }
}

extension ListOfMoviesPresenter: ListOfMoviesInteractorOutputProtocol {
    
}
