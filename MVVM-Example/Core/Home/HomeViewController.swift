//
//  HomeViewController.swift
//  MVVM-Example
//
//  Created by Burak on 12.12.2022.
//

import UIKit

protocol HomeViewControllerProtocol:AnyObject {
    func configureVC()
    func configureCollectionView()
    func reloadCollectionView()
    func navigateToDetailScreen(movie: MovieResult)
    
}

final class HomeViewController: UIViewController {
    
    private let viewModel = HomeViewModel()
    
    private var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
        
    }
    
}

extension HomeViewController: HomeViewControllerProtocol {
    func navigateToDetailScreen(movie: MovieResult) {
        DispatchQueue.main.async {
            let detailScreen = DetailViewController(movie: movie)
            self.navigationController?.pushViewController(detailScreen, animated: true)
        }
    }
    
    func reloadCollectionView() {
        self.collectionView.reloadOnMainThread()
    }
    
     
    func configureVC() {
        view.backgroundColor = .red
        title = "Popular Movies"
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createHomeFlowLayout())
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.reuseID)
        
        ///  I wrote an extension
        collectionView.pinToEdgesOf(view: view)
        collectionView.backgroundColor = .black
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.reuseID, for: indexPath) as! MovieCell
        cell.setCell(movie: viewModel.movies[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.getDetail(id: viewModel.movies[indexPath.item].id ?? 1)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let ofsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.height
        
        if ofsetY >= contentHeight - (height*2) {
            viewModel.getMovies()
        }
    }
    
    
}
