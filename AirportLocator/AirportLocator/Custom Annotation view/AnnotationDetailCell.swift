//
//  AnnotationDetailCell.swift
//  AirportLocator
//
//  Created by admin on 28/11/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import CoreLocation

class AnnotationDetailCell: UICollectionViewCell {
    @IBOutlet weak var locationName: UILabel!
    @IBOutlet weak var locationDistance: UILabel!
    
   override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with airportModel: Results) {
        locationName.text = airportModel.name
        if let currentLocation = UserManager.shared.locationManager.location {
            let CLCoordinates = CLLocation(latitude: currentLocation.coordinate.latitude, longitude: currentLocation.coordinate.longitude)
            let coordinateDistance = CLLocation(latitude: airportModel.geometry?.location?.lat ?? 0, longitude: airportModel.geometry?.location?.lng ?? 0)
            let distanceInMeters = coordinateDistance.distance(from: CLCoordinates)
            if distanceInMeters < 1000 {
                let strDistance = String(format: "%.2f", distanceInMeters)
               locationDistance.text = "Distance: " + strDistance + "M"
            }
            else {
                let distanceAsString = String(format: "%.2f", (distanceInMeters/1000))
                locationDistance.text = "Distance: " + distanceAsString + "KM"
            }
            
           
        }
    }

}
