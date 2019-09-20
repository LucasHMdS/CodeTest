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
        cashView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: (distance / 2))
        cashView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: edge)
        cashView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: edge)
        cashView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: (-1 * (distance / 2)))
        
        budgetLabel.topAnchor.constraint(equalTo: cashView.topAnchor, constant: edge)
        budgetLabel.leftAnchor.constraint(equalTo: cashView.leftAnchor, constant: edge)
        budgetLabel.rightAnchor.constraint(equalTo: cashView.rightAnchor, constant: (-1 * edge))
        
        revenueLabel.topAnchor.constraint(equalTo: budgetLabel.bottomAnchor, constant: distance)
        revenueLabel.leftAnchor.constraint(equalTo: budgetLabel.leftAnchor)
        revenueLabel.rightAnchor.constraint(equalTo: budgetLabel.rightAnchor)
        revenueLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: (-1 * edge))
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
