//
//  ViewController.swift
//  GuessThePhoto
//
//  Created by Baris on 11.07.2023.
//

import UIKit

class HomeController: UIViewController {
    //MARK: - UI Elements
    private let guessPhotoImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "lock")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.heightAnchor.constraint(equalToConstant: 200).isActive = true
        image.widthAnchor.constraint(equalToConstant: 200).isActive = true
        image.contentMode = . scaleAspectFill
        return image
    }()
    
    private let infoLabel : UILabel = {
        let label = UILabel()
        label.text = "Lütfen Fotoğraf seçiniz"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private let chosenPhotoButton : UIButton = {
        let button = UIButton()
        button.setTitle("Fotoğraf Seç", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private var stackView = UIStackView()
    //MARK: - Properties
    private let viewModel = ImageRecognitionViewModel()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    
    //MARK: - Functions
    private func setup() {
        style()
        layout()
    }
    
    //MARK: - Actions
    
}


//MARK: - Helpers
extension HomeController {
    private func style() {
        view.backgroundColor = .white
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(guessPhotoImage)
        stackView.addArrangedSubview(infoLabel)
        stackView.addArrangedSubview(chosenPhotoButton)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
       // stackView.alignment = .center
        
        
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor, constant: -35)
        ])
    }
}


