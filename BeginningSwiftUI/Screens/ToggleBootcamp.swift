//
//  ToggleBootcamp.swift
//  BeginningSwiftUI
//
//  Created by Macservis on 25/05/22.
//

import SwiftUI


@available(iOS 15.0, *)
struct ToggleBootcamp: View {
    
    @State var nametext: String = ""
    
    @State var surName: String = ""
    
    @State var malumotiisOn: Bool = false
    
    
    
    var body: some View {
        
        NavigationView {
            
            VStack(spacing: 20) {
                
                Text("Ma'lumotlar")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding()
                    .background(Color.green.opacity(05).cornerRadius(10))
                  //  .shadow(color: .black, radius: 10, x: 10, y: 10)
                    .padding(.bottom)
                
                
              TextField("Name",text: $nametext)
                    .padding()
                    .background(Color.gray.cornerRadius(10).opacity(0.2))
                    .shadow(color: .black, radius: 10, x: 10, y: 10)
                
               TextField("Surname",text: $surName)
                    .padding()
                    .background(Color.gray.cornerRadius(10).opacity(0.2))
                    .shadow(color: .black, radius: 10, x: 10, y: 10)
                
                
                
                Toggle(isOn: $malumotiisOn, label: {
                    
                   Label("Ma'lumoti oliy: ", systemImage: "book.fill")
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 10, x: 10, y: 10)
                })
                .toggleStyle(SwitchToggleStyle(tint: .green))
                .padding()
                .background(Color(uiColor: UIColor.blue).cornerRadius(10))
                
                
                
                
                NavigationLink(destination: {
                    
                    
                }, label: {
                    
                   Label("Added", systemImage: "person.fill.badge.plus")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue.cornerRadius(10))
                    
                })
                .shadow(color: .black, radius: 10, x: 10, y: 10)
                
            }//VStack
            .padding()
            .navigationTitle("Sign Up")
            
            
        }//NavigationView
        
    }//body
    
    
    
    
    
    init(){
        
          UISwitch.appearance().backgroundColor = UIColor.blue
        
    }
    
}//struct


@available(iOS 15.0, *)
struct ToggleBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ToggleBootcamp()
    }
}




