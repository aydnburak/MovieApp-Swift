//
//  MovieCell.swift
//  MVVM-Example
//
//  Created by Burak on 14.12.2022.
//

import UIKit

final class MovieCell: UICollectionViewCell {
    
    static let reuseID = "MovieCell"
    
    private var posterImageView : PosterImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
        configurePosterView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        posterImageView.image = nil
        posterImageView.cancelDownloading()
        
    }
    
    func setCell(movie: MovieResult){
        posterImageView.downloadImage(movie: movie)
    }
    
    
    private func configureCell(){
        backgroundColor = .systemGray5
        layer.cornerRadius = 16
        /// Alt viewların fazlalık kısmını kes at
        clipsToBounds = true
    }
    
    private func configurePosterView(){
        posterImageView = PosterImageView(frame: .zero)
        addSubview(posterImageView)
        posterImageView.pinToEdgesOf(view: self)
        posterImageView.backgroundColor = .red
    }
}
