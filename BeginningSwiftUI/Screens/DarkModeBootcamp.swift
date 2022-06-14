//
//  DarkModeBootcamp.swift
//  BeginningSwiftUI
//
//  Created by Macservis on 28/05/22.
//

import SwiftUI

struct DarkModeBootcamp: View {
    
    @Environment(\.colorScheme) var colorscheme
    
    
    var body: some View {
       
        NavigationView {
            
            ScrollView {
                
                VStack(spacing: 30) {
                    
                    Text("This is white color")
                        .foregroundColor(.white)
                    
                    Text("This is Color black")
                        .foregroundColor(.black)
                    
                    Text("This is Color is primary -> white and black")
                       // .lineLimit(2)
                        .foregroundColor(.primary)
                    
                    Text("This new set color")
                        .foregroundColor(Color("universalColor"))
                    
                    Text("This is a struct Update Color")
                        .foregroundColor(colorscheme == .light ? Color.purple : Color.green)
                    
                    
                }//VStack
                .font(.largeTitle)
                
                
            }//ScrollView
            .navigationTitle("Color Setting")
            
            
            
        }//NAvigationView
        
        
    }
}

struct DarkModeBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        
          Group {
            DarkModeBootcamp()
                .preferredColorScheme(.light)
            
            DarkModeBootcamp()
                .preferredColorScheme(.dark)
            
        }
        
        
    }
}
