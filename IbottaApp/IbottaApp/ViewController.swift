//
//  ViewController.swift
//  IbottaApp
//
//  Created by Edgar Barocio on 6/28/23.
//

import UIKit

class ViewController: UIViewController {

    var offersCollectionView: UICollectionView!
    
    //Custom load view to create everything programatically instead of using Storyboards
    override func loadView() {
        view = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        buildCollectionView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "Latest offers!"
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
   
    private func buildCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 60, height: 60)
        
        /**
            var layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            layout.itemSize = CGSizeMake(<width>, <height>)
            // Setting the space between cells
            layout.minimumInteritemSpacing = <Space between columns>
            layout.minimumLineSpacing = <Space between rows>
         **/
        
        self.offersCollectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        self.offersCollectionView.dataSource = self
        self.offersCollectionView.delegate = self
        self.offersCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "OfferCell")
        self.offersCollectionView.backgroundColor = UIColor.white
        view.addSubview(self.offersCollectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "OfferCell", for: indexPath)
               myCell.backgroundColor = UIColor.blue
               return myCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let details = OfferDetailsView()
        
        self.navigationController?.pushViewController(details, animated: true)
    }
}

