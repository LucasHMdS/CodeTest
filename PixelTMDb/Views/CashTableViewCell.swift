//
//  CashTableViewCell.swift
//  PixelTMDb
//
//  Created by Lucas Henrique Machado Da Silva on 19/09/19.
//  Copyright © 2019 Lucas Henrique Machado da Silva. All rights reserved.
//

import UIKit

class CashTableViewCell: UITableViewCell {
    // MARK: - UI Setup
    private let cashView: UIView = {
        let view = UIView()
        view.backgroundColor = R.color.cardBackgroundColor()
        view.layer.cornerRadius = 5.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let budgetLabel: UILabel = {
        let label = UILabel()
        label.setStyle(.cellSide)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let revenueLabel: UILabel = {
        let label = UILabel()
        label.setStyle(.cellSide)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupSubviews() {
        contentView.addSubview(cashView)
        cashView.addSubview(budgetLabel)
        cashView.addSubview(revenueLabel)
    }
    
    private func setupConstraints() {
        let edge = CGFloat(20)
        let distance = CGFloat(10)
        cashView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: (distance / 2)).isActive = true
        cashView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: edge).isActive = true
        cashView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: (-1 * edge)).isActive = true
        cashView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: (-1 * (distance / 2))).isActive = true
        
        budgetLabel.topAnchor.constraint(equalTo: cashView.topAnchor, constant: edge).isActive = true
        budgetLabel.leftAnchor.constraint(equalTo: cashView.leftAnchor, constant: edge).isActive = true
        budgetLabel.rightAnchor.constraint(equalTo: cashView.rightAnchor, constant: (-1 * edge)).isActive = true
        
        revenueLabel.topAnchor.constraint(equalTo: budgetLabel.bottomAnchor, constant: distance).isActive = true
        revenueLabel.leftAnchor.constraint(equalTo: budgetLabel.leftAnchor).isActive = true
        revenueLabel.rightAnchor.constraint(equalTo: budgetLabel.rightAnchor).isActive = true
        revenueLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: (-1 * edge)).isActive = true
    }
    
    private func setupView() {
        contentView.backgroundColor = .clear
        
        setupSubviews()
        setupConstraints()
    }
    
    // MARK: - Actions
    func setupCash(withMovie movie: Movie) {
        setupView()
        
        if let budget = movie.budget {
            budgetLabel.text = "\(budget)"
        } else {
            budgetLabel.text = R.string.main.budgetNotDefined()
        }
        
        if let revenue = movie.revenue {
            revenueLabel.text = "\(revenue)"
        } else {
            revenueLabel.text = R.string.main.revenueNotDefined()
        }
    }
}
