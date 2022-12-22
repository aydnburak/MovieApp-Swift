//
//  DetailViewController.swift
//  MVVM-Example
//
//  Created by Burak on 17.12.2022.
//

import UIKit

protocol DetailViewControllerProtocol:AnyObject {
    
    func configureVC()
    func configurePosterImageView()
    func downloadPosterImage()
    func configureTitleLabel()
    func configureDateLabel()
    func configureOverviewLabel()
    
}

final class DetailViewController: UIViewController {

    private let movie: MovieResult
    private let viewModel = DetailViewModel()
    private var posterImageView: PosterImageView!
    private var titleLabel: UILabel!
    private var dateLabel: UILabel!
    private var overviewLabel: UILabel!
    
    init(movie: MovieResult) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
    }
}

extension DetailViewController:DetailViewControllerProtocol {
    func configureVC(){
        view.backgroundColor = .systemBrown
    }
    
    func configurePosterImageView(){
        posterImageView = PosterImageView.init(frame: .zero)
        view.addSubview(posterImageView)
        let posterWidth = CGFloat.dWidth * 0.4
        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            posterImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            posterImageView.widthAnchor.constraint(equalToConstant: posterWidth),
            posterImageView.heightAnchor.constraint(equalToConstant: posterWidth*1.5)
        ])
        posterImageView.layer.cornerRadius = 16
        posterImageView.clipsToBounds = true
        posterImageView.backgroundColor = .red
    }
    
    func downloadPosterImage(){
        posterImageView.downloadImage(movie: movie)
    }
    func configureTitleLabel(){
        titleLabel = UILabel(frame: .zero)
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = movie.title ?? ""
        titleLabel.font = .boldSystemFont(ofSize: 24)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: posterImageView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor,constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    func configureDateLabel(){
        dateLabel = UILabel(frame: .zero)
        view.addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.text = movie.releaseDate ?? ""
        dateLabel.font = .systemFont(ofSize: 18)
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 16),
            dateLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor,constant: 16),
            dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    func configureOverviewLabel(){
        overviewLabel = UILabel(frame: .zero)
        view.addSubview(overviewLabel)
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        overviewLabel.text = movie.overview ?? ""
        overviewLabel.font = .systemFont(ofSize: 18)
        overviewLabel.numberOfLines = 0
        NSLayoutConstraint.activate([
            overviewLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor,constant: 16),
            overviewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            overviewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
}
