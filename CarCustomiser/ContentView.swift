//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Harry Sibson on 16/01/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var starterCars = StarterCars()
    @State private var selectedCar: Int = 0
    @State private var exhaustPackage = false
    @State private var tirePackage = false
    @State private var enginePackage = false
    @State private var drivetrainPackage = false
    @State private var remainingFunds = 1000
    @State private var remainingTime = 30
    
    
    var exhaustPackageEnabled: Bool{
        return exhaustPackage ? true : remainingFunds >= 500 ? remainingTime>0 ? true : false : false
    }
    
    var tirePackageEnabled: Bool{
        return tirePackage ? true : remainingFunds >= 500 ? remainingTime>0 ? true : false : false
    }

    var enginePackageEnabled: Bool{
        return enginePackage ? true : remainingFunds >= 500 ? remainingTime>0 ? true : false : false
    }
    
    var drivetrainPackageEnabled: Bool{
        return drivetrainPackage ? true : remainingFunds >= 500 ? remainingTime>0 ? true : false : false
    }
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()


    
    var body: some View {
        let exhaustPackageBinding = Binding<Bool> (
            get: { self.exhaustPackage },
            set: { newValue in
                self.exhaustPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed+=5
                    remainingFunds-=500
                } else {
                    starterCars.cars[selectedCar].topSpeed-=5
                    remainingFunds+=500

                }
            }
        )
        let tirePackageBinding = Binding<Bool> (
            get: { self.tirePackage },
            set: { newValue in
                self.tirePackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].handling+=2
                    remainingFunds-=500
                } else {
                    starterCars.cars[selectedCar].handling-=2
                    remainingFunds+=500

                }
            }
        )
        let enginePackageBinding = Binding<Bool> (
            get: { self.enginePackage },
            set: { newValue in
                self.enginePackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].acceleration-=1
                    starterCars.cars[selectedCar].topSpeed+=5
                    remainingFunds-=500
                } else {
                    starterCars.cars[selectedCar].acceleration+=1
                    starterCars.cars[selectedCar].topSpeed-=5
                    remainingFunds+=500

                }
            }
        )
        let drivetrainPackageBinding = Binding<Bool> (
            get: { self.drivetrainPackage },
            set: { newValue in
                self.drivetrainPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].acceleration-=1
                    starterCars.cars[selectedCar].handling+=1
                    remainingFunds-=500
                } else {
                    starterCars.cars[selectedCar].acceleration+=1
                    starterCars.cars[selectedCar].handling-=1
                    remainingFunds+=500

                }
            }
        )

        Form{
            VStack(alignment: .leading, spacing: 20){
                Text("\(remainingTime)")
                    .onReceive(timer) { _ in
                    if self.remainingTime > 0 {
                        self.remainingTime -= 1
                    }
                }
                Text("\(starterCars.cars[selectedCar].displayStats())")
                Button("Next Car", action:{
                    if remainingTime == 0{
                        
                    }else{
                        if selectedCar == self.starterCars.cars.count-1{
                            selectedCar = 0
                        } else {
                            selectedCar = selectedCar + 1
                        }
                        resetDisplay()
                    }
                })
            }
            Section {
                Toggle("Exhaust Package", isOn: exhaustPackageBinding).disabled(!exhaustPackageEnabled)
                Toggle("Tire Package", isOn: tirePackageBinding).disabled(!tirePackageEnabled)
                Toggle("Engine Package", isOn: enginePackageBinding).disabled(!enginePackageEnabled)
                Toggle("Drivetrain Package", isOn: drivetrainPackageBinding).disabled(!drivetrainPackageEnabled)
            }
            Text("Remaining Funds: \(remainingFunds)")
        }
        
    }
    func resetDisplay() {
        remainingFunds = 1000
        exhaustPackage = false
        tirePackage = false
        enginePackage = false
        drivetrainPackage = false
        starterCars = StarterCars()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
