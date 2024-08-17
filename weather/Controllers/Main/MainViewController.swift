//
//  MainViewController.swift
//  weather
//
//  Created by Aleksey Yundov on 23.04.2024.
//

import UIKit

final class MainViewController: UIViewController, MainControllerProtocol {
    
    // MARK: - Nested Types
    
    private enum Constants {
        
        static let normalInset: CGFloat = 16.0
        static let spacing: CGFloat = 4
    }
    
    enum Section: Int, CaseIterable {
        case currentWeather
        case weekWeather
        case tableViewWeather
    }
    
    // MARK: - Properties
    
    
    private let presenter: MainPresenterProtocol
    
    private var currentWeather: MainCurrentWeather?
    
    // MARK: - UI
    
    private var compositionalLayout: UICollectionViewLayout {
        UICollectionViewCompositionalLayout{ [weak self] section, _ in
            self?.layoutSection(for: .init(rawValue: section))
        }
    }
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: compositionalLayout)
        
        collectionView.register(CurrentWeatherCell.self, forCellWithReuseIdentifier: CurrentWeatherCell.id)
        collectionView.register(WeekWeatherCell.self, forCellWithReuseIdentifier: WeekWeatherCell.id)
        collectionView.register(TableViewWeatherCell.self, forCellWithReuseIdentifier: TableViewWeatherCell.id)
        collectionView.dataSource = self
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    // MARK: - Init
    
    init(presenter: MainPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupLayout()
        presenter.requestCurrentWeather()
    }
    
    // MARK: - MainControllerProtocol
    
    func display(model: MainCurrentWeather) {
        currentWeather = model
        
        collectionView.reloadData()
    }
    
    // MARK: - Private Methods
    
    private func setupViews() {
        view.addSubview(collectionView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func layoutSection(for section: Section?) -> NSCollectionLayoutSection? {
        switch section {
        case .currentWeather:
            return currentWeatherSection()
        case .weekWeather:
            return weekWeatherSection()
        case .tableViewWeather:
            return tableViewWeatherSection()
        default:
            return nil
        }
    }
    
    private func currentWeatherSection() -> NSCollectionLayoutSection {
        let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(150))
        let item = NSCollectionLayoutItem(layoutSize: size)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 16.0, leading: 16.0, bottom: 16.0, trailing: 16.0)
        
        return section
    }
    
    private func weekWeatherSection() -> NSCollectionLayoutSection {
        let size = NSCollectionLayoutSize(widthDimension: .estimated(64), heightDimension: .estimated(100))
        let item = NSCollectionLayoutItem(layoutSize: size)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 0, leading: 16.0, bottom: 16.0, trailing: 16.0)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 16
        
        return section
    }
    
    private func tableViewWeatherSection() -> NSCollectionLayoutSection {
        let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(120))
        let item = NSCollectionLayoutItem(layoutSize: size)
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: size, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 0, leading: 16.0, bottom: 16.0, trailing: 16.0)
        
        return section
    }
}
extension MainViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 10
        case 2:
            return 7
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CurrentWeatherCell.id, for: indexPath) as? CurrentWeatherCell
            
            if let currentWeather {
                cell?.setup(model: currentWeather)
            }
            
            return cell ?? UICollectionViewCell()
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeekWeatherCell.id, for: indexPath) as? WeekWeatherCell
            else { return UICollectionViewCell() }
            return cell
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TableViewWeatherCell.id, for: indexPath) as? TableViewWeatherCell
            else { return UICollectionViewCell() }
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}
