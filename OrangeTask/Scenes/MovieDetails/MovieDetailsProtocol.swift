//
//  MovieDetailsProtocol.swift
//  OrangeTask
//
//  Created by Elkilany on 02/12/2023.
//

import Foundation

protocol MovieDetailsViewProtocol: AnyObject {
    var presenter: MovieDetailsPresenterProtocol? {get set}
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func reloadDate()
}

protocol MovieDetailsPresenterProtocol: AnyObject {
    var view: MovieDetailsViewProtocol? {get set}
    func viewDidLoad()
    var movieTitle: String {get}
    var movieYear: String {get}
    var movieGenres: String {get}
    var movieCast: String {get}
    var numberOfCells: Int {get}
    func configure(cell: PhotoCellView, indexPath: IndexPath)
    func loadMorePhoto()

}

protocol MovieDetailsRouterProtocol {}

protocol MovieDetailsInteractorInputProtocol {
    var presenter: MovieDetailsInteractorOutputProtocol? { get set }
    func getPhotos(movieTitle: String, page: Int)
}

protocol MovieDetailsInteractorOutputProtocol: AnyObject {
    func photosFetchedSuccessfully(photosModel: MoviePhotosModel)
    func photosFetchedFailed(withError error: Error)
    var isFetching: Bool {get set}
}


protocol PhotoCellView {
    func configure(entity:PhotosEntity)
}
