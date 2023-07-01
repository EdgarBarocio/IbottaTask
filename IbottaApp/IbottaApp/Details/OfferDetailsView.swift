//
//  OfferDetailsView.swift
//  IbottaApp
//
//  Created by Edgar Barocio on 6/28/23.
//

import Foundation
import UIKit

class OfferDetailsView: UIViewController {
    
    let offerImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.lightGray
        let width = UIScreen.main.bounds.size.width
        imageView.frame = CGRectMake(0, 0, ((width / 2) - 32), 200)
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
    
    let offerDetailsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 12)
        //label.textColor = UIColor(red: 74.0, green: 74.0, blue: 74.0, alpha: 1.0)
        label.text = "Offer Details"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let favoriteToggle: UISwitch = {
        let uiSwitch = UISwitch()
        return uiSwitch
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis  = NSLayoutConstraint.Axis.vertical
        sv.alignment = UIStackView.Alignment.center
        sv.distribution = UIStackView.Distribution.fillEqually
        sv.translatesAutoresizingMaskIntoConstraints = false;
        return sv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        buildView()
    }
    
    private func buildView() {
        self.view.addSubview(offerImage)
        self.view.addSubview(favoriteToggle)
        self.view.addSubview(offerNameLabel)
        self.view.addSubview(offerDetailsLabel)
        self.view.addSubview(valueLabel)
        self.view.addSubview(stackView)
        
        stackView.addArrangedSubview(offerImage)
        stackView.addArrangedSubview(favoriteToggle)
        stackView.addArrangedSubview(offerNameLabel)
        stackView.addArrangedSubview(valueLabel)
        stackView.addArrangedSubview(offerDetailsLabel)
    }
}
