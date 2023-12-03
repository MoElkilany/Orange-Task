//
//  PhotosCollectionCell.swift
//  OrangeTask
//
//  Created by Elkilany on 03/12/2023.
//

import UIKit
import Kingfisher
class PhotosCollectionCell: UICollectionViewCell,PhotoCellView {
    
    
    @IBOutlet weak var photoMovieImage: UIImageView!
    static let reuseIdentifier = String(describing: PhotosCollectionCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func configure(entity: PhotosEntity) {
        let urlString = "https://farm\(entity.farm).static.flickr.com/\(entity.server)/\(entity.id)_\(entity.secret).jpg"
        let url = URL(string: urlString)
        photoMovieImage.kf.setImage(with: url)
    }
    
}
