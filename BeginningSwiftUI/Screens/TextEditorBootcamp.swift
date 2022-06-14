//
//  TextEditorBootcamp.swift
//  BeginningSwiftUI
//
//  Created by Macservis on 25/05/22.
//

import SwiftUI

struct TextEditorBootcamp: View {
    
    
    @State var texteditorText: String = "This is my text Editor"
    
    
    @State var textsave: String = ""
    
    
    
    
    var body: some View {

        
        NavigationView {
            
            ZStack {
                
                Color.green.edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    
                    VStack {

                        TextEditor(text: $texteditorText)
                            .frame(height: 200)
                            .foregroundColor(.red)
                            .colorMultiply(.gray)
                            .background(Color.white)
                            
                        
                        Button {
                            
                        textsave = texteditorText
                            
                        } label: {
                            Text("Save")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue.cornerRadius(10))
                                .foregroundColor(.white)
                                
                        }

                        
                        
                        Text("\(textsave)")
                        
               
                        Spacer()

                        
                    }//VStack
                    .padding()
                    .background(Color.green)
                    .navigationTitle("TextEditor")
                    
                }//ScrollView
               
                
                
                
            }//ZStack
            
            
            
            
            
           
   
            
        }//NavigationView
        
        
    }
}

struct TextEditorBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorBootcamp()
    }
}
