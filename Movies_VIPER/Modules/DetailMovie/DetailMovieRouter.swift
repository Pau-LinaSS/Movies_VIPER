//
//  DetailMovieRouter.swift
//  Movies_VIPER
//
//  Created by Paulina Sanchez on 18/07/23.
//  
//

import Foundation
import UIKit

class DetailMovieRouter {
    weak var viewController: UIViewController?

    static func createModule(withMovieId movieId: String)->UIViewController{

        let view = DetailMovieViewController(nibName: "DetailMovieViewController", bundle: nil)

        let interactor = DetailMovieInteractor()
        let router = DetailMovieRouter()
        
        let presenter = DetailMoviePresenter(interface: view, interactor: interactor, router: router)
        
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        presenter.movieId = movieId
        
        return view
    }
    
}

extension DetailMovieRouter: DetailMovieRouterProtocol {
    
}
    
    
    

