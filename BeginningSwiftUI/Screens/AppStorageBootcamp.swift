//
//  AppStorageBootcamp.swift
//  BeginningSwiftUI
//
//  Created by Macservis on 06/06/22.
//

import SwiftUI

struct AppStorageBootcamp: View {
    
    @State var currenttext: String?
    
    var body: some View {
    
        VStack {
            
            if let currenttext = currenttext {
                Text(currenttext)
            }
            
            Button("SAVE") {
                
                let name: String = "Samandar"
                
                UserDefaults.standard.set(name, forKey: "name1")
                
                currenttext = name
                
            }
            
            Button("Remove") {
                
                UserDefaults.standard.removeObject(forKey: "name1")
                UserDefaults.standard.removeObject(forKey: "name")
//                UserDefaults.standard.set(<#T##value: Any?##Any?#>, forKey: <#T##String#>)
//                UserDefaults.standard.value(forKey: <#T##String#>)
            }
            
            
            
        }
        .onAppear {
            currenttext = UserDefaults.standard.string(forKey: "name1")
            
        }
        
        
        
    }
    
    
}

//
//struct FirstScreenN: View {
//
//    @State var screenBool: Bool = UserDefaults.standard.bool(forKey: "bool1")
//
//
//
//    var body: some View {
//
//        if screenBool {
//
//            HomeScreenH(screens: $screenBool)
//
//        }
//        else
//        {
//
//            SignInScreenH(screens: $screenBool)
//
//        }
//
//
//    }
//
//
//
//}
//
//
//struct HomeScreenH: View {
//
//
//    @Binding var screens: Bool
//
//
//    var body: some View {
//
//        NavigationView {
//
//            VStack {
//
//                Text("Home")
//
//
//                Button("Logout") {
//
//                    UserDefaults.standard.set(false, forKey: "bool1")
//
//                    screens = false
//
//                }
//
//            }
//            .navigationTitle("Instagram")
//
//
//        }
//
//
//
//
//    }
//}
//
//
//struct SignInScreenH: View {
//
//    @Binding var screens: Bool
//
//
//    var body: some View {
//
//        VStack {
//
//        Text("SignIn")
//
//            Button("Home") {
//
//                UserDefaults.standard.set(true, forKey: "bool1")
//
//
//                screens = true
//            }
//
//
//        }
//    }
//}
//


struct FirstScreenN: View {
    
    @State var screenBool: Bool = UserDefaults.standard.bool(forKey: "bool1")
    
    
    @AppStorage("screen11") var screeen: Bool?
    
    
    var body: some View {
        
        if screeen ?? false {
            
            HomeScreenH()
            
        }
        else
        {
            SignInScreenH()
            
        }
        
        
    }
    
    
    
}


struct HomeScreenH: View {
    
    
  
    
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Text("Home")
                
                
                Button("Logout") {
                   
                    UserDefaults.standard.set(false, forKey: "screen11")
                    
                }
                
            }
            .navigationTitle("Instagram")
          
            
        }
        
        
        
        
    }
}


struct SignInScreenH: View {
    
   
    
    
    var body: some View {
        
        VStack {
        
        Text("SignIn")
            
            Button("Home") {
                
                UserDefaults.standard.set(true, forKey: "screen11")
               
            }
            
            
        }
    }
}






struct AppStorageBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        FirstScreenN()
    }
}
