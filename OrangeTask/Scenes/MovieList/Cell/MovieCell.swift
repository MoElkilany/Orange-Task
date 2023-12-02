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
        setupContainerView(containerView: containerView)
    }
    
    func configure(entity: MovieEntity) {
        movieTitle.text = entity.title
        movieYear.text = "Year \(entity.year)"
        movieRate.text = "Rate \(entity.rating)"
    }

    
    private func setupContainerView(containerView:UIView){
        containerView.layer.cornerRadius = 10
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.2
        containerView.layer.shadowOffset = CGSize(width: 0, height: 1)
        containerView.layer.shadowRadius = 2
    }
    
}
