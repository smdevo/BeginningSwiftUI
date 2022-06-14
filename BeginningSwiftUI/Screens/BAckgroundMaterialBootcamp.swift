//
//  BAckgroundMaterialBootcamp.swift
//  BeginningSwiftUI
//
//  Created by Macservis on 08/06/22.
//

import SwiftUI

struct BackgroundMaterialBootcamp: View {
    var body: some View {
        ZStack  {
            
            Image("0")
//                .resizable()
//                .scaledToFit()
                .frame(height: 600)
            
            VStack
            {
               Spacer()
                
                
                RoundedRectangle(cornerRadius: 20)
                    .frame(height: 300)
                    .background(.ultraThickMaterial)
                    .cornerRadius(20)
 
            }
            
        
            
            
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct BAckgroundMaterialBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundMaterialBootcamp()
    }
}
