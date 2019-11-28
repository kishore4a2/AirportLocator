//
//  AirpotVCAirpotVCInitializer.swift
//  AirportLocator
//
//  Created by Kishore on 27/11/2019.
//  Copyright © 2019 AirportLocator. All rights reserved.
//

import UIKit

class AirpotVCModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var airpotvcViewController: AirpotVCViewController!

    override func awakeFromNib() {

        let configurator = AirpotVCModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: airpotvcViewController)
    }

}
