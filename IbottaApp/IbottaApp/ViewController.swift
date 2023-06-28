//
//  ViewController.swift
//  IbottaApp
//
//  Created by Edgar Barocio on 6/28/23.
//

import UIKit

class ViewController: UIViewController {

    var sampleLabel: UILabel!
    
    //Custom load view to create everything programatically instead of using Storyboards
    override func loadView() {
        view = UIView()
        view.backgroundColor = .lightGray
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

