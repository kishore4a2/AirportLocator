//
//  AirpotVCAirpotVCViewController.swift
//  AirportLocator
//
//  Created by Kishore on 27/11/2019.
//  Copyright © 2019 AirportLocator. All rights reserved.
//

import UIKit

class AirpotVCViewController: UIViewController, AirpotVCViewInput {

    var output: AirpotVCViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: AirpotVCViewInput
    func setupInitialState() {
    }
}
