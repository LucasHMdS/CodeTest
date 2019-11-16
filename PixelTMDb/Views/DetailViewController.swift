//
//  DetailViewController.swift
//  PixelTMDb
//
//  Created by Lucas Henrique Machado Da Silva on 18/09/19.
//  Copyright © 2019 Lucas Henrique Machado da Silva. All rights reserved.
//

import Kingfisher
import RxCocoa
import RxSwift
import UIKit

class DetailViewController: UIViewController {
    // MARK: - UI Setup
    private let backButton: UIButton = {
        guard let image = R.image.backIcon() else {
            return UIButton()
        }
        
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let shareButton: UIButton = {
        guard let image = R.image.shareIcon() else {
            return UIButton()
        }
        
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let topGradientView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let backdropImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let bottomGradientView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let detailsTableView: UITableView = {
        let tableView = UITableView()
        tableView.allowsMultipleSelection = false
        tableView.allowsSelection = false
        tableView.backgroundColor = .clear
        tableView.register(CashTableViewCell.self, forCellReuseIdentifier: "CashTableViewCell")
        tableView.register(DatesTableViewCell.self, forCellReuseIdentifier: "DatesTableViewCell")
        tableView.register(InformationTableViewCell.self, forCellReuseIdentifier: "InformationTableViewCell")
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
    
    private func setupSubviews() {
        view.addSubview(backdropImageView)
        view.addSubview(topGradientView)
        view.addSubview(bottomGradientView)
        view.addSubview(backButton)
        view.addSubview(shareButton)
        view.addSubview(detailsTableView)
        view.addSubview(loadingActivityIndicatorView)
        view.addSubview(errorLabel)
    }
    
    private func setupConstraints() {
        backdropImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        backdropImageView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        backdropImageView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        backdropImageView.heightAnchor.constraint(equalToConstant: CGFloat(view.frame.width * 0.56)).isActive = true
        
        let gradientSize = CGFloat(40)
        topGradientView.topAnchor.constraint(equalTo: backdropImageView.topAnchor).isActive = true
        topGradientView.leftAnchor.constraint(equalTo: backdropImageView.leftAnchor).isActive = true
        topGradientView.rightAnchor.constraint(equalTo: backdropImageView.rightAnchor).isActive = true
        topGradientView.heightAnchor.constraint(equalToConstant: gradientSize).isActive = true
        
        bottomGradientView.leftAnchor.constraint(equalTo: backdropImageView.leftAnchor).isActive = true
        bottomGradientView.rightAnchor.constraint(equalTo: backdropImageView.rightAnchor).isActive = true
        bottomGradientView.bottomAnchor.constraint(equalTo: backdropImageView.bottomAnchor).isActive = true
        bottomGradientView.heightAnchor.constraint(equalToConstant: gradientSize).isActive = true
        
        let edge = CGFloat(20)
        let size = CGFloat(30)
        backButton.topAnchor.constraint(equalTo: topGradientView.topAnchor).isActive = true
        backButton.leftAnchor.constraint(equalTo: topGradientView.leftAnchor, constant: edge).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: size).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: size).isActive = true
        
        shareButton.topAnchor.constraint(equalTo: topGradientView.topAnchor).isActive = true
        shareButton.rightAnchor.constraint(equalTo: topGradientView.rightAnchor, constant: (-1 * edge)).isActive = true
        shareButton.heightAnchor.constraint(equalToConstant: size).isActive = true
        shareButton.widthAnchor.constraint(equalToConstant: size).isActive = true
        
        detailsTableView.topAnchor.constraint(equalTo: bottomGradientView.bottomAnchor, constant: ((-1 * gradientSize) - 10)).isActive = true
        detailsTableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        detailsTableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        detailsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        loadingActivityIndicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loadingActivityIndicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: (-1 * size)).isActive = true
        
        let distance = CGFloat(10)
        errorLabel.topAnchor.constraint(equalTo: loadingActivityIndicatorView.bottomAnchor, constant: distance).isActive = true
        errorLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: edge).isActive = true
        errorLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: (-1 * edge)).isActive = true
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
        
        viewModel?.errorMessage.map {
            [weak self] errorMessage in
            guard let `self` = self else { return }
            
            self.errorLabel.text = errorMessage
            self.errorLabel.isHidden = false
            self.detailsTableView.isHidden = true
        }.subscribe().disposed(by: disposeBag)
        
        viewModel?.movie.map {
            [weak self] movie in
            guard let `self` = self else { return }
            self.movie = movie
            self.detailsTableView.dataSource = self
            self.detailsTableView.delegate = self
            self.detailsTableView.reloadData()
            
            if let backdropPath = movie.backdropPath {
                self.setupImage("\(MoviesNetworkManager.shared.getBaseBackdropPath())\(backdropPath)")
            } else {
                self.backdropImageView.image = nil
            }
        }.subscribe().disposed(by: disposeBag)
        
        backButton.rx.tap.bind {
            [weak self] in
            guard let `self` = self else { return }
            self.navigationController?.popViewController(animated: true)
        }.disposed(by: disposeBag)
        
        shareButton.rx.tap.bind {
            [weak self] in
            guard let `self` = self else { return }
            self.share()
        }.disposed(by: disposeBag)
    }
    
    private func setupGradient() {
        guard let startColor = R.color.viewBackgroundColor() else { return }
        guard let endColor = R.color.viewBackgroundAlphaColor() else { return }
        topGradientView.setGradient(fromColor: startColor, toColor: endColor)
        bottomGradientView.setGradient(fromColor: endColor, toColor: startColor)
    }
    
    // MARK: - Private Constants & Variables
    private let disposeBag = DisposeBag()
    private var movie: Movie?
    
    // MARK: - Public Constants & Variables
    var viewModel: DetailViewModel?
    
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
        setupGradient()
        
        viewModel?.fetchMovie()
    }
    
    // MARK: - Private Actions
    private func setupImage(_ urlString: String) {
        guard let url = URL(string: urlString) else { return }
        self.backdropImageView.kf.indicatorType = .activity
        self.backdropImageView.kf.setImage(with: url, options: [.cacheOriginalImage])
    }
    
    private func share() {
        guard let `movie` = movie else { return }
        let items = [R.string.main.shareMovieMessage(movie.title)]
        let activityViewController = UIActivityViewController(activityItems: items, applicationActivities: nil)
        self.present(activityViewController, animated: true)
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (movie != nil) ? 3 : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let `movie` = self.movie else { return UITableViewCell() }
        switch (indexPath.row) {
            case 0:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "InformationTableViewCell", for: indexPath) as? InformationTableViewCell else { return UITableViewCell()}
                cell.backgroundColor = .clear
                cell.setupInformation(withMovie: movie)
                return cell
            
            case 1:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "DatesTableViewCell", for: indexPath) as? DatesTableViewCell else { return UITableViewCell()}
                cell.backgroundColor = .clear
                cell.setupDates(withMovie: movie)
                return cell
            
            case 2:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "CashTableViewCell", for: indexPath) as? CashTableViewCell else { return UITableViewCell()}
                cell.backgroundColor = .clear
                cell.setupCash(withMovie: movie)
                return cell
            
            default:
                return UITableViewCell()
        }
    }
}
