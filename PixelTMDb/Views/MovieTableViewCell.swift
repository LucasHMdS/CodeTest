//
//  MovieTableViewCell.swift
//  PixelTMDb
//
//  Created by Lucas Henrique Machado Da Silva on 18/09/19.
//  Copyright © 2019 Lucas Henrique Machado da Silva. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    // MARK: - UI Setup
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = CGFloat(5)
        return imageView
    }()
    
    private let informationView: UIView = {
        let view = UIView()
        view.backgroundColor = R.color.cardBackgroundColor()
        view.layer.cornerRadius = CGFloat(5)
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
        return imageView
    }()
    
    private func setupSubviews() {
        contentView.addSubview(posterImageView)
        contentView.addSubview(informationView)
        informationView.addSubview(titleLabel)
        informationView.addSubview(releaseLabel)
        informationView.addSubview(voteLabel)
        informationView.addSubview(starImageView)
    }
    
    private func setupConstraints() {
        let edge = CGFloat(20)
        let distance = CGFloat(10)
        let posterWidth = ((contentView.frame.size.width / 7) * 2)
        
        posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: distance).isActive = true
        posterImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: edge).isActive = true
        posterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: (-1 * distance)).isActive = true
        posterImageView.widthAnchor.constraint(equalToConstant: posterWidth)
        posterImageView.heightAnchor.constraint(equalToConstant: (posterWidth * 1.7))
        
        informationView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: edge).isActive = true
        informationView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: (-1 * edge)).isActive = true
        informationView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: (-1 * distance)).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: informationView.topAnchor, constant: edge).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: posterImageView.rightAnchor, constant: distance).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: informationView.rightAnchor, constant: (-1 * edge)).isActive = true
        
        releaseLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: distance).isActive = true
        releaseLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        releaseLabel.rightAnchor.constraint(equalTo: titleLabel.rightAnchor).isActive = true
        
        voteLabel.topAnchor.constraint(equalTo: releaseLabel.bottomAnchor, constant: distance).isActive = true
        voteLabel.leftAnchor.constraint(equalTo: releaseLabel.leftAnchor).isActive = true
        voteLabel.bottomAnchor.constraint(equalTo: informationView.bottomAnchor, constant: (-1 * edge)).isActive = true
        
        starImageView.topAnchor.constraint(equalTo: voteLabel.topAnchor).isActive = true
        starImageView.leftAnchor.constraint(equalTo: voteLabel.rightAnchor, constant: distance).isActive = true
        starImageView.rightAnchor.constraint(lessThanOrEqualTo: releaseLabel.rightAnchor).isActive = true
        starImageView.bottomAnchor.constraint(equalTo: voteLabel.bottomAnchor).isActive = true
    }
    
    private func setupView() {
        setupSubviews()
        setupConstraints()
    }
    
    // MARK: - Cell Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
}
