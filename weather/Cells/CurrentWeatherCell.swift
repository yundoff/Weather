//
//  CurrentWeatherCell.swift
//  weather
//
//  Created by Aleksey Yundov on 26.04.2024.
//

import UIKit

final class CurrentWeatherCell: UICollectionViewCell {
    
    // MARK: - Nested Types
    
    private enum Constants {
        
        static let normalInset: CGFloat = 16.0
        static let spacing: CGFloat = 8
    }
    
    static let id = "CurrentWeatherCell"
    
    // MARK: - UI Properties
    
    private let locationLabel: UILabel = {
        let label = UILabel()

        label.font = label.font.withSize(32)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let temperatureLabel: UILabel = {
        let label = UILabel()

        label.font = label.font.withSize(48)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        
        label.font = label.font.withSize(24)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    private lazy var temperatureStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [locationLabel, temperatureLabel, descriptionLabel])
        
        stackView.axis = .vertical

        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [temperatureStackView, imageView])
        
        stackView.alignment = .center
        stackView.axis = .horizontal

        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        return stackView
    }()
    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func setupViews() {
        setupSubviews()
        setupLayout()
    }

    private func setupSubviews() {
        contentView.addSubview(stackView)
        contentView.backgroundColor = .systemGray5
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([

            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }

    func setup(model: MainCurrentWeather) {
        temperatureLabel.text = model.temperature
        locationLabel.text = model.location
        imageView.image = model.image
        descriptionLabel.text = model.description
    }
}
