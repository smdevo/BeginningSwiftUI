//
//  SliderBootcamp.swift
//  BeginningSwiftUI
//
//  Created by Macservis on 28/05/22.
//

import SwiftUI

struct SliderBootcamp: View {
    
    @State var sliderValus: CGFloat = 10
    
    @State var background: Color = Color.green
    
    @State var showImage: Bool = false
    
    
    let min = 0.0
    
    let max = 100.0
    
    var body: some View {
      
        ZStack {
            
            background.edgesIgnoringSafeArea(.all).opacity(sliderValus / 100)
            
            
            VStack(spacing: 20) {
                
                Text("\(Int(sliderValus))")
                    .font(.largeTitle)
                
                
                Slider(value: $sliderValus)
                    .accentColor(.red)
                
                Slider(value: $sliderValus, in: min ... max)
                    .accentColor(.black)
                
                Slider(value: $sliderValus, in: min ... max, label: {
                    
                    Text("Slider")
                        .font(.largeTitle)
                    
                })
                
                
                Slider(value: $sliderValus, in: min ... max, label: {
                    Text("Slider3")
                }, minimumValueLabel: {
                   Image(systemName: "sun.min")
                }, maximumValueLabel: {
                    Image(systemName: "sun.max.fill")
                })
                
                
                Slider(value: $sliderValus, in: min...max, step: 10, label: {
                    Text("Slioder4")
                }, minimumValueLabel: {
                    Image(systemName: "sun.min")
                }, maximumValueLabel: {
                    Image(systemName: "sun.max.fill")
                }, onEditingChanged: { bool in
                    
                    if bool {
 
                        showImage = !bool
                    }else {
                        
                        showImage = !bool
                    }
                    

                })
                
                Slider(value: $sliderValus, in: min...max, step: 0.05)
                
                
                if showImage {
                    
                    Image("2")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                }
                
                
                
            }//VStack
            .padding()
          
            
        }//ZStack
  
        
    }//body
}

struct SliderBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SliderBootcamp()
    }
}
