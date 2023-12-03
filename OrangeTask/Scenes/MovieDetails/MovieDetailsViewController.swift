//
//  MovieDetailsViewController.swift
//  OrangeTask
//
//  Created by Elkilany on 02/12/2023.
//

import UIKit

class MovieDetailsViewController: UIViewController,MovieDetailsViewProtocol {
    @IBOutlet weak var moviePhotoCollectionView: UICollectionView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieYear: UILabel!
    @IBOutlet weak var movieGenres: UILabel!
    @IBOutlet weak var movieCast: UILabel!
    
    var presenter: MovieDetailsPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Movie Details"
        self.presenter?.viewDidLoad()
        setupCollectionView()
     
        movieTitle.text = presenter?.movieTitle
        movieYear.text = presenter?.movieYear
        movieGenres.text = "Movie Genres :-  \(presenter?.movieGenres ?? "")"
        movieCast.text = "Movie Cast :-  \(presenter?.movieCast ?? "" )"
    }
    
    func showLoadingIndicator() {
        print("Show the LoadingIndicator")
    }
    
    func hideLoadingIndicator() {
        print("Hide the LoadingIndicator")
    }
    func reloadDate() {
        self.moviePhotoCollectionView.reloadData()
    }
    
    private func setupCollectionView(){
        moviePhotoCollectionView.delegate = self
        moviePhotoCollectionView.dataSource = self
        moviePhotoCollectionView.register(UINib(nibName: PhotosCollectionCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: PhotosCollectionCell.reuseIdentifier)
        
        if let flowLayout = moviePhotoCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .vertical
            flowLayout.minimumInteritemSpacing = 10
            flowLayout.minimumLineSpacing = 10
            let cellWidth = (moviePhotoCollectionView.frame.width - flowLayout.minimumInteritemSpacing - 30 ) / 2
            flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        }
    }
}


extension MovieDetailsViewController:UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  presenter?.numberOfCells ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionCell.reuseIdentifier, for: indexPath) as! PhotosCollectionCell
        presenter?.configure(cell: cell , indexPath: indexPath)
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
           let offsetY = scrollView.contentOffset.y
           let contentHeight = scrollView.contentSize.height
           let scrollViewHeight = scrollView.frame.size.height
           
           if offsetY > contentHeight - scrollViewHeight {
               presenter?.loadMorePhoto()
           }
       }
}
