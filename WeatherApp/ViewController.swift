//
//  ViewController.swift
//  WeatherApp
//
//  Created by Ilsaf Nabiullin on 15.02.2023.
//

import UIKit

class ViewController: UIViewController {
    // MARK: Top Stack View
    
    private let topStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()

    private let locationButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "location.circle.fill"), for: .normal)
        button.tintColor = .black
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()

    private let searchButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.tintColor = .black
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
        
    }()
    
    private let searchTextField: UITextField = {
        let searchTF = UITextField()
        searchTF.placeholder = "Search"

        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 20))
        searchTF.leftView = paddingView
        searchTF.leftViewMode = .always
        searchTF.layer.cornerRadius = 5
        searchTF.layer.borderWidth = 1
        searchTF.layer.borderColor = UIColor.gray.cgColor
        searchTF.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        searchTF.translatesAutoresizingMaskIntoConstraints = false
        
        return searchTF
    }()
    
    // MARK: Weather Info View
    
    private let weatherInfoStack: UIStackView = {
        let weatherStack = UIStackView()
        weatherStack.axis = .vertical
        weatherStack.distribution = .equalSpacing
        weatherStack.alignment = .trailing
        weatherStack.spacing = 1
        weatherStack.translatesAutoresizingMaskIntoConstraints = false
        
        return weatherStack
    }()
    
    private let weatherImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "sun.max")
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let temperatureLabel: UILabel = {
        let temperLabel = UILabel()
        temperLabel.text = "21"
        temperLabel.textColor = .black
        temperLabel.font = .systemFont(ofSize: 84, weight: .light)
        temperLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return temperLabel
    }()
    
    private let cityLabel: UILabel = {
        let city = UILabel()
        city.text = "London"
        city.textColor = .black
        city.font = .systemFont(ofSize: 36, weight: .light)
        city.translatesAutoresizingMaskIntoConstraints = false
        
        return city
    }()
    
    // MARK: Background
    
    private let background: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(background)
        weatherInfoStack.addArrangedSubview(weatherImageView)
        weatherInfoStack.addArrangedSubview(temperatureLabel)
        weatherInfoStack.addArrangedSubview(cityLabel)
        view.addSubview(weatherInfoStack)
        temperatureLabel.text! += "°C"
        
        
        topStackView.addArrangedSubview(locationButton)
        topStackView.addArrangedSubview(searchTextField)
        topStackView.addArrangedSubview(searchButton)
        view.addSubview(topStackView)
        
        setupConstraints()
    }

    // MARK: Constraints

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: view.topAnchor),
            background.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            background.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            topStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            topStackView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            locationButton.widthAnchor.constraint(equalToConstant: 40),
            searchButton.widthAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
            
        NSLayoutConstraint.activate([
            weatherInfoStack.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 30),
            weatherInfoStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25)
        ])
    
        NSLayoutConstraint.activate([
            weatherImageView.widthAnchor.constraint(equalToConstant: 125),
            weatherImageView.heightAnchor.constraint(equalToConstant: 125)
        ])
    }
}

