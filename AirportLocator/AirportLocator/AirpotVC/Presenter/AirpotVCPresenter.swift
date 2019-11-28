//
//  AirpotVCAirpotVCPresenter.swift
//  AirportLocator
//
//  Created by Kishore on 27/11/2019.
//  Copyright © 2019 AirportLocator. All rights reserved.
//

class AirpotVCPresenter: AirpotVCModuleInput, AirpotVCViewOutput, AirpotVCInteractorOutput {
   
    
    weak var view: AirpotVCViewInput!
    var interactor: AirpotVCInteractorInput!
    var router: AirpotVCRouterInput!

    func viewIsReady() {
        self.view.configureMapview()
        UserManager.shared.isLocationServiceEnabled { (isLocationPermissionAccepted) in
            if isLocationPermissionAccepted{
                self.interactor.getNearbyAirports()
            }
        }
    }
    func listOfAirports(airportList: AirportListModel) {
        self.view.passListofAirpotsToMap(airportList: airportList)
    }
    func errorIngettingAirportList() {
        
           
    }
       
    
}
