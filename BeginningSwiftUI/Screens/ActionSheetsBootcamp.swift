//
//  ActionSheetsBootcamp.swift
//  BeginningSwiftUI
//
//  Created by Macservis on 23/05/22.
//

import SwiftUI

struct ActionSheetsBootcamp: View {
    
    
    @State var showActionSheet: Bool = false
    
    
    
    var body: some View {
     
        ZStack {
            
            Color.red.edgesIgnoringSafeArea(.all)
            
            
            
            Button(action: {
                
                showActionSheet.toggle()
                
            }, label: {
                
                Text("Press Meee")
                    .padding()
                    .padding(.horizontal)
                    .foregroundColor(Color.white)
                    .background(Color.black)
                    .cornerRadius(10)
                    .shadow(color: .white, radius: 10, x: 10, y: 10)
                
                
                
            })
            .actionSheet(isPresented: $showActionSheet, content: {
                let bn = ActionSheet.Button.default(Text("Ok"))
                let cbn = ActionSheet.Button.cancel()
                
                
              return  ActionSheet(title: Text("New Action Sheets"), message: Text("This is alert -> Action Sheeets"), buttons: [cbn,bn])
                
            })
            
        }
        
        
        
    }
}




struct User {
    
    var name: String
    var profileImageStr: String
 
}





struct InstaList: View {
    
    
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
    
    
    var body: some View {
        
        NavigationView(content: homeView)
  
        }
        
    
    
    func homeView() -> some View {
     
        ScrollView {
            
            LazyVStack {
                
                ForEach(0 ..< users.count) { i in
                    
                    CellInstaView(userName: $users[i].name, userimgStr: $users[i].profileImageStr)
                        .frame(height: UIScreen.main.bounds.height / 2)
                    
                    
                }
            }
   
        }
        .navigationTitle("Instagram")
        .navigationBarTitleDisplayMode(.inline)
        
        
        
       
      
    
        
        
        
        
    }
    
    
    
        
        
    }
    
    
    


struct CellInstaView: View {
    
    @Binding var userName: String
    
    @Binding var userimgStr: String
    
    @State var showAlertAcsheenSheet: Bool = false
    
    @State var showProfileActionSheet: Bool = false
    

    var body: some View {
        
        VStack {
            
            HStack {
                
                Button(action: {
                    
                    showProfileActionSheet.toggle()
                    
                }, label: {
                    
                    Image(userimgStr)
                          .resizable()
                          .scaledToFill()
                          .frame(width: 40, height: 40)
                          .clipShape(Circle())
                          .padding(.horizontal)
                          .shadow(radius: 10)
                    
                    
                })
                .actionSheet(isPresented: $showProfileActionSheet, content: {
                    
                    ActionSheet(title: Text("New photo").font(.largeTitle), message: Text("Create New Photo"), buttons: [ActionSheet.Button.destructive(Text("Create"), action: createNewPhoto), ActionSheet.Button.cancel()])
                    
                    
                })
                
                
                
            
                   
                
                NavigationLink(destination: {
                    
                    Profile()
                    
                }, label: {
                    Text(userName)
                        .font(Font.title)
                        .foregroundColor(Color.black)
                })
                
              
                   
                
                Spacer()
                
                Button(action: {
                    
                    showAlertAcsheenSheet = true
                    
                    
                }, label: {
                    
                    Image(systemName: "ellipsis")
                        .foregroundColor(.black)
                        .padding(.trailing,20)
                        .padding()
                        //.background(Color.secondary)
                    
                })
                .frame(width: 40, height: 40)
                .actionSheet(isPresented: $showAlertAcsheenSheet, content: showActionSheett)
               
                
            }
            .padding(.bottom)
            .shadow(color: .black, radius: 5,x: 10, y: 10)
            
            
            NavigationLink(destination: {
                
              AllView(img: $userimgStr)
                
                
            }, label: {
                
                
                Image(userimgStr)
                    .resizable()
                    .scaledToFill()
                    .frame(width:UIScreen.main.bounds.width - 40,height: UIScreen.main.bounds.height / 2 - 80)
                    .padding(.horizontal, 1)
                    .clipped()
                    .cornerRadius(10)
                
            })
                
                
                
                
            
            
            
                
            
            
            
        }

        
        
        
    }
    
    
    func showActionSheett() -> ActionSheet {
      
        let unflowbtn: ActionSheet.Button = ActionSheet.Button.destructive(Text("Unflllow"), action: unfllowfunc)
        
        let reportbtn = ActionSheet.Button.default(Text("Report"), action: reportfunc)
        
        let cbtn = ActionSheet.Button.cancel()
        
        
        let actionSheet = ActionSheet(title: Text(""), message: nil, buttons: [unflowbtn,reportbtn,cbtn])
        
        
        return actionSheet
        
        
    }
    
    func unfllowfunc() {
        
        
        
        
    }
    
    func reportfunc() {
        
        
        
    }
    
    
    func createNewPhoto() {
        
        
        
        
    }
    
    
    
}



struct Profile: View {
    
    
    var body: some View {
        
        Text("ProfileView")
            .navigationBarTitle(Text("Profile View"))
        
    }
}


struct AllView:  View {
    
   @Binding var img: String
    
    
    var body: some View {
        
        ZStack {
        
           Color.secondary
        
        
                Image(img)
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
                .padding(.horizontal,20)
                .shadow(color: Color.black,radius: 10,x: 10,y: 10)
        
        }
        .navigationTitle("Image")
        
        
    }
    
    
}








struct ActionSheetsBootcamp_Previews: PreviewProvider {
    
   
    
    static var previews: some View {
        InstaList()
        //CellInstaView()
    }
}
