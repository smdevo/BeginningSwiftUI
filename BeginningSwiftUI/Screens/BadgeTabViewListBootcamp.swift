//
//  BadgeTabViewListBootcamp.swift
//  BeginningSwiftUI
//
//  Created by Macservis on 08/06/22.
//

import SwiftUI

struct BadgeTabViewListBootcamp: View {
    var body: some View {
        
//
//        List {
//
//            Text("Hello samandar")
//            Text("Hello samandar")
//            Text("Hello samandar")
//                .badge(10)
//            Text("Hello samandar")
//            Text("Hello samandar")
//            Text("Hello samandar")
//            Text("Hello samandar")
//
//
//        }
        
        
        
        
        TabView {
            
            Color.red
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("badge")
                }
                .badge(20)
            
            Color.blue
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("badge")
                }
                .badge("New")
            
            Color.green
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("badge")
                }
                .badge(1)
                

            Color.purple
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("badge")
                }

        }
    }
}

struct BadgeTabViewListBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        BadgeTabViewListBootcamp()
    }
}
