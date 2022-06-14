//
//  IntroVIew.swift
//  BeginningSwiftUI
//
//  Created by Macservis on 07/06/22.
//

import SwiftUI

struct IntroVIew: View {
    
    @AppStorage("signed_In") var signedView: Bool?
    
    
    var body: some View {
        
        
        ZStack {
            
            //background
            
            LinearGradient(colors: [Color.blue.opacity(0.5), Color.blue, Color.green], startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            //foreground
            
          
            if signedView ?? false {
                
              ProfileVieww()
                
            }
            else
            {
                
               OnboardingView()
                
            }
            
            
            
            
        }
    }
}



struct IntroVIew_Previews: PreviewProvider {
    static var previews: some View {
        IntroVIew()
    }
}
