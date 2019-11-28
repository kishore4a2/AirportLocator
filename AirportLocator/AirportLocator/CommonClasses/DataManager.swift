//
//  DataManager.swift
//  AirportLocator
//
//  Created by admin on 27/11/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class DataManager: NSObject {
    static func getNearByAirportList<T: Decodable>(url: URL, type: T.Type, completionHandler: @escaping (_ error: Error?, _ obj: T?) -> ()) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
             if error != nil{
                completionHandler(error, nil)
                return
            }
            do {
                let dataObj = try JSONDecoder().decode(T.self, from: data!)
                completionHandler(nil, dataObj)
            } catch let error {
                completionHandler(error, nil)
                return
            }
        }.resume()
    }
}
