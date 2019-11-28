//
//  AirpotVCAirpotVCConfigurator.swift
//  AirportLocator
//
//  Created by Kishore on 27/11/2019.
//  Copyright © 2019 AirportLocator. All rights reserved.
//

import UIKit

class AirpotVCModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? AirpotVCViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: AirpotVCViewController) {

        let router = AirpotVCRouter()

        let presenter = AirpotVCPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = AirpotVCInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
