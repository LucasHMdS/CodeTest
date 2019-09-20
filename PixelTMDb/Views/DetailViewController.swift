//
//  DetailViewController.swift
//  PixelTMDb
//
//  Created by Lucas Henrique Machado Da Silva on 18/09/19.
//  Copyright © 2019 Lucas Henrique Machado da Silva. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    // MARK: - UI Setup
    private let topGradientView: UIView = {
        let view = UIView()
        
        let gradient = CAGradientLayer()
        gradient.colors = [R.color.viewBackgroundColor() ?? .black, R.color.viewBackgroundAlphaColor() ?? .clear]
        gradient.locations = [0.0 , 1.0]
        gradient.frame = view.bounds
        
        view.layer.insertSublayer(gradient, at: 0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let bottomGradientView: UIView = {
        let view = UIView()
        
        let gradient = CAGradientLayer()
        gradient.colors = [R.color.viewBackgroundAlphaColor() ?? .clear, R.color.viewBackgroundColor() ?? .black]
        gradient.locations = [0.0 , 1.0]
        gradient.frame = view.bounds
        
        view.layer.insertSublayer(gradient, at: 0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let detailsTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.allowsMultipleSelection = false
        tableView.tableFooterView = UIView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private func setupSubviews() {
        view.addSubview(posterImageView)
        view.addSubview(topGradientView)
        view.addSubview(bottomGradientView)
        view.addSubview(detailsTableView)
    }
    
    private func setupConstraints() {
        posterImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        posterImageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        posterImageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        posterImageView.heightAnchor.constraint(equalToConstant: CGFloat(posterImageView.frame.width * 0.56)).isActive = true
        
        let gradientSize = CGFloat(40)
        topGradientView.topAnchor.constraint(equalTo: posterImageView.topAnchor).isActive = true
        topGradientView.leftAnchor.constraint(equalTo: posterImageView.leftAnchor).isActive = true
        topGradientView.rightAnchor.constraint(equalTo: posterImageView.rightAnchor).isActive = true
        topGradientView.heightAnchor.constraint(equalToConstant: gradientSize).isActive = true
        
        bottomGradientView.leftAnchor.constraint(equalTo: posterImageView.leftAnchor).isActive = true
        bottomGradientView.rightAnchor.constraint(equalTo: posterImageView.rightAnchor).isActive = true
        bottomGradientView.bottomAnchor.constraint(equalTo: posterImageView.bottomAnchor).isActive = true
        bottomGradientView.heightAnchor.constraint(equalToConstant: gradientSize).isActive = true
        
        detailsTableView.topAnchor.constraint(equalTo: bottomGradientView.bottomAnchor, constant: ((-1 * gradientSize) - 10)).isActive = true
        detailsTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        detailsTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        detailsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func setupView() {
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = R.color.viewBackgroundColor()
        
        setupSubviews()
        setupConstraints()
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}
