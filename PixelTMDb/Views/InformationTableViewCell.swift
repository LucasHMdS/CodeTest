//
//  InformationTableViewCell.swift
//  PixelTMDb
//
//  Created by Lucas Henrique Machado Da Silva on 19/09/19.
//  Copyright © 2019 Lucas Henrique Machado da Silva. All rights reserved.
//

import UIKit

class InformationTableViewCell: UITableViewCell {
    // MARK: - UI Setup
    private let informationView: UIView = {
        let view = UIView()
        view.backgroundColor = R.color.cardBackgroundColor()
        view.layer.cornerRadius = 5.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 99
        label.setStyle(.cellMain)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let firstStarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let secondStarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let thirdStarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let fourthStarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let fifthStarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let genresLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 99
        label.setStyle(.cellSide)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let overviewLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 99
        label.setStyle(.cellSide)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupSubviews() {
        contentView.addSubview(informationView)
        informationView.addSubview(titleLabel)
        informationView.addSubview(firstStarImageView)
        informationView.addSubview(secondStarImageView)
        informationView.addSubview(thirdStarImageView)
        informationView.addSubview(fourthStarImageView)
        informationView.addSubview(fifthStarImageView)
        informationView.addSubview(genresLabel)
        informationView.addSubview(overviewLabel)
    }
    
    private func setupConstraints() {
        let edge = CGFloat(20)
        let distance = CGFloat(10)
        let size = CGFloat(20)
        informationView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: (distance / 2)).isActive = true
        informationView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: edge).isActive = true
        informationView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: (-1 * edge)).isActive = true
        informationView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: (-1 * (distance / 2))).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: informationView.topAnchor, constant: edge).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: informationView.leftAnchor, constant: edge).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: informationView.rightAnchor, constant: (-1 * edge)).isActive = true
        
        firstStarImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: distance).isActive = true
        firstStarImageView.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        firstStarImageView.heightAnchor.constraint(equalToConstant: size).isActive = true
        firstStarImageView.widthAnchor.constraint(equalToConstant: size).isActive = true
        
        secondStarImageView.topAnchor.constraint(equalTo: firstStarImageView.topAnchor).isActive = true
        secondStarImageView.leftAnchor.constraint(equalTo: firstStarImageView.rightAnchor, constant: distance).isActive = true
        secondStarImageView.heightAnchor.constraint(equalTo: firstStarImageView.heightAnchor).isActive = true
        secondStarImageView.widthAnchor.constraint(equalTo: firstStarImageView.widthAnchor).isActive = true
        
        thirdStarImageView.topAnchor.constraint(equalTo: secondStarImageView.topAnchor).isActive = true
        thirdStarImageView.leftAnchor.constraint(equalTo: secondStarImageView.rightAnchor, constant: distance).isActive = true
        thirdStarImageView.heightAnchor.constraint(equalTo: secondStarImageView.heightAnchor).isActive = true
        thirdStarImageView.widthAnchor.constraint(equalTo: secondStarImageView.widthAnchor).isActive = true
        
        fourthStarImageView.topAnchor.constraint(equalTo: thirdStarImageView.topAnchor).isActive = true
        fourthStarImageView.leftAnchor.constraint(equalTo: thirdStarImageView.rightAnchor, constant: distance).isActive = true
        fourthStarImageView.heightAnchor.constraint(equalTo: thirdStarImageView.heightAnchor).isActive = true
        fourthStarImageView.widthAnchor.constraint(equalTo: thirdStarImageView.widthAnchor).isActive = true
        
        fifthStarImageView.topAnchor.constraint(equalTo: fourthStarImageView.topAnchor).isActive = true
        fifthStarImageView.leftAnchor.constraint(equalTo: fourthStarImageView.rightAnchor, constant: distance).isActive = true
        fifthStarImageView.heightAnchor.constraint(equalTo: fourthStarImageView.heightAnchor).isActive = true
        fifthStarImageView.widthAnchor.constraint(equalTo: fourthStarImageView.widthAnchor).isActive = true
        
        genresLabel.topAnchor.constraint(equalTo: firstStarImageView.bottomAnchor, constant: distance).isActive = true
        genresLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        genresLabel.rightAnchor.constraint(equalTo: titleLabel.rightAnchor).isActive = true
        
        overviewLabel.topAnchor.constraint(equalTo: genresLabel.bottomAnchor, constant: distance).isActive = true
        overviewLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        overviewLabel.rightAnchor.constraint(equalTo: titleLabel.rightAnchor).isActive = true
        overviewLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: (-1 * edge)).isActive = true
    }
    
    private func setupView() {
        contentView.backgroundColor = .clear
        
        setupSubviews()
        setupConstraints()
    }
    
    private func setupStars(withAverage average: Float) {
        firstStarImageView.image = R.image.emptyStarIcon()
        secondStarImageView.image = R.image.emptyStarIcon()
        thirdStarImageView.image = R.image.emptyStarIcon()
        fourthStarImageView.image = R.image.emptyStarIcon()
        fifthStarImageView.image = R.image.emptyStarIcon()
        
        guard (average >= 1.0) else { return }
        firstStarImageView.image = R.image.halfStarIcon()
        guard (average >= 2.0) else { return }
        firstStarImageView.image = R.image.fullStarIcon()
        
        guard (average >= 3.0) else { return }
        secondStarImageView.image = R.image.halfStarIcon()
        guard (average >= 4.0) else { return }
        secondStarImageView.image = R.image.fullStarIcon()
        
        guard (average >= 5.0) else { return }
        thirdStarImageView.image = R.image.halfStarIcon()
        guard (average >= 6.0) else { return }
        thirdStarImageView.image = R.image.fullStarIcon()
        
        guard (average >= 7.0) else { return }
        fourthStarImageView.image = R.image.halfStarIcon()
        guard (average >= 8.0) else { return }
        fourthStarImageView.image = R.image.fullStarIcon()
        
        guard (average >= 9.0) else { return }
        fifthStarImageView.image = R.image.halfStarIcon()
        guard (average == 10.0) else { return }
        fifthStarImageView.image = R.image.fullStarIcon()
    }
    
    private func setupGenres(genres: [Genre]) {
        guard (genres.count > 0) else {
            genresLabel.text = R.string.main.genresNotDefined()
            return
        }
        
        var genresString = ""
        for index in 0..<genres.count {
            genresString.append(genres[index].name)
            if (index < (genres.count - 1)) {
                genresString.append(", ")
            }
        }
        genresLabel.text = genresString
    }
    
    // MARK: - Public Actions
    func setupInformation(withMovie movie: Movie) {
        setupView()
        
        titleLabel.text = movie.title
        setupStars(withAverage: movie.voteAverage)
        setupGenres(genres: movie.genres ?? [])
        overviewLabel.text = movie.overview
    }
}
