//
//  DetailMoviePresenter.swift
//  Movies_VIPER
//
//  Created by Paulina Sanchez on 18/07/23.
//  
//

import Foundation

class DetailMoviePresenter {
    //MARK: Properties
    var interactor: DetailMovieInteractorInputProtocol?
    weak private var view: DetailMovieViewProtocol?
    private let router: DetailMovieRouterProtocol
    
    var movieId: String?
    
    init(interface: DetailMovieViewProtocol, interactor: DetailMovieInteractorInputProtocol, router: DetailMovieRouterProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}

extension DetailMoviePresenter: DetailMoviePresenterProtocol {
    func onViewAppear() {
        Task {
            let model = await interactor?.getDetailMovie(withId: movieId!)
            let viewModel = interactor?.map(entity: model!)
            await MainActor.run {
                view?.update(detailMovie: viewModel!)
            }
        }
    }
}

extension DetailMoviePresenter: DetailMovieInteractorOutputProtocol {
    
}
