//
//  ContextMenuBootcamp.swift
//  BeginningSwiftUI
//
//  Created by Macservis on 23/05/22.
//

import SwiftUI

struct ContextMenuBootcamp: View {
    @State var users: [User] = [
        User(name: "Samandar", profileImageStr: "1"),
        User(name: "Akbarjon", profileImageStr: "2"),
        User(name: "Sardorbek", profileImageStr: "3"),
        User(name: "Nodirbek", profileImageStr: "4"),
        User(name: "Humoyun", profileImageStr: "5"),
        User(name: "MuhammadRizo", profileImageStr: "6"),
        User(name: "Anvar", profileImageStr: "7"),
        User(name: "Orzubek", profileImageStr: "8")
        ]
    @State var background: Color = Color.secondary.opacity(0.4)
    
    
    var body: some View {
        
            
        homeView
            
        
    }
    
    var homeView: some View {
        
        ZStack {
            
            background.edgesIgnoringSafeArea(.all)
            
            
            NavigationView {
                
                ScrollView {
                     
                    ForEach( 0 ..< users.count) { i in
                       
                        VStack(spacing: 0) {
                            
                            Rectangle()
                                .frame(width: UIScreen.main.bounds.width - 50,height: 0.5)
                                
                            NavigationLink(destination: {
                                
                                ContextResultView(img: $users[i].profileImageStr)
                                
                            }, label: {
                                
                                ContextCellView(userName: $users[i].name, userimg: $users[i].profileImageStr)
                                        .padding(.all,5)
                                        //.foregroundColor(Color.gray)
                                
                            })
                                .contextMenu(menuItems: {
                                    
                                    ContextMenuItems(imgstr: $users[i].profileImageStr)
                                    
                                    
                                    
                                })
                         
                        }
                        
                    }
                    
                    
                    
                    
                }
                .navigationTitle("Home Page")
                
                
                
                
            }
            
            
            
            
        }
        
        
        
    }
   
    
}

struct ContextMenuItems: View {
    
    
    @Binding var imgstr: String
    
    
    
    var body: some View {
        
        //contextMenu1
        
      
        contextMenu2
        
        
    }
    
    
    
    var contextMenu2: some View {
        
        VStack {
            
            
            Image("9")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
            
            
            
            Button {
                
                print("Kontaktlarga qo'shildi")
                
            } label:  {
                
                HStack {
                    
                    Text("Kontaktlarga qo'shsish")
                        .foregroundColor(.black)

                    Image(systemName: "person.badge.plus")
                    
                }
                
            }
            
           
            Button {
                
                print("Jilddan olib tashlandi")
                
            } label:  {
                
                HStack {
                    
                    Text("Jilddan olib tashlash")
                        .foregroundColor(.black)

                    Image(systemName: "folder.badge.minus")
                    
                }
                
            }
            
            
            Button {
                
                print("O'qilmagan belgilandi")
                
            } label:  {
                
                HStack {
                    
                    Text("O'qilmagan deb belgilash")
                        .foregroundColor(.black)

                    Image(systemName: "message")
                    
                }
                
            }
            
            
            NavigationLink {
               ContextResultView(img: $imgstr)
            } label: {
                
                HStack {
                
                Text("Ochish")
                    
                    
                Image(systemName: "envelope.open")
                    
                    
                }
            }

            
            
        }
        
        
        
        
    }
    
    
    
    var contextMenu1: some View {
        
        VStack {
            
            
            
            Button {
                
                print("Kontaktlarga qo'shildi")
                
            } label:  {
                
                HStack {
                    
                    Text("Kontaktlarga qo'shsish")
                        .foregroundColor(.black)

                    Image(systemName: "person.badge.plus")
                    
                }
                
            }
            
           
            Button {
                
                print("Jilddan olib tashlandi")
                
            } label:  {
                
                HStack {
                    
                    Text("Jilddan olib tashlash")
                        .foregroundColor(.black)

                    Image(systemName: "folder.badge.minus")
                    
                }
                
            }
            
            
            Button {
                
                print("O'qilmagan belgilandi")
                
            } label:  {
                
                HStack {
                    
                    Text("O'qilmagan deb belgilash")
                        .foregroundColor(.black)

                    Image(systemName: "message")
                    
                }
                
            }
            
            
            NavigationLink {
               ContextResultView(img: $imgstr)
            } label: {
                
                HStack {
                
                Text("Ochish")
                    
                    
                Image(systemName: "envelope.open")
                    
                    
                }
            }

            
            
        }
        
        
        

        
        
        
        
        
    }
    
    
}




struct ContextResultView: View {
    
    @Binding var img: String
    
    
    var body: some View {
        
        Image(img)
            .resizable()
            .scaledToFit()
            .padding()
            .navigationTitle("ImageView")
        
    }
    
    
}



struct ContextCellView: View {
    
    @Binding var userName: String
    
    @Binding var userimg: String
    
    
    var body: some View {
        
        HStack {
            
            Image(userimg)
                .resizable()
                .scaledToFill()
                .frame(width: 75, height: 75)
                .clipShape(Circle())
                .padding(.leading)
            
            
            
            
            
            
            
            Text("\(userName)")
                .font(.title)
                .padding(.horizontal)
                //.padding(.leading)
            
            Spacer()
            
        }
        
        
    }
    
    
}


struct ContextMenuuu: View {
    
    @State var background: Color = Color.white
    
    
    
    var body: some View {
        ZStack {
            
            background.edgesIgnoringSafeArea(.all)
            
            
            VStack(alignment: .leading,spacing: 10) {
                
                Image(systemName: "house.fill")
                
                Text("Context Menu")
                
                Text("This is context Menu")
            }//VStack
            .padding(30)
            .foregroundColor(.white)
            .background(Color.purple.cornerRadius(30))
            .contextMenu {
                Text("Item 1")
                
                
                Button {
                    background = Color.red
                } label: {
                    Text("Item 2")
                }

                Button(action: {
                    background = Color.white
                }, label: {
                    
                   Label("Refresh", systemImage: "flame.fill")
                    
                })
                
                
            }//contextMenu
            
            
        }//Zstack
        
        
       
    }//body
    
    
}//ContextMenuuu







struct ContextMenuBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenuuu()
    }
}
