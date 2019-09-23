//
//  MovieTableViewCell.swift
//  PixelTMDb
//
//  Created by Lucas Henrique Machado Da Silva on 18/09/19.
//  Copyright © 2019 Lucas Henrique Machado da Silva. All rights reserved.
//

import Kingfisher
import UIKit

class MovieTableViewCell: UITableViewCell {
    // MARK: - UI Setup
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = R.color.mainTextColor()
        imageView.layer.cornerRadius = CGFloat(5)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let informationView: UIView = {
        let view = UIView()
        view.backgroundColor = R.color.cardBackgroundColor()
        view.layer.cornerRadius = CGFloat(5)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.setStyle(.cellMain)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let releaseLabel: UILabel = {
        let label = UILabel()
        label.setStyle(.cellSide)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let voteLabel: UILabel = {
        let label = UILabel()
        label.setStyle(.cellSide)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let starImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.image.fullStarIcon()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private func setupSubviews() {
        contentView.addSubview(informationView)
        informationView.addSubview(titleLabel)
        informationView.addSubview(releaseLabel)
        informationView.addSubview(voteLabel)
        informationView.addSubview(starImageView)
        contentView.addSubview(posterImageView)
    }
    
    private func setupConstraints() {
        let edge = CGFloat(20)
        let distance = CGFloat(10)
        let labelSize = CGFloat(20)
        
        posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: distance).isActive = true
        posterImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: edge).isActive = true
        posterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: (-1 * distance)).isActive = true
        posterImageView.widthAnchor.constraint(equalToConstant: CGFloat(120)).isActive = true
        posterImageView.heightAnchor.constraint(equalToConstant: CGFloat(160)).isActive = true
        
        informationView.leftAnchor.constraint(equalTo: posterImageView.leftAnchor).isActive = true
        informationView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: (-1 * edge)).isActive = true
        informationView.bottomAnchor.constraint(equalTo: posterImageView.bottomAnchor).isActive = true
        informationView.heightAnchor.constraint(equalToConstant: CGFloat(140)).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: informationView.topAnchor, constant: edge).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: posterImageView.rightAnchor, constant: distance).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: informationView.rightAnchor, constant: (-1 * edge)).isActive = true
        
        releaseLabel.topAnchor.constraint(greaterThanOrEqualTo: titleLabel.bottomAnchor, constant: distance).isActive = true
        releaseLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        releaseLabel.rightAnchor.constraint(equalTo: titleLabel.rightAnchor).isActive = true
        releaseLabel.heightAnchor.constraint(equalToConstant: labelSize).isActive = true
        
        voteLabel.topAnchor.constraint(equalTo: releaseLabel.bottomAnchor, constant: distance).isActive = true
        voteLabel.leftAnchor.constraint(equalTo: releaseLabel.leftAnchor).isActive = true
        voteLabel.bottomAnchor.constraint(equalTo: informationView.bottomAnchor, constant: (-1 * edge)).isActive = true
        voteLabel.heightAnchor.constraint(equalToConstant: labelSize).isActive = true
        
        starImageView.topAnchor.constraint(equalTo: voteLabel.topAnchor).isActive = true
        starImageView.leftAnchor.constraint(equalTo: voteLabel.rightAnchor, constant: distance).isActive = true
        starImageView.bottomAnchor.constraint(equalTo: voteLabel.bottomAnchor).isActive = true
        starImageView.heightAnchor.constraint(equalToConstant: labelSize).isActive = true
        starImageView.widthAnchor.constraint(equalToConstant: labelSize).isActive = true
    }
    
    private func setupView() {
        self.contentView.backgroundColor = .clear
        
        setupSubviews()
        setupConstraints()
    }
    
    // MARK: - Actions
    func setupMovie(_ movie: Movie) {
        setupView()
        
        titleLabel.text = movie.title
        releaseLabel.text = movie.releaseDate
        voteLabel.text = "\(movie.voteAverage)"
        starImageView.image = movie.voteAverage > 9.0 ? R.image.fullStarIcon() : movie.voteAverage > 5.0 ? R.image.halfStarIcon() : R.image.emptyStarIcon()
        
        if let posterPath = movie.posterPath {
            setupImage("\(MoviesNetworkManager.shared.getBasePosterPath())\(posterPath)")
        } else {
            posterImageView.image = nil
        }
    }
    
    func setupImage(_ urlString: String) {
        guard let url = URL(string: urlString) else { return }
        self.posterImageView.kf.indicatorType = .activity
        self.posterImageView.kf.setImage(with: url, options: [.processor(RoundCornerImageProcessor(cornerRadius: 5)), .cacheOriginalImage])
    }
}
