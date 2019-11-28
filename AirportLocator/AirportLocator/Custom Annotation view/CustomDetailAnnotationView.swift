//
//  CustomDetailAnnotation.swift
//  AirportLocator
//
//  Created by admin on 28/11/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import MapKit

class CustomDetailAnnotationView: MKAnnotationView , UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var numberOFLocations: UIPageControl!
    var locationsArray : Array<Results>!
    @IBOutlet weak var collectionView: UICollectionView!

    func loadLocations(locationsArray: Array<Results>) {
        if locationsArray.count > 1 {
            numberOFLocations.isHidden = false
            numberOFLocations.numberOfPages = locationsArray.count
        }else{
            numberOFLocations.isHidden = true
        }
        self.locationsArray = locationsArray
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib.init(nibName: "AnnotationDetailCell", bundle: nil), forCellWithReuseIdentifier: "AnnotationDetailCell")
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return locationsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnnotationDetailCell", for: indexPath) as! AnnotationDetailCell
            cell.configure(with: locationsArray[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width, height: self.collectionView.frame.height)
    }
   func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    self.numberOFLocations.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    
}
