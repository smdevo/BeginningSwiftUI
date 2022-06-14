//
//  Videolist.swift
//  BeginningSwiftUI
//
//  Created by Macservis on 21/05/22.
//

import Foundation


struct Video {
    
    let name: String
    let date: String
    let image: String
    let id = UUID()
}

struct VideoList  {
    
    static var videos: [Video] = [
    
    Video(name: "My Favorite", date: "11,02,2018", image: "1"),
    Video(name: "My Favorite Color is", date: "11,03,2018", image: "2"),
    Video(name: "My Favorite My Favorite Color is ", date: "11,02,2018", image: "3"),
    Video(name: "My Favorite My Favorite My Favorite Color is ", date: "12,02,2018", image: "4"),
    Video(name: "My Computer is big", date: "13,02,2018", image: "5"),
    Video(name: "Any time is Coffe", date: "14,02,2018", image: "6"),
    Video(name: "All Objects", date: "15,02,2018", image: "7"),
    Video(name: "Cpp evolution", date: "16,02,2018", image: "8"),
    Video(name: "Python objects", date: "17,02,2018", image: "9"),
    Video(name: "Iphone 11 vs Iphone xr", date: "18,02,2018", image: "10"),
    Video(name: "Macbook Pro is good", date: "19,02,2018", image: "11"),
    Video(name: "M1 ultra vc i9 pufff", date: "22,02,2018", image: "12")
    
    
    
    
    ]
    
    
}


