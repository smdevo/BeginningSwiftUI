//
//  ModelBootcamp.swift
//  BeginningSwiftUI
//
//  Created by Macservis on 30/05/22.
//

import SwiftUI


//struct UserModal: Identifiable {
//
//    var id = UUID()
//    var name: String
//    var nickName: String
//    var follover: Int
//    var follow: Bool
//
//}
//
//
//
//
//
//struct ModelBootcamp: View {
//
//
//
//    @State var usersModal: [UserModal] = [
//
//        UserModal(name: "Samandar", nickName: "samandar4131", follover: 1200, follow: false),
//        UserModal(name: "Sardorek", nickName: "fazliddinoff", follover: 1300, follow: true),
//        UserModal(name: "Akbarjon", nickName: "akbarjon", follover: 300, follow: false),
//
//        UserModal(name: "Rustambek", nickName: "rustam_bek2324", follover: 400, follow: true)
//
//    ]
//
//
//
//
//    var body: some View {
//
//        NavigationView {
//
//            List {
//                ForEach(usersModal, content: { user in
//
//                    HStack(spacing: 15) {
//
//                        Circle()
//                            .frame(width: 50, height: 50)
//
//                        VStack(alignment: .leading,spacing: 10) {
//
//                            Text(user.name)
//                                .font(.headline)
//                                .foregroundColor(.primary)
//
//                            Text(user.nickName)
//                                .font(.caption)
//                                .foregroundColor(.secondary)
//
//                        }
//
//                        Spacer()
//
//                        HStack(spacing: 10) {
//
//                            if user.follow {
//                                Image(systemName: "checkmark.seal.fill")
//                                    .foregroundColor(.blue)
//                            }
//
//                            VStack {
//
//                                Text("\(user.follover)")
//                                    .font(.headline)
//                                    .foregroundColor(.primary)
//
//                                Text("followers")
//                                    .font(.caption)
//                                    .foregroundColor(.secondary)
//
//
//                            }
//
//
//
//                        }
//
//
//
//                    }
//
//                })
//
//
//            }//LIST
//            .listStyle(GroupedListStyle())
//            .navigationTitle("Instagram")
//        }//NAVV
//
//
//    }
//}


    //MARK: Modul


struct UserModaal: Identifiable {
    
    
    var id = UUID()

    let name: String
    
    let nic: String
    
    let followers: Int
    
    let cheack: Bool
    
    
}


//MARK: ViewController

struct Homescreeen: View {
     
    @State var users: [UserModaal] =
    [
        UserModaal(name: "Samandar", nic: "samandar_0002", followers: 1200, cheack: true),
        UserModaal(name: "Samandar", nic: "samandar_0002", followers: 1200, cheack: false),
        UserModaal(name: "Samandar", nic: "samandar_0002", followers: 1200, cheack: false),
        UserModaal(name: "Samandar", nic: "samandar_0002", followers: 1200, cheack: false),
        UserModaal(name: "Samandar", nic: "samandar_0002", followers: 1200, cheack: true),
        UserModaal(name: "Samandar", nic: "samandar_0002", followers: 1200, cheack: false),
        
    
    ]
    
    
    var body: some View {
    
        NavigationView {
            
            List {
                
                ForEach(users) { user in
                    
                    HStack {
                        
                        Circle()
                            .frame(width: 50, height: 50)
                        
                        VStack {
                            
                            Text(user.name)
                                .font(.headline)
                            
                            Text(user.nic)
                                .font(.caption)
                                .foregroundColor(.gray)
                            
                        }
                        
                        Spacer()
                        
                        
                        if user.cheack {
                            
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundColor(.blue)
                            
                        }
                        
                        
                        VStack {
                            
                            Text("\(user.followers)")
                                .font(.headline)
                            
                            Text("followers")
                                .foregroundColor(.gray)
                                .font(.caption)
                            
                            
                        }
                        
                    }
                    
                }//FOREACH
                
            }//LIST
            .navigationTitle("Instagram")
            
            
        }//NAVV
    
    }//Body
    
}





struct ModelBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        Homescreeen()
    }
}
