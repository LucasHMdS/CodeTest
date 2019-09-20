//
//  MainViewController.swift
//  PixelTMDb
//
//  Created by Lucas Henrique Machado Da Silva on 18/09/19.
//  Copyright © 2019 Lucas Henrique Machado da Silva. All rights reserved.
//

import RxSwift
import RxCocoa
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
    
    private enum MoviesTableViewIdentifier: String {
        case movieTableViewCell = "MovieTableViewCell"
    }
    
    private let moviesTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.allowsSelection = true
        tableView.allowsMultipleSelection = false
        tableView.tableFooterView = UIView()
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: MoviesTableViewIdentifier.movieTableViewCell.rawValue)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let loadingActivityIndicatorView: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView.color = R.color.mainTextColor()
        activityIndicatorView.isHidden = false
        activityIndicatorView.startAnimating()
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicatorView
    }()
    
    private let errorLabel: UILabel = {
        let label = UILabel()
        label.text = R.string.main.noMoviesFound()
        label.setStyle(.error)
        label.numberOfLines = 10
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(searchButton)
        view.addSubview(moviesTableView)
        view.addSubview(loadingActivityIndicatorView)
        view.addSubview(errorLabel)
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
        
        moviesTableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: distance)
        moviesTableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        moviesTableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        moviesTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        loadingActivityIndicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loadingActivityIndicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: (-1 * size)).isActive = true
        
        errorLabel.topAnchor.constraint(equalTo: loadingActivityIndicatorView.bottomAnchor, constant: distance)
        errorLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: edge).isActive = true
        errorLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: (-1 * edge)).isActive = true
    }
    
    private func setupView() {
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = R.color.viewBackgroundColor()
        
        setupSubviews()
        setupConstraints()
    }
    
    private func setupBindings() {
        viewModel?.isLoading.map {
            [weak self] isLoading in
            guard let `self` = self else { return }
            
            if (isLoading) {
                self.loadingActivityIndicatorView.isHidden = false
                self.loadingActivityIndicatorView.startAnimating()
            } else {
                self.loadingActivityIndicatorView.isHidden = true
                self.loadingActivityIndicatorView.stopAnimating()
            }
        }.subscribe().disposed(by: disposeBag)
        
        viewModel?.onShowError.map {
            [weak self] errorMessage in
            guard let `self` = self else { return }
            
            //TODO: Error message
        }.subscribe().disposed(by: disposeBag)
        
        viewModel?.displayMovies.bind(to: self.moviesTableView.rx.items) {
            [weak self] tableView, index, element in
            guard let `self` = self else { return UITableViewCell() }
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MoviesTableViewIdentifier.movieTableViewCell.rawValue) else { return UITableViewCell() }
            
            return cell
        }.disposed(by: disposeBag)
    }
    
    // MARK: - Private Constants & Variables
    private let disposeBag = DisposeBag()
    
    // MARK: - Public Constants & Variables
    var viewModel: MainViewModel?
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupBindings()
    }
    
    // MARK: - Actions
    @objc func onTouchSearch() {
        print("Search touched!")
    }
}
