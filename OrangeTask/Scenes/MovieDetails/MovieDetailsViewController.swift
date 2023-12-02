//
//  MovieDetailsViewController.swift
//  OrangeTask
//
//  Created by Elkilany on 02/12/2023.
//

import UIKit

class MovieDetailsViewController: UIViewController,MovieDetailsViewProtocol {
    var presenter: MovieDetailsPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.showSelectedMovie()
    }
}
