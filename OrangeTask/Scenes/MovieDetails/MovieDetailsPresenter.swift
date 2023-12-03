//
//  MovieDetailsPresenter.swift
//  OrangeTask
//
//  Created by Elkilany on 02/12/2023.
//

import Foundation

class MovieDetailsPresenter: MovieDetailsPresenterProtocol , MovieDetailsInteractorOutputProtocol{
    
    weak var view: MovieDetailsViewProtocol?
    private let interactor: MovieDetailsInteractorInputProtocol?
    private let router: MovieDetailsRouterProtocol?
    
    var selectMovie:MovieItem?
    private var photosList = [Photo]()
    private var currentPage = 1
    internal var isFetching = false
    
    init(view: MovieDetailsViewProtocol? , interactor: MovieDetailsInteractorInputProtocol?, router: MovieDetailsRouterProtocol?) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        view?.showLoadingIndicator()
        interactor?.getPhotos(movieTitle: self.selectMovie?.title ?? "", page: 1)
    }
    
    func photosFetchedSuccessfully(photosModel: MoviePhotosModel) {
        view?.hideLoadingIndicator()
        self.photosList.append(contentsOf: photosModel.photos?.photo ?? [])
        view?.reloadDate()
    }
    
    func photosFetchedFailed(withError error: Error) {
        view?.hideLoadingIndicator()
    }
    
    var movieTitle: String {
        return self.selectMovie?.title ?? ""
    }
    
    var movieYear: String {
        return String(self.selectMovie?.year ?? 0)
    }
    
    var movieGenres: String {
        return self.selectMovie?.genres.joined(separator: "-") ?? ""
    }
    var movieCast: String {
        return self.selectMovie?.cast.joined(separator: "-") ?? ""
    }
    
    var numberOfCells: Int{
        return  self.photosList.count
    }
    
    func configure(cell: PhotoCellView, indexPath: IndexPath) {
        let photo = photosList[indexPath.row]
        let entity = PhotosEntity(photo: photo)
        cell.configure(entity: entity)
    }
    
    func loadMorePhoto() {
        guard !isFetching else {
            return
        }
        currentPage += 1
        interactor?.getPhotos(movieTitle: self.selectMovie?.title ?? "", page: currentPage)
    }
}
