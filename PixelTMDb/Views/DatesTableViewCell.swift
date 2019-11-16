//
//  DatesTableViewCell.swift
//  PixelTMDb
//
//  Created by Lucas Henrique Machado Da Silva on 19/09/19.
//  Copyright © 2019 Lucas Henrique Machado da Silva. All rights reserved.
//

import UIKit

class DatesTableViewCell: UITableViewCell {
    // MARK: - UI Setup
    private let timesView: UIView = {
        let view = UIView()
        view.backgroundColor = R.color.cardBackgroundColor()
        view.layer.cornerRadius = 5.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let runtimeLabel: UILabel = {
        let label = UILabel()
        label.setStyle(.cellSide)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let releaseLabel: UILabel = {
        let label = UILabel()
        label.setStyle(.cellSide)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupSubviews() {
        contentView.addSubview(timesView)
        timesView.addSubview(runtimeLabel)
        timesView.addSubview(releaseLabel)
    }
    
    private func setupConstraints() {
        let edge = CGFloat(20)
        let distance = CGFloat(10)
        timesView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: (distance / 2)).isActive = true
        timesView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: edge).isActive = true
        timesView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: (-1 * edge)).isActive = true
        timesView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: (-1 * (distance / 2))).isActive = true
        
        runtimeLabel.topAnchor.constraint(equalTo: timesView.topAnchor, constant: edge).isActive = true
        runtimeLabel.leftAnchor.constraint(equalTo: timesView.leftAnchor, constant: edge).isActive = true
        runtimeLabel.rightAnchor.constraint(equalTo: timesView.rightAnchor, constant: (-1 * edge)).isActive = true
        
        releaseLabel.topAnchor.constraint(equalTo: runtimeLabel.bottomAnchor, constant: distance).isActive = true
        releaseLabel.leftAnchor.constraint(equalTo: runtimeLabel.leftAnchor).isActive = true
        releaseLabel.rightAnchor.constraint(equalTo: runtimeLabel.rightAnchor).isActive = true
        releaseLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: (-1 * edge)).isActive = true
    }
    
    private func setupView() {
        contentView.backgroundColor = .clear
        
        setupSubviews()
        setupConstraints()
    }
    
    // MARK: - Actions
    func setupDates(withMovie movie: Movie) {
        setupView()
        
        releaseLabel.text = movie.releaseDate
        guard let runtime = movie.runtime else {
            runtimeLabel.text = R.string.main.runtimeNotDefined()
            return
        }
        runtimeLabel.text = "\(runtime)"
    }
}
