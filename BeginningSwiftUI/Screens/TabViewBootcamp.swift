//
//  TabViewBootcamp.swift
//  BeginningSwiftUI
//
//  Created by Macservis on 28/05/22.
//

import SwiftUI

struct TabViewBootcamp: View {
    
    @State var selectView: Int = 1
    
    
    var body: some View {
       
        ZStack {
            
            
         Color.red.edgesIgnoringSafeArea(.all)
            
            
          
            TabView(selection: $selectView) {
                           
                        
                    HomeTabView()
                        .tabItem {
                            Image(systemName: "house.fill")
                            Text("Home")
                        }
                        .tag(1)
                        
                FolderTabView(selectedTabView: $selectView)
                        .tabItem {
                            Image(systemName: "folder.fill")
                            Text("Folder")
                        }
                        .tag(2)
                
                    
                    ProfileTabView()
                        .tabItem {
                            Image(systemName: "person.fill")
                            Text("Profile")
                        }
                        .tag(3)
                
                       TrashTabView()
                        .tabItem {
                            Image(systemName: "trash.fill")
                            Text("Trash")
                        }
                        .tag(4)
                        
                        
                    }//TabView
                .accentColor(.green)
                //.tabViewStyle(PageTabViewStyle())
                
      
            
        }//ZStack
        
        
        
        
        
    }
}
 









//MARK:   HomeView

struct HomeTabView: View {
    
    
    
    var body: some View {

        
        NavigationView{
                
                List(0..<100) { i in
                    
                    Text("\(i)")
                    
                }
                .navigationTitle("Home")
            
         }//NavView
        
        
    }//body
}



//MARK: Folder

struct FolderTabView: View {
    
    @Binding var selectedTabView: Int
    
    var body: some View {
        
        NavigationView{
            
            ZStack {
                Color.green.edgesIgnoringSafeArea(.top)
                
                ScrollView {
                
                    VStack {
                        Text("Folders")
                        
                        Button {
                            selectedTabView = 3
                        } label: {
                            Text("Go to profile View")
                                .padding()
                                .padding(.horizontal)
                                .foregroundColor(.white)
                                .background(Color.red.cornerRadius(10))
                        }

                        
                    }//VStack
                    
                   
                    
                }//ScrollView
                .navigationTitle("FolderView")
                
                
            }//Zstack
            
            
            
        }//NavigationView
            
    }//body
    
}

//MARK: ProfileView

struct ProfileTabView: View {
    
    
    var body: some View {
        
        NavigationView {
            
            Text("ProfileView")
                .navigationTitle("Profile")
            
            
        }
    
        
    }//body
    
}






//MARK: TrashView


struct TrashTabView: View {
    
    
    var body: some View {
        
        NavigationView {
            
            Text("Trash View")
                .navigationTitle("Trash")
            
            
        }//NavigationView
        
        
    }//body
}






struct CustomTabbar: View {
    
    var body: some View {
        
       // ScrollView {
            
        VStack {
            
            TabView {
                
                RoundedRectangle(cornerRadius: 25)
                    .fill(.gray)
                 
                
                RoundedRectangle(cornerRadius: 25)
                    .fill(.green)
                
                RoundedRectangle(cornerRadius: 25)
                    .fill(.blue)
                    .tabItem {
                        Image(systemName: "house.fill")
                    }
                
                RoundedRectangle(cornerRadius: 25)
                    .fill(.red)
                
                RoundedRectangle(cornerRadius: 25)
                    .fill(.orange)
                

            }//TabView
            .frame(height: 300)
            .tabViewStyle(PageTabViewStyle())
            
            Spacer()
            
        }//VStack
            
            
            
        
        
        
            
      //  }//ScrollView
        
        
        
    }//body
    
}

struct UserTab {
    let id = UUID()
    var name: String
    var images: [String]
    
}

struct UsersTabS {
    
    static var users: [UserTab] = [
    
    UserTab(name: "Samandar", images: ["1","2","3","4","5","6","7","8"]),
    UserTab(name: "Akbarjon", images: ["1","2","3","4","5","6","7","8"]),
    UserTab(name: "Rustambek", images: ["1","2","3","4","5","6","7","8"]),
    UserTab(name: "Sardorbek", images: ["1","2","3","4","5","6","7","8"]),
    UserTab(name: "Nodirbek", images: ["1","2","3","4","5","6","7","8"]),
    UserTab(name: "Amirqul", images: ["1","2","3","4","5","6","7","8"]),
    UserTab(name: "G'aybulla", images: ["1","2","3","4","5","6","7","8"]),
    UserTab(name: "Shahboz", images: ["1","2","3","4","5","6","7","8"]),
    UserTab(name: "Samandar", images: ["1","2","3","4","5","6","7","8"]),
    UserTab(name: "Akbarjon", images: ["1","2","3","4","5","6","7","8"]),
    UserTab(name: "Rustambek", images: ["1","2","3","4","5","6","7","8"]),
    UserTab(name: "Sardorbek", images: ["1","2","3","4","5","6","7","8"]),
    UserTab(name: "Nodirbek", images: ["1","2","3","4","5","6","7","8"]),
    UserTab(name: "Amirqul", images: ["1","2","3","4","5","6","7","8"]),
    UserTab(name: "G'aybulla", images: ["1","2","3","4","5","6","7","8"]),
    UserTab(name: "Shahboz", images: ["1","2","3","4","5","6","7","8"])
    
    
    ]
    
}





struct CustomTabView2: View {
    
    @State var users: [UserTab] = UsersTabS.users
    
    
    var body: some View {
        
    
        TabView {
            
           HomeCustomView(users: $users)
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Users")
                }
            
            SettingTAbView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Setting")
                }
            
            
            
        }
        
        
        
    }//body
}


struct HomeCustomView: View {
    
    
    @Binding var users: [UserTab]
    
    
    var body: some View {
      
        NavigationView {
            
            List(0 ..< users.count) { i in
                
                NavigationLink {
                    ProfileView(user: $users[i])
                } label: {
                    Text("\(users[i].name)")
                }

                
              
                
            }//List
            .navigationTitle("Users")
            
        }//NavigationView
        
        
      
        
    }//body
    
    
}


struct SettingTAbView: View {
    
    var body: some View {
        
        Text("Setting")
        
    }
    
    
}


struct ProfileView: View {
    
    @Binding var user: UserTab
    
    
    
    var body: some View {
        
        VStack {
            
            
            TabView  {
                
                ForEach(0 ..< user.images.count) { i in
                    
                    Image("\(user.images[i])")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                    
                }
                
                
            }//TabView
            .tabViewStyle(PageTabViewStyle())
            .frame(height: 300)
            
            Text("\(user.name)")
                .font(.largeTitle)
            
            
        }//VStack
        .navigationTitle("Profile Person")
    }//body
    
    
}





struct TabViewBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView2()
    }
}

