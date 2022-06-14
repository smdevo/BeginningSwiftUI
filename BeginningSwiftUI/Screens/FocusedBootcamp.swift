//
//  FocusedBootcamp.swift
//  BeginningSwiftUI
//
//  Created by Macservis on 08/06/22.
//

import SwiftUI

struct FocusedBootcamp: View {
    
    @State private var nametft: String = ""
    
    
    @State private var surName: String = ""
    
    @FocusState private var focustft: Bool
    
    @FocusState private var focusSurname: Bool
    
    
    var body: some View {
        
        
        
        VStack(spacing: 20){
            
           TextField("Your name...", text: $nametft)
                .focused($focustft)
                .padding()
                .padding(.leading)
                .background(Color.gray.opacity(0.3).cornerRadius(10))
            
            TextField("Your surName...", text: $surName)
                 .focused($focusSurname)
                 .padding()
                 .padding(.leading)
                 .background(Color.gray.opacity(0.3).cornerRadius(10))
            
            
            Text("\(focustft.description)  \(focusSurname.description)")
            
            
            Button("SignIn") {
                
                let firstftbool = nametft.isEmpty
                let lasttftbool = surName.isEmpty
                
               if !firstftbool && lasttftbool {
                    
                    focustft = false
                    focusSurname = true
                    
                } else if !firstftbool && !lasttftbool {
                    
                    focustft = false
                    focusSurname = false
                    
                }else {
                    
                    focustft = true
                    focusSurname = false
                }
                
               
            }
            
        }
        .padding()
        
    }
}

struct FocusedBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        FocusedBootcamp()
    }
}
