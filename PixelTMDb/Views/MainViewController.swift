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
        label.adjustsFontSizeToFitWidth = true
        label.setStyle(.pageTitle)
        label.text = R.string.main.upcoming()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let searchButton: UIButton = {
        guard let image = R.image.searchIcon() else {
            return UIButton()
        }
        
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let moviesTableView: UITableView = {
        let tableView = UITableView()
        tableView.allowsMultipleSelection = false
        tableView.allowsSelection = true
        tableView.backgroundColor = .clear
        tableView.dataSource = nil
        tableView.delegate = nil
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: "MovieTableViewCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
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
        label.isHidden = true
        label.numberOfLines = 10
        label.setStyle(.error)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var bottomLabelHeight: NSLayoutConstraint?
    private let bottomLabel: UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.numberOfLines = 3
        label.setStyle(.error)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(searchButton)
        view.addSubview(moviesTableView)
        view.addSubview(loadingActivityIndicatorView)
        view.addSubview(errorLabel)
        view.addSubview(bottomLabel)
    }
    
    private func setupConstraints() {
        let edge = CGFloat(20)
        let distance = CGFloat(10)
        let size = CGFloat(30)
        
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: edge).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: edge).isActive = true
        titleLabel.rightAnchor.constraint(greaterThanOrEqualTo: searchButton.leftAnchor, constant: (-1 * distance)).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: size).isActive = true
        
        searchButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: edge).isActive = true
        searchButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: (-1 * edge)).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: size).isActive = true
        searchButton.widthAnchor.constraint(equalToConstant: size).isActive = true
        
        moviesTableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: distance).isActive = true
        moviesTableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        moviesTableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        
        loadingActivityIndicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loadingActivityIndicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: (-1 * size)).isActive = true
        
        errorLabel.topAnchor.constraint(equalTo: loadingActivityIndicatorView.bottomAnchor, constant: distance).isActive = true
        errorLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: edge).isActive = true
        errorLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: (-1 * edge)).isActive = true
        
        bottomLabel.topAnchor.constraint(equalTo: moviesTableView.bottomAnchor, constant: distance).isActive = true
        bottomLabel.leftAnchor.constraint(equalTo: errorLabel.leftAnchor).isActive = true
        bottomLabel.rightAnchor.constraint(equalTo: errorLabel.rightAnchor).isActive = true
        bottomLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: (-1 * edge)).isActive = true
        bottomLabelHeight = bottomLabel.heightAnchor.constraint(equalToConstant: CGFloat(0))
        bottomLabelHeight?.isActive = true
    }
    
    private func setupView() {
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = R.color.viewBackgroundColor()
        
        setupSubviews()
        setupConstraints()
    }
    
    private func setupBindings() {
        viewModel.isLoading.map {
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
        
        viewModel.errorMessage.map {
            [weak self] errorMessage in
            guard let `self` = self else { return }
            
            self.errorLabel.text = errorMessage
            self.errorLabel.isHidden = false
            self.moviesTableView.isHidden = true
        }.subscribe().disposed(by: disposeBag)
        
        viewModel.informationMessage.map {
            [weak self] informationMessage in
            guard let `self` = self else { return }
            guard (self.errorLabel.isHidden == true) else { return }
            
            self.bottomLabel.text = informationMessage
            self.bottomLabel.isHidden = false
            self.bottomLabelHeight?.constant = CGFloat(30)
            self.view.layoutIfNeeded()
        }.subscribe().disposed(by: disposeBag)
        
        viewModel.movies.bind(to: moviesTableView.rx.items(cellIdentifier: "MovieTableViewCell", cellType: MovieTableViewCell.self)) {
            row, movie, cell in
            cell.backgroundColor = .clear
            cell.setupMovie(movie)
        }.disposed(by: disposeBag)
        
        searchButton.rx.tap.bind {
            [weak self] in
            guard let `self` = self else { return }
            self.onTouchSearch()
        }.disposed(by: disposeBag)
        
        moviesTableView.rx.willDisplayCell.bind(onNext: {
            [weak self] cell, indexPath in
            guard let `self` = self else { return }
            self.viewModel.loadedMovie(index: indexPath.row)
        }).disposed(by: disposeBag)
        
        moviesTableView.rx.itemSelected.bind(onNext: {
            [weak self] indexPath in
            guard let `self` = self else { return }
            let cell = self.moviesTableView.cellForRow(at: indexPath)
            cell?.isSelected = false
        }).disposed(by: disposeBag)
        
        moviesTableView.rx.modelSelected(Movie.self).bind(onNext: {
            [weak self] movie in
            guard let `self` = self else { return }
            let detailViewController = DetailViewController()
            detailViewController.viewModel = DetailViewModel(movieId: movie.id)
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }).disposed(by: disposeBag)
    }
    
    // MARK: - Private Constants & Variables
    private let viewModel = MainViewModel()
    private let disposeBag = DisposeBag()
    
    // MARK: - View Lifecycle
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupBindings()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.fetchUpcomingMovies()
    }
    
    // MARK: - Actions
    @objc func onTouchSearch() {
        print("Search touched!")
    }
}
