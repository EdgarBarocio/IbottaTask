//
//  OfferCollectionViewCell.swift
//  IbottaApp
//
//  Created by Edgar Barocio on 6/28/23.
//

import Foundation
import UIKit

class OfferCollectionViewCell: UICollectionViewCell {
    
    var details: OffersModel?
    static let cellIdentifier = "OfferCell"
    
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
        label.font = UIFont(name: "AvenirNext-Regular", size: 11)
        //label.textColor = UIColor(red: 74.0, green: 74.0, blue: 74.0, alpha: 1.0)
        label.text = "Offer Name"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var favoritedView: UIButton = {
        let view = UIButton()
        view.backgroundColor = .green
        view.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        view.layer.cornerRadius = 0.5 * view.bounds.size.width
        view.clipsToBounds = true
        view.isHidden = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        contentView.addSubview(offerImage)
        contentView.addSubview(valueLabel)
        contentView.addSubview(offerNameLabel)
        contentView.addSubview(favoritedView)
        
        //Constraints
        offerImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 1).isActive = true
        offerImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 6.0).isActive = true
        offerImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -6.0).isActive = true
        offerImage.heightAnchor.constraint(equalToConstant: self.frame.height - 70).isActive = true
        
        favoritedView.topAnchor.constraint(equalTo: self.topAnchor, constant: 3).isActive = true
        favoritedView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -9.0).isActive = true
        favoritedView.widthAnchor.constraint(equalToConstant: 10.0).isActive = true
        favoritedView.heightAnchor.constraint(equalToConstant: 10.0).isActive = true
        
        valueLabel.topAnchor.constraint(equalTo: offerImage.bottomAnchor, constant: 8.0).isActive = true
        valueLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        valueLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        offerNameLabel.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 3.0).isActive = true
        offerNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        offerNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    public func configure(_ viewModel: OffersCollectionViewCellViewModel) {
        
    }
}
