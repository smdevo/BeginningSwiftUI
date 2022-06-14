//
//  SubmitTextFieldBootcamp.swift
//  BeginningSwiftUI
//
//  Created by Macservis on 09/06/22.
//

import SwiftUI

struct SubmitTextFieldBootcamp: View {
    
    @State var text: String = ""
    
    var body: some View {
        
        VStack {
            
            
            TextField("Placeholder...",text: $text)
                .onSubmit {
                    print("On Submit")
                }
                .submitLabel(.go)
            
            TextField("Placeholder...",text: $text)
                .onSubmit {
                    print("On Submit")
                }
                .submitLabel(.return)
            
            TextField("Placeholder...",text: $text)
                .onSubmit {
                    print("On Submit")
                }
                .submitLabel(.done)
            
        }
         
        
        
        TextField("Placeholder...",text: $text)
            .onSubmit {
                print("On Submit")
            }
            .submitLabel(.go)
    }
}

struct SubmitTextFieldBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SubmitTextFieldBootcamp()
    }
}
