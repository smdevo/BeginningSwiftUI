//
//  TextFieldBootcamp.swift
//  BeginningSwiftUI
//
//  Created by Macservis on 24/05/22.
//

import SwiftUI

struct TextFieldBootcamp: View {
    
    @State var background: Color = Color.gray.opacity(0.3)
    
    @State var logintft: String = ""
    
    @State var phonetft: String = ""
    
    @State var passWordtft: String = ""
    
    @State var textFieldColor : Color = .secondary
    
    
    var body: some View {
        
        ZStack {
            
            background.edgesIgnoringSafeArea(.all)
            
            
            NavigationView{
                
                ZStack{
                    
                    
                    background.edgesIgnoringSafeArea(.all)
                    
                    
                    VStack(spacing: 10) {

                        
                       TextField("Loigin", text: $logintft)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(.red)
                            
                            //.accentColor(.green)
                            
                        
                        
                      SecureField("Password", text: $passWordtft)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(.red)
                        
                            
                        TextField("Phone", text: $phonetft)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.bottom,20)
                        
                        
                        
                        Button(action: {
                            
                            
                        }, label: {
                            
                            Text("Save")
                                .frame(maxWidth: .infinity)
                                .foregroundColor(Color.white)
                                .padding()
                                .background(Color.blue.cornerRadius(10))
                            
                        })
                        
                        
                        }//VStack
                    .padding()
                    .navigationTitle("Sign In Page")
                    
                    
                }//ZStack
                
                
               
                
            }//NavView
            
            
            
        }//ZStack
        
        
      
    }//body
    
    
    
}

struct TextFieldBootcamp2: View {
    
    @State var background: Color = Color.gray.opacity(0.2)
    
    
    @State var btext1: String = ""
    
    
    @State var addedTextes: [String] = []
    
    
    
    var body: some View {
        
        NavigationView{
            
            ZStack {
                
               // background.edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    
                    
                    
                    VStack(spacing: 10) {
                        
                        TextField("This is new data...",text: $btext1)
                            //.textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                            .background(Color.gray.opacity(0.4).cornerRadius(10))
                            .foregroundColor(.red)
                        
                        Button(action: actionButton1, label: {
                            
                            Text("Save")
                                .frame(maxWidth: .infinity)
                                .padding(.vertical)
                                .background(btext1.count > 2 ? Color.blue.cornerRadius(10) : Color.gray.cornerRadius(10))
                                .foregroundColor(.white)
                                .animation(SwiftUI.Animation.default)
                            
                            
                         })
                        .disabled(btext1.count > 2 ? false : true)
                        
                        if !addedTextes.isEmpty {
                            
                            
                                HStack {
                                
                                Text("history: ")
                                    .padding()
                                    .frame(width: UIScreen.main.bounds.width / 2 - 20)
                                    .background(Color.green.cornerRadius(20))
                                    .foregroundColor(.white)
                                    
                                
                                
                                Button(action: {
                                    
                                    addedTextes.removeAll()
                                    
                                    
                                }, label: {

                                    Label("Refresh", systemImage: "xmark.circle")
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(Color.red.cornerRadius(20))
                                        .foregroundColor(.white)
                                })
                               
                                
                            }
                                .transition(AnyTransition.scale.animation(Animation.default))
                                .animation(.default)
                                 
                            
                        }
                        
                        
                        
                        
                        ForEach(addedTextes, id: \.self) { text in
                            
                            Text("\(text)")
                               
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.secondary.opacity(0.6).cornerRadius(10))
                        
                        
                       Spacer()
                        
                        
                    }//VStack
                    .padding()
                    
                    
                }//ScrollView
                

            }//ZStack
            .navigationTitle("Sign In")
            
            
            
        }//NAvigationView
        
        
        
        
    }//body
    
    
    func actionButton1() {
        
     
        if btext1.count > 2 {
            
            addedTextes.append(btext1)
            
           btext1 = ""
        }
        
        
        
    }
    
    
    
    
    
    
}//struct





struct TextFieldBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldBootcamp2()
    }
}





