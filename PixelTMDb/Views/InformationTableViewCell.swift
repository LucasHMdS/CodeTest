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
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
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
        label.setStyle(.cellSide)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let overviewLabel: UILabel = {
        let label = UILabel()
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
        informationView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: (distance / 2))
        informationView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: edge)
        informationView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: edge)
        informationView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: (-1 * (distance / 2)))
        
        titleLabel.topAnchor.constraint(equalTo: informationView.topAnchor, constant: edge)
        titleLabel.leftAnchor.constraint(equalTo: informationView.leftAnchor, constant: edge)
        titleLabel.rightAnchor.constraint(equalTo: informationView.rightAnchor, constant: (-1 * edge))
        
        firstStarImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: distance)
        firstStarImageView.leftAnchor.constraint(equalTo: titleLabel.leftAnchor)
        
        secondStarImageView.topAnchor.constraint(equalTo: firstStarImageView.topAnchor)
        secondStarImageView.leftAnchor.constraint(equalTo: firstStarImageView.rightAnchor, constant: distance)
        secondStarImageView.heightAnchor.constraint(equalTo: firstStarImageView.heightAnchor)
        secondStarImageView.widthAnchor.constraint(equalTo: firstStarImageView.widthAnchor)
        
        thirdStarImageView.topAnchor.constraint(equalTo: secondStarImageView.topAnchor)
        thirdStarImageView.leftAnchor.constraint(equalTo: secondStarImageView.rightAnchor, constant: distance)
        thirdStarImageView.heightAnchor.constraint(equalTo: secondStarImageView.heightAnchor)
        thirdStarImageView.widthAnchor.constraint(equalTo: secondStarImageView.widthAnchor)
        
        fourthStarImageView.topAnchor.constraint(equalTo: thirdStarImageView.topAnchor)
        fourthStarImageView.leftAnchor.constraint(equalTo: thirdStarImageView.rightAnchor, constant: distance)
        fourthStarImageView.heightAnchor.constraint(equalTo: thirdStarImageView.heightAnchor)
        fourthStarImageView.widthAnchor.constraint(equalTo: thirdStarImageView.widthAnchor)
        
        fifthStarImageView.topAnchor.constraint(equalTo: fourthStarImageView.topAnchor)
        fifthStarImageView.leftAnchor.constraint(equalTo: fourthStarImageView.rightAnchor, constant: distance)
        fifthStarImageView.heightAnchor.constraint(equalTo: fourthStarImageView.heightAnchor)
        fifthStarImageView.widthAnchor.constraint(equalTo: fourthStarImageView.widthAnchor)
        
        genresLabel.topAnchor.constraint(equalTo: firstStarImageView.bottomAnchor, constant: distance)
        genresLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor)
        genresLabel.rightAnchor.constraint(equalTo: titleLabel.rightAnchor)
        
        overviewLabel.topAnchor.constraint(equalTo: genresLabel.bottomAnchor, constant: distance)
        overviewLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor)
        overviewLabel.rightAnchor.constraint(equalTo: titleLabel.rightAnchor)
        overviewLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: (-1 * edge))
    }
    
    private func setupView() {
        contentView.backgroundColor = .clear
        
        setupSubviews()
        setupConstraints()
    }
    
    // MARK: - Cell Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
}
