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
        timesView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: (distance / 2))
        timesView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: edge)
        timesView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: edge)
        timesView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: (-1 * (distance / 2)))
        
        runtimeLabel.topAnchor.constraint(equalTo: timesView.topAnchor, constant: edge)
        runtimeLabel.leftAnchor.constraint(equalTo: timesView.leftAnchor, constant: edge)
        runtimeLabel.rightAnchor.constraint(equalTo: timesView.rightAnchor, constant: (-1 * edge))
        
        releaseLabel.topAnchor.constraint(equalTo: runtimeLabel.bottomAnchor, constant: distance)
        releaseLabel.leftAnchor.constraint(equalTo: runtimeLabel.leftAnchor)
        releaseLabel.rightAnchor.constraint(equalTo: runtimeLabel.rightAnchor)
        releaseLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: (-1 * edge))
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
