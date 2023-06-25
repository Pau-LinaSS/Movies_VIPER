//
//  ListOfMoviesRouter.swift
//  Movies_VIPER
//
//  Created by Paulina Sanchez on 21/06/23.
//  
//

import UIKit

class ListOfMoviesRouter {
    weak var viewController: UIViewController?

    static func createModule()->UIViewController {

        let view = ListOfMoviesViewController(nibName: "ListOfMoviesViewController", bundle: nil)

        let interactor = ListOfMoviesInteractor()
        let router = ListOfMoviesRouter()
        
        let presenter = ListOfMoviesPresenter(interface: view, interactor: interactor, router: router)
        
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
    
}

extension ListOfMoviesRouter: ListOfMoviesRouterProtocol {
    
}
    
    
    

