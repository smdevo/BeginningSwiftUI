//
//  AsyncImagesBootcamp.swift
//  BeginningSwiftUI
//
//  Created by Macservis on 07/06/22.
//

import SwiftUI

struct AsyncImagesBootcamp: View {
    
    @State var url: URL = URL(string: "https://picsum.photos/200")!
    
    var body: some View {
        VStack
        {
            
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 300)
                    .cornerRadius(10)
                    .shadow(color: .black, radius: 10, x: 10, y: 10)

            } placeholder: {
                ProgressView()
            }

            
            
//            AsyncImage(url: url)
//                .frame(width: 100, height: 100)
//                .cornerRadius(10)
            
        }
    }
}

struct AsyncImagesBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImagesBootcamp()
    }
}
