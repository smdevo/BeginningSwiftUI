//
//  ProfileView.swift
//  BeginningSwiftUI
//
//  Created by Macservis on 07/06/22.
//

import SwiftUI

struct ProfileVieww: View {
    
    @AppStorage("signed_In") var signedView: Bool?
    
    @AppStorage("name") var currentname: String?
    
    @AppStorage("age") var currentage: Int?
    
    @AppStorage("gender") var currentgender: String?
    
    
    var body: some View {
        VStack {
            
            Image(systemName: "person.fill")
                .resizable()
                .scaledToFill()
                .foregroundColor(.white)
                .frame(width: 100, height: 100)
            
            
           Text(currentname ?? "Name")
                .font(.largeTitle)
                .foregroundColor(.white)
            
           Text("\(currentage ?? 0)")
                .font(.largeTitle)
                .foregroundColor(.white)
            
           Text(currentgender ?? "Male")
                .font(.largeTitle)
                .foregroundColor(.white)
            
            
           Text("LogOut")
                .padding()
                .padding(.horizontal)
                .font(.largeTitle)
                .foregroundColor(.white)
                .background(Color.black.cornerRadius(10))
                .onTapGesture {
                    logout()
                }
            
        }
        .padding(20)
        .background(Color.gray.opacity(0.5).cornerRadius(20))
        .shadow(color: .black, radius: 10, x: 10, y: 10)
        //.padding(50)
    }
    
    
    func logout() {
        
        signedView = false
        currentname = ""
        currentage = 10
        currentgender = "Male"
        
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileVieww()
    }
}
