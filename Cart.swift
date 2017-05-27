//
//  Cart.swift
//  userLocation
//
//  Created by Macbook on 5/22/17.
//  Copyright © 2017 Macbook. All rights reserved.
//

import UIKit

class Cart: NSObject {
    let name: String
    let typeOfFood: String
    
    init(name: String, typeOfFood: String) {
        self.name = name
        self.typeOfFood = typeOfFood
    }
}
