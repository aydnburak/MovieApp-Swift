//
//  HomeViewModel.swift
//  MVVM-Example
//
//  Created by Burak on 12.12.2022.
//

import UIKit

protocol HomeViewModelProtocol {
    
    var view: HomeViewControllerProtocol? {get set}
    
    func viewDidLoad()
    func getMovies()
    func getDetail(id:Int)
    
}

final class HomeViewModel {
    weak var view: HomeViewControllerProtocol?
    private let service = MovieService()
    var movies: [MovieResult] = []
    private var page:Int = 1
}

extension HomeViewModel: HomeViewModelProtocol {
    
    func viewDidLoad() {
        view?.configureVC()
        view?.configureCollectionView()
        getMovies()
    }
    
    func getMovies() {
        service.downloadMovies(page:page ) { [weak self] returnedMovies in
            guard let self = self else { return }
            guard let returnedMovies = returnedMovies else { return }
            self.movies.append(contentsOf: returnedMovies)
            self.page += 1
            self.view?.reloadCollectionView()
            
            
        }
    }
    
    func getDetail(id:Int){
        service.downloadDetail(id: id) { [weak self] returnedDetail in
            guard let self = self else { return }
            guard let returnedDetail = returnedDetail else { return }
            self.view?.navigateToDetailScreen(movie: returnedDetail)
            
        }
    }
}
