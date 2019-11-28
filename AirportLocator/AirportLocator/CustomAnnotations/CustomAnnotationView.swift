//
//  CustomAnnotationView.swift
//  AirportLocator
//
//  Created by admin on 28/11/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import MapKit

class CustomAnnotationView : MKMarkerAnnotationView {
  override var annotation: MKAnnotation? {
    willSet {
        clusteringIdentifier = "AirportCluster"
        glyphImage = #imageLiteral(resourceName: "plane")
        canShowCallout = false
        titleVisibility = .visible
    }
  }
}
