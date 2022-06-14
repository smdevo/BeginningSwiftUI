//
//  StepperBootcamp.swift
//  BeginningSwiftUI
//
//  Created by Macservis on 28/05/22.
//

import SwiftUI

struct StepperBootcamp: View {
    
    
    @State var selectedStepper: Int = 1
    
    @State var selected: Int = 10
    
    var body: some View {
        
        VStack {
            
            Stepper("Mahsulot soni \(selectedStepper.description)", value: $selectedStepper)
           
            
            
            
            Stepper("Maxsulot umumiy soni  \(selected.description)", onIncrement: {
                
                stepperFunc(amount: 200)
                
            }, onDecrement: {
                
               stepperFunc(amount: -100)
                
            })
            
        }//VStack
        .padding()
        
     
    }//body
    
    func stepperFunc(amount: Int) {
        
        selected += amount

    }
    
    
    
}

struct StepperBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        StepperBootcamp()
    }
}
