//
//  MainViewController.swift
//  PixelTMDb
//
//  Created by Lucas Henrique Machado Da Silva on 18/09/19.
//  Copyright © 2019 Lucas Henrique Machado da Silva. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    // MARK: - UI Setup
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = R.string.main.upcoming()
        label.setStyle(.pageTitle)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let searchButton: UIButton = {
        guard let image = R.image.searchIcon() else {
            return UIButton()
        }
        
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(onTouchSearch), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let moviesTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.allowsSelection = true
        tableView.allowsMultipleSelection = false
        tableView.tableFooterView = UIView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private func setupSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(searchButton)
        view.addSubview(moviesTableView)
    }
    
    private func setupConstraints() {
        let edge = CGFloat(20)
        let distance = CGFloat(10)
        let size = CGFloat(40)
        
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: edge).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: edge).isActive = true
        titleLabel.rightAnchor.constraint(greaterThanOrEqualTo: searchButton.leftAnchor, constant: (-1 * distance)).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: size).isActive = true
        
        searchButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: edge).isActive = true
        searchButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: (-1 * edge)).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: size).isActive = true
        searchButton.widthAnchor.constraint(equalToConstant: size).isActive = true
        
        moviesTableView.topAnchor.constraint(equalTo: searchButton.bottomAnchor, constant: distance)
        moviesTableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        moviesTableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        moviesTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
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
        
        MainViewModel().fetchUpcomingMovies()
    }
    
    // MARK: - Actions
    @objc func onTouchSearch() {
        print("Search touched!")
    }
}
