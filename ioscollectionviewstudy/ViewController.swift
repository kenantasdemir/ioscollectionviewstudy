//
//  ViewController.swift
//  ioscollectionviewstudy
//
//  Created by kenan on 24.08.2024.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var countries:[String] = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let design:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let width = self.collectionView.frame.size.width
        design.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        design.itemSize = CGSize(width: (width-30)/3, height: (width-30)/3)
        design.minimumInteritemSpacing = 5
        design.minimumLineSpacing = 5
        
        collectionView!.collectionViewLayout = design
     
        countries = ["Türkiye","Japonya","Kore","Kenya","Sırbistan","İran"]
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
}

extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellCountry", for: indexPath) as! CustomCell
        cell.customCellLabel.text = countries[indexPath.row]
        cell.layer.borderColor = UIColor.blue.cgColor
        cell.layer.borderWidth = 0.5
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected Country \(countries[indexPath.row])")
    }
}

