//
//  OfferCollectionViewCell.swift
//  IbottaApp
//
//  Created by Edgar Barocio on 6/28/23.
//

import Foundation
import UIKit

class OfferCollectionViewCell: UICollectionViewCell {
    
    let offerImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.lightGray
        let width = UIScreen.main.bounds.size.width
        imageView.frame = CGRectMake(0, 0, ((width / 2) - 32), 100)
        imageView.image = UIImage(systemName: "Globe")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 5.0
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let valueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 12)
        //label.textColor = UIColor(red: 74.0, green: 74.0, blue: 74.0, alpha: 1.0)
        label.text = "Offer Value"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let offerNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Regular", size: 11)
        //label.textColor = UIColor(red: 74.0, green: 74.0, blue: 74.0, alpha: 1.0)
        label.text = "Offer Name"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis  = NSLayoutConstraint.Axis.vertical
        sv.alignment = UIStackView.Alignment.center
        sv.distribution = UIStackView.Distribution.fillEqually
        sv.translatesAutoresizingMaskIntoConstraints = false;
        return sv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        addSubview(offerImage)
        addSubview(valueLabel)
        addSubview(offerNameLabel)
        addSubview(stackView)
        
        stackView.addArrangedSubview(offerImage)
        stackView.addArrangedSubview(valueLabel)
        stackView.addArrangedSubview(offerNameLabel)
        
        
        
    }
}
