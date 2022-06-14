//
//  ListsBootcamp.swift
//  BeginningSwiftUI
//
//  Created by Macservis on 21/05/22.
//


import SwiftUI

struct ListsBootcamp: View {
    
    
    
    @State var fruits: [String] = [
    "apple", "orange", "ananas", "banana", "peach"
    ]
    
    @State var videos: [Video] = VideoList.videos
    
    
    var body: some View {
      
        NavigationView(content: {
            
            
            List(videos, id: \.id) { video in
                
                HStack {
                    
                    Image(video.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100,height: 100)
                        .clipped()
                        .cornerRadius(10)
                        .shadow(radius: 10)
                        
                    
                    VStack(alignment: .leading,spacing: 10) {
                        
                        Text(video.name)
                            .fontWeight(.semibold)
                            .lineLimit(2)
                        
                        
                        Text(video.date)
                            .foregroundColor(.secondary)
                            
                        
                        
                        
                    }
                    
                    
                    
                }
                
                
            }
            .navigationTitle("Home Page")
            .listStyle(GroupedListStyle())
            
            
            
        })
        
        
        
        
    }
}

struct ListsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ListsBootcamp()
    }
}
