//
//  Car.swift
//  CarCustomiser
//
//  Created by Harry Sibson on 17/01/2022.
//

import Foundation
struct Car {
    let make: String
    let model: String
    var topSpeed: Int
    var acceleration: Double
    var handling: Int
    func displayStats() -> String{
        return """
            Make: \(make)
            Model: \(model)
            Top Speed: \(topSpeed)mph
            Acceleration (0-60): \(acceleration)s
            Handling: \(handling)
            """
    }

    
}
