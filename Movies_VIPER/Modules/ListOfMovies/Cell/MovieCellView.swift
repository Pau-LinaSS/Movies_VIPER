//
//  MovieCellView.swift
//  Movies_VIPER
//
//  Created by Paulina Sanchez on 11/07/23.
//

import UIKit
import Kingfisher

class MovieCellView: UITableViewCell {

    @IBOutlet weak var imgPhotoCover: UIImageView!
    @IBOutlet weak var lblNameMovie: UILabel!
    @IBOutlet weak var llbDescriptionMovie: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(model: MovieViewModel) {
        imgPhotoCover.kf.setImage(with: model.imageURL)
        lblNameMovie.text = model.title
        llbDescriptionMovie.text = model.overview
    }
}
