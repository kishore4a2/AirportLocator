//
//  AirpotVCAirpotVCViewController.swift
//  AirportLocator
//
//  Created by Kishore on 27/11/2019.
//  Copyright © 2019 AirportLocator. All rights reserved.
//

import UIKit
import MapKit
class AirpotVCViewController: UIViewController, AirpotVCViewInput {
   
    @IBOutlet weak var mapView: MKMapView!
    var locationsArray :Array <Results> = []
    var output: AirpotVCViewOutput!
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    
    
    // MARK: AirpotVCViewInput
    func passListofAirpotsToMap(airportList: AirportListModel) {
        DispatchQueue.main.async {
            guard let airportResults = airportList.results else { return }
            let annotiatios = airportResults.map { (airportResult) -> MKAnnotation in
                let annotation:CustomAnnotationPoint = CustomAnnotationPoint()
                let lat = airportResult.geometry?.location?.lat ?? 0
                let longi = airportResult.geometry?.location?.lng ?? 0
                annotation.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: longi)
                annotation.title = airportResult.name ?? ""
                annotation.locationDetails = airportResult
                return annotation
            }
            self.mapView.addAnnotations(annotiatios)
            guard let coordinate = UserManager.shared.locationManager.location?.coordinate else { return }
            self.centerMapOnUserLocation(lat: coordinate.latitude, lng: coordinate.longitude)
        }
    }
    
    func configureMapview() {
        self.mapView.mapType = .standard
        self.mapView.isZoomEnabled = true
        self.mapView.isScrollEnabled = true
        self.mapView.showsUserLocation = true
        self.mapView.delegate = self
        self.mapView.register(CustomAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        self.mapView.register(CustomAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultClusterAnnotationViewReuseIdentifier)
    }
    func popUperrorMessage() {
        let alert = UIAlertController(title:Constants.errorTitle , message: Constants.ErrorMessage, preferredStyle: .alert)
          alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
          self.present(alert, animated: true)
    }
      
    func setupInitialState() {
    }
    
    func centerMapOnUserLocation(lat: Double , lng: Double) {
           let mapCenter = CLLocationCoordinate2D(latitude: lat, longitude: lng)
           let region = MKCoordinateRegion(center: mapCenter, span: MKCoordinateSpan(latitudeDelta: 0.400, longitudeDelta: 0.400))
        self.mapView.setRegion(region, animated: true)
        self.mapView.setCenter(mapCenter, animated: true)
        self.mapView.region = region
       }
}

extension AirpotVCViewController : MKMapViewDelegate
{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?
    {
           if annotation is MKClusterAnnotation {
               let annotation = annotation as! MKClusterAnnotation
               let view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "ClusterResuseId")
               view.displayPriority = .required
               return view
           }
           return nil
    }
       
       
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView){
           if view.annotation is MKUserLocation {
                  return
              }
           if let annotation = view.annotation {
               if annotation is MKClusterAnnotation {
                   let aaaaaa = (annotation as! MKClusterAnnotation).memberAnnotations
                   self.locationsArray.removeAll()
                   for annn in aaaaaa {
                       if let loc = (annn as! CustomAnnotationPoint).locationDetails{
                           self.locationsArray.append(loc)
                       }
                   }
                   self.loadCustomDetail(locationsArray: self.locationsArray)
               }else{
                   if let loc = (annotation as! CustomAnnotationPoint).locationDetails{
                       self.locationsArray.removeAll()
                       self.locationsArray.append(loc)
                       loadCustomDetail(locationsArray: self.locationsArray)
                   }
               }
           }
       }
       
       
       func loadCustomDetail(locationsArray: Array<Results>)  {
           let views = Bundle.main.loadNibNamed("CustomDetailAnnotationView", owner: nil, options: nil)
           let calloutView = views?[0] as! CustomDetailAnnotationView
           calloutView.loadLocations(locationsArray: locationsArray)
           calloutView.center = CGPoint(x: view.bounds.size.width / 2, y:200)
           calloutView.tag = 1000
           self.view.addSubview(calloutView)
       }
       
       
       func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
           if let viewWithTag = self.view.viewWithTag(1000) {
               viewWithTag.isHidden = true
               viewWithTag.removeFromSuperview()
           }
       }
}
