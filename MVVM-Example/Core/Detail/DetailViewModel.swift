//
//  DetailViewModel.swift
//  MVVM-Example
//
//  Created by Burak on 17.12.2022.
//

import Foundation

protocol DetailViewModelProtocol {
    var view: DetailViewControllerProtocol? {get set}
    func viewDidLoad()
}

final class DetailViewModel {
    weak var view: DetailViewControllerProtocol?
}

extension DetailViewModel:DetailViewModelProtocol {
    func viewDidLoad(){
        view?.configureVC()
        view?.configurePosterImageView()
        view?.downloadPosterImage()
        view?.configureTitleLabel()
        view?.configureDateLabel()
        view?.configureOverviewLabel()
    }
}

