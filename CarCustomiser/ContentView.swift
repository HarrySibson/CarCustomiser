//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Harry Sibson on 16/01/2022.
//

import SwiftUI

struct ContentView: View {
    let car = Car(make: "Mazda", model:"MX-5", topSpeed: 125, acceleration: 7.7, handling: 5)
    
    var body: some View {
        Text("Car Make: \(car.make)")
        Text("Car Model: \(car.model)")
        Text("Car Top Speed: \(car.topSpeed)mph")
        Text("Car Acceleration (0 - 60): \(car.acceleration)s") 
        Text("Car Handling: \(car.handling)")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
