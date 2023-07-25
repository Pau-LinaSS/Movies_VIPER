//
//  DetailMovieViewController.swift
//  Movies_VIPER
//
//  Created by Paulina Sanchez on 18/07/23.
//  
//

import UIKit
import Kingfisher

class DetailMovieViewController: UIViewController {
    var presenter: DetailMoviePresenterProtocol?
    
    @IBOutlet weak var imgPhoto: UIImageView!
    @IBOutlet weak var lblNameMovie: UILabel!
    @IBOutlet weak var llbDescriptionMovie: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.onViewAppear()
    }
}

extension DetailMovieViewController: DetailMovieViewProtocol {
    func update(detailMovie: DetailMovieViewModel) {
        lblNameMovie.text = detailMovie.title
        llbDescriptionMovie.text = detailMovie.overview
        imgPhoto.kf.setImage(with: detailMovie.backdropPath)
    }
}

