//
//  AirpotVCAirpotVCInteractor.swift
//  AirportLocator
//
//  Created by Kishore on 27/11/2019.
//  Copyright © 2019 AirportLocator. All rights reserved.
//
import UIKit
class AirpotVCInteractor: AirpotVCInteractorInput {
    weak var output: AirpotVCInteractorOutput!
    func getNearbyAirports() {
        if let urlStr = URL(string: UserManager.shared.generateNearByAirporsURL()){
            
            DataManager.getNearByAirportList(url: urlStr, type: AirportListModel.self) { (error, airportList) in
                if error != nil{
                    
                }else{
                    if let airportList = airportList{
                        self.output.listOfAirports(airportList: airportList)
                    }
                }
            }
        }
    }
}
