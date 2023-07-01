//
//  OfferDetailsView.swift
//  IbottaApp
//
//  Created by Edgar Barocio on 6/28/23.
//

import Foundation
import UIKit

class OfferDetailsView: UIViewController {
    
    let ghostView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        view.frame = CGRectMake(0, 0, UIScreen.main.bounds.size.width, 50)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let offerImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .orange
        imageView.frame = CGRectMake(0, 0, UIScreen.main.bounds.size.width, 200)
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
        label.backgroundColor = .lightGray
        return label
    }()
    
    let offerNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Regular", size: 11)
        //label.textColor = UIColor(red: 74.0, green: 74.0, blue: 74.0, alpha: 1.0)
        label.text = "Offer Name"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .blue
        return label
    }()
    
    let offerDetailsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 12)
        //label.textColor = UIColor(red: 74.0, green: 74.0, blue: 74.0, alpha: 1.0)
        label.text = "Offer Details"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .red
        return label
    }()
    
    let favoriteToggle: UISwitch = {
        let uiSwitch = UISwitch()
        uiSwitch.backgroundColor = .brown
        return uiSwitch
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.frame = CGRect(x: 0, y: 50, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        sv.axis  = .vertical
        sv.alignment = .top
        sv.distribution = .fillEqually
        sv.spacing = 2
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
        self.view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.view.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
            
        stackView.addArrangedSubview(ghostView)
        stackView.addArrangedSubview(offerImage)
        stackView.addArrangedSubview(favoriteToggle)
        stackView.addArrangedSubview(offerNameLabel)
        stackView.addArrangedSubview(valueLabel)
        stackView.addArrangedSubview(offerDetailsLabel)
        
    }
}
