//
//  NavigationView_link.swift
//  BeginningSwiftUI
//
//  Created by Macservis on 18/05/22.
//

import SwiftUI

struct NavigationView_link: View {
    
    @State var array = ["1","2","3","4","5","6","7","8","9","10","12","13","14",    "15","16","17","18","19","20","0"]
    @State var newChannelBool: Bool = false
    
    
    var body: some View {
       
        NavigationView {
            
            ScrollView {
                
                ForEach(0..<array.count) { i  in
                    
                    CellView(imageStr: array[i])
                        .padding()
                        .frame(height: 150)
                        .background(Color.white)
                        .cornerRadius(25)
                        .shadow(color: .black,radius: 10,x: 10,y: 10)
                        .padding([.trailing,.leading,.bottom],20)
                        
                        
                    
                    
                }
                
                
                
            }
            .navigationTitle("Chatlar")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading:
                                    NavigationLink(destination: {
                TahrirView()
            }, label: {
                Text("Tahrir")
            })
                                    , trailing:
                                    
                                    
                                    HStack {
                
                Image(systemName: "flame.fill")
               
                
                Button {
                   newChannelBool = true

                } label: {

                   Image(systemName: "note.text")

            }
            }
                                
                
//                                NavigationLink(destination: {
//                NewC_Ch_B()
//            }, label: {
//               Image(systemName: "note.text")
//            })
                                
                                
            )
            .sheet(isPresented: $newChannelBool) {
                NewC_Ch_B()
            }
//            .fullScreenCover(isPresented: $newChannelBool) {
//                NewC_Ch_B()
//            }
            
            
        }
       
        
        
    }
    
    
    
}


struct TahrirView: View {
    
    
    
    var body: some View {
        
        Text("Tahrir View")
            .navigationTitle("Tahrir Page")
        
        
        
    }
}




struct NewC_Ch_B: View {
    
    @Environment(\.presentationMode) var mode
    
    
    var body: some View {
        
        VStack {
        
            ZStack {
             
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Text("Bekor qilish")
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                
                
                Text("Yangi xabar")
                    .frame(maxWidth: .infinity)
                
                
                
            }
            .padding(.vertical, 20)
            
        
        ScrollView{
            
            VStack {
                
                ForEach(0..<10) { i in
                  
                   RoundedRectangle(cornerRadius: 25)
                        .frame(height: 150)
                        .padding()
                    
                }
                
            }
            
            
        }
            .navigationTitle("Yangi habar")
            .navigationBarItems(leading: Button(action: {
                mode.wrappedValue.dismiss()
            }, label: {
                Text("Bekor qilish")
            }))
            //.navigationBarBackButtonHidden(true)
        }
        
    }
}

















struct CellView1: View {
    
    
    
    
    var body: some View {
        
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.purple)
        
        
    }
}






struct NavigationView_link_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView_link()
    }
}
