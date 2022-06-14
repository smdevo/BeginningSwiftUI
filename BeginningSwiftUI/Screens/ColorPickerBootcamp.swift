//
//  ColorPicker.swift
//  BeginningSwiftUI
//
//  Created by Macservis on 25/05/22.
//

import SwiftUI

struct ColorPickerBootcamp: View {
    
    @State var background: Color = Color.green
    
    
   
    
    
    var body: some View {
     
        NavigationView {
            
            
            ZStack(alignment: .topLeading) {
                
             background
                
                
                
                
             ColorPicker("", selection: $background, supportsOpacity: true)
                    .padding()
                    .frame(width: 50, height: 50)
                    .background(Color.red.cornerRadius(10))
                    .padding()
                
                
            }//ZStack
            .navigationTitle("Color Picker")
            .navigationBarTitleDisplayMode(.inline)
            
            
            
        }//NavigationView
        
        
        
    }//body
}

struct CustomerColorPicer: View {
    
    @State var background: Color = Color.gray.opacity(0.2)
    
    @State var seettingView: Bool = false
    
    var body: some View {
        
        VStack(spacing: 0) {
        
            Color.gray.edgesIgnoringSafeArea(.top).frame(height: 1)
            
            
        NavigationView {
            
            ZStack {
                
                background
                
                
                
                
            if seettingView {
                    
               SettingView(background: $background, endBool: $seettingView)
                    .frame(width: UIScreen.main.bounds.width / 2)
                    .padding(.trailing, UIScreen.main.bounds.width / 2)
                    .transition(AnyTransition.move(edge: .leading))
                    .animation(Animation.easeInOut)
                    
                
                
                    
            }
                
                
                
                
                
            }//ZStack
            .navigationTitle("Custom Color Picer")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading:
                Button{
                seettingView.toggle()
                } label: {
                Image(systemName: "filemenu.and.selection")
                    .foregroundColor(.white)
                }
            )
      
         }//NavigationView
        
            
            
        }//VStack

    }//body
    
    
    
    init(){
        
        UINavigationBar.appearance().backgroundColor = .gray
       
        
    }
    
}





struct SettingView: View {
    
    @Binding var background: Color
    
    @Binding var endBool: Bool
    
    var body: some View {
        

        ZStack {
                
                Color.black.opacity(0.6)
                
                
                VStack {

                  ColorPicker("Themes", selection: $background, supportsOpacity: true)
                        .padding()
                        .padding(.top)
                        .foregroundColor(.white)
                        
                    
                    Spacer()
                    
                }//VStack

                
                
                
                
            }//ZStack
            
            
       // }//NavigationView
        
        
        
    }
    
    
    
    
    
}






struct ColorPicker_Previews: PreviewProvider {
    static var previews: some View {
        CustomerColorPicer()
    }
}
