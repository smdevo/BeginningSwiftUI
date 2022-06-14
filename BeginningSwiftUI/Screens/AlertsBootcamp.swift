//
//  AlertsBootcamp.swift
//  BeginningSwiftUI
//
//  Created by Macservis on 23/05/22.
//

import SwiftUI

struct AlertsBootcamp: View {
    
    
    @State var background: Color = Color.blue
    
    
    @State var showAlert: Bool = false
    
    
    @State var errorText: String = ""
    
    @State var errorTitle: String = ""
    
    
    
    var body: some View {
    
        ZStack {
            
          
            background.edgesIgnoringSafeArea(.all)
            
            
            
            VStack {
                
                
                Button(action: {
                    
                    errorText = "This is not upload😞"
                    
                    errorTitle = "Reversed please"
                    
                    showAlert.toggle()
                    
                }, label: {
                    
                    
                    Text("No Database")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                    
                    
                })
                
                
                
                
                Button(action: {
                   
                    errorText = "Congrutulation🥳"
                    
                    errorTitle = "This is greate"
                    
                    showAlert.toggle()
                    
                }, label: {
                    
                    Text("Database")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                    
                })
                .alert(isPresented: $showAlert, content: universalAlert)
                
                
                
            }
            
            
            
           
            
        }
        
        
       
        
        
    }
    
    
    func universalAlert() -> Alert {
        
        Alert(title: Text(errorText), message: Text(errorTitle), dismissButton: Alert.Button.default(Text("OK")))
        
        
    }
    
    
    
    
    
    func alertView() -> Alert {
        
        Alert(title: Text("Error"), message: Text("Sure error"), primaryButton: Alert.Button.destructive(Text("Delete"), action: {
            
            background = .secondary
            
        }), secondaryButton: Alert.Button.cancel())
        
        
    }
}


struct Photo {
    
    var img: Image
    var bool: Bool
    
    
}







struct HomeView: View {
    
    @State var photos: [Photo] = [
        Photo(img: Image("1"), bool: true),
        Photo(img: Image("2"), bool: false),
        Photo(img: Image("3"), bool: true),
        Photo(img: Image("4"), bool: true),
        Photo(img: Image("5"), bool: true),
        Photo(img: Image("6"), bool: false),
        Photo(img: Image("7"), bool: true),
        Photo(img: Image("8"), bool: true),
        Photo(img: Image("9"), bool: false),
        Photo(img: Image("10"), bool: true),
        Photo(img: Image("11"), bool: false),
        Photo(img: Image("12"), bool: false),
        Photo(img: Image("13"), bool: true),
        Photo(img: Image("14"), bool: true),
        Photo(img: Image("15"), bool: true),
        Photo(img: Image("16"), bool: false),
        Photo(img: Image("17"), bool: true),
        Photo(img: Image("18"), bool: true),
        Photo(img: Image("19"), bool: false),
        Photo(img: Image("20"), bool: true),
    ]
    
    
    @State var showAlert: Bool = false
    
    @State var deleteBool: Bool = false

    @State var position: Int = 0
    
    @State var alertText: String = ""
    
    @State var alertTitle: String = ""
    
    
    
    
    var body: some View {
        
        
        NavigationView {
        
        
            List {
                
                
                ForEach(0 ..< photos.count) { i in
                    
                    HStack {
                   
                    photos[i].img
                        .resizable()
                        .scaledToFill()
                        .frame(height: 50)
                        .clipped()
                        .cornerRadius(10)
                        .shadow(radius: 10)
                    
                        Button(action: {
                            
                            position = i
                            
                            showAlert.toggle()
                            
  
                        }, label: {
                            
                            Image(systemName: "trash.fill")
                                .foregroundColor(Color.red)
                            
                        })
                        
                        
                    }
                    
                }
                .onDelete { indeXSet in
                     if deleteBool {

                         photos.remove(atOffsets: indeXSet)

                     }
                 }
                .alert(isPresented: $showAlert, content: {
                    
                    photos[position].bool ? Alert(title: Text("Delete"), message: Text("Really delete it"), primaryButton: .destructive(Text("Delete"), action: {
                        
                        deleteBool.toggle()

                    }), secondaryButton: .cancel()) :  Alert(title: Text("Error"), message: Text("There is no way to delete this image"), dismissButton: .default(Text("OK")))
                    
                    
                })
             
                
                
                
                
                
                
                
            }
            .navigationBarTitle(Text("Home Page"))
            
            
        
            
            
        }
        
        
    }
    
    
    
    
    
    
    
    
}


struct SeconDView: View {
    
    @State var background: Color = Color.blue
    
    
    @State var changebackground: Bool = false
    
    
    var body: some View {
        
        
        HomeView()
        
        
  
        
        
        
    }
    
    
    func HomeView() -> some View {
        
        
       
        
        let navView = NavigationView(content: {
            
            ZStack {
                
               
                
                Color.gray.edgesIgnoringSafeArea(.top)
                
               
                
                
                
                
                background.edgesIgnoringSafeArea(.bottom)
                
                
            
                
                
                
                
                
                Button(action: {
                    
                    
                    changebackground = true
                    
                    
                }, label: {
                  
                    
                    
                    Text("Press Me")
                        .padding(.horizontal)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                    
                    
                })
                .alert(isPresented: $changebackground, content: {
                    
                    
                    Alert(title: Text("Hello"), message: Text("New alert"), dismissButton: Alert.Button.cancel())
                    
                }
                
                )
            }
            .navigationTitle("Home Page")
            .navigationBarTitleDisplayMode(.inline)
            
            
            
            
        })
        
        
        
        
        return navView
    }
    
    
    
}









struct AlertsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SeconDView()
    }
}
