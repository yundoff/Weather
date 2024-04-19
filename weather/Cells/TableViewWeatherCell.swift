//
//  TableViewWeatherCell.swift
//  weather
//
//  Created by Aleksey Yundov on 22.05.2024.
//

import UIKit

final class TableViewWeatherCell: UICollectionViewCell {
    
    // MARK: - Nesetd Types
    
    private enum Constants {
        
        static let normalInset: CGFloat = 16.0
        static let spacing: CGFloat = 8.0
    }

    static let id = "TableViewWeatherCell"
    
    // MARK: - UI Properties
    
    private let datalabel: UILabel = {
        let label = UILabel()
        
        label.text = "Today, 28 July"
        label.font = label.font.withSize(12)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(systemName: "sun.max.fill")
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let dayTemplabel: UILabel = {
        let label = UILabel()
        
        label.text = "12"
        label.font = label.font.withSize(12)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let nightTemplabel: UILabel = {
        let label = UILabel()
        
        label.text = "12"
        label.font = label.font.withSize(12)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imageView, dayTemplabel, nightTemplabel])
        
        stackView.spacing = Constants.spacing
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        
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
        contentView.backgroundColor = .systemGray5
        contentView.addSubview(datalabel)
        contentView.addSubview(stackView)
        
    }
    private func setupLayout() {
        NSLayoutConstraint.activate([
            datalabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: Constants.normalInset),
            datalabel.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 24),
            imageView.widthAnchor.constraint(equalToConstant: 24),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
