//
//  MovieCell.swift
//  OrangeTask
//
//  Created by Elkilany on 02/12/2023.
//

import UIKit

class MovieCell: UITableViewCell,MovieCellView {
 

    static let reuseIdentifier = String(describing: MovieCell.self)
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieYear: UILabel!
    @IBOutlet weak var movieRate: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 15
    }
    
    func configure(entity: MovieEntity) {
        movieTitle.text = entity.title
        movieYear.text = String(entity.year)
        movieRate.text = String(entity.rating)
    }

}
