//
//  OfferDetailsView.swift
//  IbottaApp
//
//  Created by Edgar Barocio on 6/28/23.
//

import Foundation
import UIKit

class OfferDetailsView: UIViewController {
    
    var model:OfferDetailsViewModel?
    
    private var offerImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        imageView.image = UIImage(named: "Empty")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 5.0
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var valueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 12)
        //label.textColor = UIColor(red: 74.0, green: 74.0, blue: 74.0, alpha: 1.0)
        label.text = "Offer Value"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var offerNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Regular", size: 22)
        //label.textColor = UIColor(red: 74.0, green: 74.0, blue: 74.0, alpha: 1.0)
        label.text = "Offer Name"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var offerDetailsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 25)
        label.numberOfLines = 0
        //label.textColor = UIColor(red: 74.0, green: 74.0, blue: 74.0, alpha: 1.0)
        label.text = "Offer Details"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var termsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 12)
        label.numberOfLines = 0
        //label.textColor = UIColor(red: 74.0, green: 74.0, blue: 74.0, alpha: 1.0)
        label.text = "Offer terms"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var favoriteToggle: UIButton = {
        let uiButton = UIButton()
        uiButton.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        uiButton.layer.cornerRadius = 0.5 * uiButton.bounds.size.width
        uiButton.clipsToBounds = true
        uiButton.translatesAutoresizingMaskIntoConstraints = false
        uiButton.backgroundColor = .lightGray
        return uiButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        buildView()
    }
    
    private func buildView() {
        
        view.addSubview(offerImage)
        view.addSubview(favoriteToggle)
        view.addSubview(offerNameLabel)
        view.addSubview(valueLabel)
        view.addSubview(offerDetailsLabel)
        view.addSubview(termsLabel)
        favoriteToggle.addTarget(self, action: #selector(favoritePressed), for: .touchUpInside)
        
        // Constraints
        offerImage.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10.0).isActive = true
        offerImage.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor, constant: 12.0).isActive = true
        offerImage.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor, constant: -12.0).isActive = true
        offerImage.heightAnchor.constraint(equalToConstant: 200.0).isActive = true
        
        favoriteToggle.topAnchor.constraint(equalTo: offerImage.bottomAnchor, constant: 5.0).isActive = true
        favoriteToggle.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor, constant: -12.0).isActive = true
        
        offerNameLabel.topAnchor.constraint(equalTo: favoriteToggle.bottomAnchor, constant: 5.0).isActive = true
        offerNameLabel.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor, constant: 12.0 ).isActive = true
        offerNameLabel.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor, constant: -12.0).isActive = true
        
        valueLabel.topAnchor.constraint(equalTo: offerNameLabel.bottomAnchor, constant: 5.0).isActive = true
        valueLabel.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor, constant: 12.0).isActive = true
        valueLabel.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor, constant: -12.0).isActive = true

        offerDetailsLabel.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 5.0).isActive = true
        offerDetailsLabel.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor, constant: 12.0).isActive = true
        offerDetailsLabel.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor, constant: -12.0).isActive = true
        
        termsLabel.topAnchor.constraint(equalTo: offerDetailsLabel.bottomAnchor, constant: 5.0).isActive = true
        termsLabel.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor, constant: 12.0).isActive = true
        termsLabel.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor, constant: -12.0).isActive = true
    }
    
    @objc func favoritePressed() {
        guard let boolVale = self.model?.favorite else { return }
        if boolVale {
            favoriteToggle.backgroundColor = .lightGray
            self.model?.favorite = false
        } else {
            favoriteToggle.backgroundColor = .green
            self.model?.favorite = true
        }
        
        if let safeModel = self.model {
            model?.updateOfferState(model: safeModel)
        }
    }
    
    func updateInformation(_ viewModel: OfferDetailsViewModel) {
        self.offerNameLabel.text = viewModel.offerName
        self.valueLabel.text = viewModel.offerValue
        self.offerDetailsLabel.text = viewModel.offerDetails
        self.termsLabel.text = viewModel.offerTerms
        self.favoriteToggle.backgroundColor = viewModel.favorite ?? false ? .green : .lightGray
        self.offerImage.sd_setImage(with: URL(string:viewModel.offerURL ?? ""), placeholderImage: UIImage(named: "Empty"))
        
        self.model = viewModel
    }
}
