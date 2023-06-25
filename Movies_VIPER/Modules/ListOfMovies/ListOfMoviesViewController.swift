//
//  ListOfMoviesViewController.swift
//  Movies_VIPER
//
//  Created by Paulina Sanchez on 21/06/23.
//  
//

import UIKit

class ListOfMoviesViewController: UIViewController {
    var presenter: ListOfMoviesPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.onViewAppear()
    }
}

extension ListOfMoviesViewController: ListOfMoviesViewProtocol {
    
    func update(movies: [PopularMovieEntity]) {
        
    }
    
}

