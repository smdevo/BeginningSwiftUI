//
//  IfLetGuardBootcamp.swift
//  BeginningSwiftUI
//
//  Created by Macservis on 30/05/22.
//

import SwiftUI

struct IfLetGuardBootcamp: View {
    
    @State var currentUserID: String? = "Samandar"
    @State var displayText: String? = nil
    
    @State var isLoading: Bool = false
    
    
    var body: some View {
        NavigationView {
            
            VStack{
                
                Text("Here we are practicing safe coding!...")
                
         
                
                if let text = displayText {
                    Text(text)
                        .font(.title)
                }
                
                if isLoading {
                    
                    ProgressView()
                    
                }
                
                
              Spacer()
            }//LAZYVS
            .onAppear {
                
                loadDate2()
                
            }
            
            .navigationTitle("Safe coding")
            
        }//NAVV
    }//BODY
    
    func loadDate() {
        
        if let currentUserID = currentUserID {
            
          isLoading = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
                
                isLoading = false
                
                displayText = "User name: \(currentUserID)"
                
            })
        }
        else {
            
            displayText = "Error: Not have User ID"
            
        }
        
    }
    
    
    func loadDate2() {
        
        guard let currentUserID = currentUserID else {
            displayText = "Error Not have user ID"
            return
        }

        isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
            
            isLoading = false
            
            displayText = "Hello \(currentUserID)"
            
            
        })
        
        
    }
    
    
    
    
}



struct UserSafeCoding {

    let id = UUID()
    
    var name: String
    
    var image: String
    
}


struct UsersSafeCoding {
    
    static var users: [UserSafeCoding] = [
    
    UserSafeCoding(name: "Samandar", image: "1"),
    UserSafeCoding(name: "Samandar", image: "2"),
    UserSafeCoding(name: "Samandar", image: "3"),
    UserSafeCoding(name: "Samandar", image: "4"),
    UserSafeCoding(name: "Samandar", image: "5"),
    UserSafeCoding(name: "Samandar", image: "6"),
    UserSafeCoding(name: "Samandar", image: "7"),
    UserSafeCoding(name: "Samandar", image: "8"),
    UserSafeCoding(name: "Samandar", image: "9"),
    UserSafeCoding(name: "Samandar", image: "10"),
    UserSafeCoding(name: "Samandar", image: "11"),
    
    ]
    
}


























struct CustomGuardBootcamp: View {
    
    
    @State var usernameLogin: String? = "Samandar"
    
    @State var loading: Bool = false
    
    @State var errorTitle: String?
    
    @State var users: [UserSafeCoding]?
    
    var body: some View {
        
        
        NavigationView  {
            
            ZStack {
                
               
                if loading {
            
                
                    ProgressView()
                        .padding(50)
                        .background(Color.gray.opacity(0.2).cornerRadius(10))
                    
    
                }
                
                if let errorTitle = errorTitle {
                    Text(errorTitle)
                }
                
                
                
                if let users = users {
                
                    ScrollView {
                        
                        LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible())], content: {
                            
                            ForEach(users, id: \.id) { user in
    
                                
                                VStack {
                                    
                                    Image(user.image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 100, height: 100)
                                            .clipped()
                                            .padding()
                                    
                                    
                                    
                                 
                                    Text(user.name)
                                            .padding()
                                    
                                    
                                }
                                
                                
                            }//FOREACH
                            
                        })//LAZYVGRID
                        
                    }//SCROLLV
                    
                    
                }//IF_LET
                
                
                
                
            }
            .navigationTitle("Home")
            .onAppear {
                loadData()
            }
            
        }
        
        
    }//BODY
    
    func loadData() {

        guard let usernameLogin = usernameLogin else {
            errorTitle = "Not have User and Network"
            return
        }

        loading = true
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
            loading = false
            
            
            users = UsersSafeCoding.users
            
        })
        
        
        
        
    }
    
    
    
}






struct ViewCellGuard: View {
    
    @Binding var name: String
    
    @Binding var image: String
    

    var body: some View {
        
        VStack {
            
        //    if let image = image {
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .padding()
          //  }
            
            
            
          //  if let name = name {
                Text(name)
                    .padding()
           // }
            
            
        }
        
        
        
    }
}



struct IfLetGuardBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CustomGuardBootcamp()
    }
}
