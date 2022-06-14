//
//  TapGestureBootcamp.swift
//  BeginningSwiftUI
//
//  Created by Macservis on 30/05/22.
//

import SwiftUI

struct TapGestureBootcamp: View {
    
    @State var showColor: Bool = false
    
    var body: some View {
        VStack {
            
            RoundedRectangle(cornerRadius: 20)
                .fill(showColor ? Color.green : Color.red)
                .frame(height: 200)
            
            Button {
                showColor.toggle()
            } label: {
                Text("Button")
                    .font(.title)
                    .padding()
                    .foregroundColor(.primary)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.cornerRadius(10))
            }

            Text("TapGesture")
                .font(.title)
                .padding()
                .foregroundColor(.primary)
                .frame(maxWidth: .infinity)
                .background(Color.blue.cornerRadius(10))
                //.opacity(0.001)
                .onTapGesture(count: 2, perform: {
                    
                    showColor.toggle()
                    
                })
            
        }
        .padding()
    }
}

struct TapGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TapGestureBootcamp()
    }
}
