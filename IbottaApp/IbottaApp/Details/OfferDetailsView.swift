//
//  OfferDetailsView.swift
//  IbottaApp
//
//  Created by Edgar Barocio on 6/28/23.
//

import Foundation
import UIKit
import SDWebImage

/**
    Details page to display the details of the selected Offer.
 External Dependency: SDWebImage, used to download and cache the offer images.
 */
class OfferDetailsView: UIViewController {
    
    
    var model:OfferDetailsViewModel?
    
    
    // Private UI elements of the cell, all created as functions.
    
    // Image for the product offer
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
    
    // Label that hold the current value of the Offer
    private var valueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 12)
        //label.textColor = UIColor(red: 74.0, green: 74.0, blue: 74.0, alpha: 1.0)
        label.text = "Offer Value"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Label that holds the name of the offer product
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
    
    // Label that hold the details of the current offer
    private var offerDetailsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Regular", size: 25)
        label.numberOfLines = 0
        //label.textColor = UIColor(red: 74.0, green: 74.0, blue: 74.0, alpha: 1.0)
        label.text = "Offer Details"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Label that holds the terms of the current offer
    private var termsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 12)
        label.numberOfLines = 0
        //label.textColor = UIColor(red: 74.0, green: 74.0, blue: 74.0, alpha: 1.0)
        label.text = "Offer terms"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Button that activates or de-activates the Favorite property of the offer
    private var favoriteToggle: UIButton = {
        let uiButton = UIButton()
        uiButton.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        uiButton.layer.cornerRadius = 0.5 * uiButton.bounds.size.width
        uiButton.clipsToBounds = true
        uiButton.translatesAutoresizingMaskIntoConstraints = false
        uiButton.backgroundColor = .lightGray
        return uiButton
    }()
    
    /**
        Override function to set the background color of the view and build the view and build the content for the view
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        buildView()
    }
    
    /**
        Private func that adds all subviews into the view and configures all constraints.
     */
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
    
    /**
        Private func wired as the action of the Favorites button, setting or clearing the Favorite state of the offer.
        Calls the updateOffersState funciton of the OfferDetailsViewModel that updates the Favorite state on the CollectionView
     */
    @objc private func favoritePressed() {
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
    
    /**
        Function that updates the contents of the OfferDetailsView. Displaying all the information of the selected Offer.
     
     - Parameters:
        - viewModel: OfferDetailsViewModel containind the information to display
     */
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
