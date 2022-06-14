//
//  PopopScreen.swift
//  BeginningSwiftUI
//
//  Created by Macservis on 18/05/22.
//

import SwiftUI

struct PopopScreen: View {
    
    @State var firstPage: Bool = false
    @State var newPAgeBool: Bool = false
    @State var background: Color = Color.purple
    
    var body: some View {
       
        
        ZStack {
            background.edgesIgnoringSafeArea(.all)

          
            VStack {
            
            Button{
                
                firstPage = true
                
                background = Color.red
                
            } label: {
            Text("Next Page")
                    .foregroundColor(Color.white)
                    .padding()
                    .padding(.horizontal, 20)
                    .font(SwiftUI.Font.title)
                    .background(Color.green)
                    .cornerRadius(10)
                    .shadow(color: .black, radius: 10, x: 10, y: 10)
            }
            .sheet(isPresented: $firstPage, content: {
           
                SecondPage()
                    
                
   
            })
            
                
                  Button{
                      
                     newPAgeBool = true
                      
                      background = Color.yellow
                      
                  } label: {
                  Text("Next Page2")
                          .foregroundColor(Color.white)
                          .padding()
                          .padding(.horizontal, 20)
                          .font(SwiftUI.Font.title)
                          .background(Color.green)
                          .cornerRadius(10)
                          .shadow(color: .black, radius: 10, x: 10, y: 10)
                  }
            
            
            }
            
   
            if newPAgeBool {
                
                NewPage(Bool: $newPAgeBool)
                    .edgesIgnoringSafeArea(.all)
                    .transition(AnyTransition.scale.animation(.default))
                    .animation(.default)
                    
                    //.padding(.leading, 100)
                    
                
                
            }
            
            
            
            
            
        }
        .edgesIgnoringSafeArea(.all)
        
        
        
    }
}


struct NewPage: View {
    
    @Binding var Bool: Bool
    
    
    var body: some View {
        
        ZStack {
        
        Color.red
        
        
        Button("ortga") {
            
           Bool = false
            
        }
        
        }
        
        
    }
}






struct SecondPage: View {
    
    @Environment(\.presentationMode) var mode
    
    
    
    var body: some View {
        
        ZStack {
            
            Color.green.edgesIgnoringSafeArea(.all)
            
            
            Button("back") {
                
                mode.wrappedValue.dismiss()
                
            }
            
        }
        
        
    }
    
    
    
}





struct PopopScreen_Previews: PreviewProvider {
    static var previews: some View {
        PopopScreen()
    }
}
