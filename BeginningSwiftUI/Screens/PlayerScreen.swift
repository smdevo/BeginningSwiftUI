//
//  PlayerScreen.swift
//  BeginningSwiftUI
//
//  Created by Macservis on 18/05/22.
//

import SwiftUI

struct PlayerScreen: View {
    
    @State var background: Color = Color.yellow
    
    @State var array: [String] = ["1","2","3","4","5","6","7","8","9","10","12","13","14",    "15","16","17","18","19","20","0"]
    
    @State var resultPageBool: Bool = false
    
    @State var menuViewBool: Bool = false
    
    
    
    var body: some View {
       
        ZStack {
            
          //backgroun
            background.edgesIgnoringSafeArea(.all)
            
            
            VStack(spacing: 0) {
                
                
        ZStack(alignment: .leading) {
             
           
            Button {
            
                
                menuViewBool = true
                
            } label: {
                
            Image(systemName: "filemenu.and.selection")
                .font(.largeTitle)
                .padding()
                .foregroundColor(Color.black)
            
            }
                
            Text("First Screen")
                .frame(maxWidth: .infinity)
                    //
                    
                }
        .font(.largeTitle)
        .foregroundColor(SwiftUI.Color.black)
        .padding(.top, 50)
        .background(Color.white)
        .edgesIgnoringSafeArea(.top)
        .padding(.bottom, -40)
                
                
                
                
                ScrollView {
                    
                    
                    VStack(spacing: 0) {
                        
                        ForEach(0..<array.count) { i in
                            
                           // Button {
                            
                              //  resultPageBool = true

                                
                          //  } label: {
                                
                                CellView(imageStr: array[i])
                                    .frame(height: 100)
                                    .padding()
                                    .background(Color.purple)
                                    .cornerRadius(20)
                                    .shadow(color: SwiftUI.Color.black, radius: 10, x: 10, y: 10)
                                    .padding()
                                    
                                
                          //  }
                           
                            
                        
                        
                        
                    }
                    
                    
                }
                
                
                
                
                
            }
   
        }
            
          
            
           //menuview
            
            if menuViewBool {
                
               
                ZStack {
                    
                    Color.gray.edgesIgnoringSafeArea(.all)

                    
                    
                    VStack {
                        
                       
                        HStack {
                        
                            ZStack(alignment: .leading) {
                                Button {
                                    
                                    menuViewBool = false
                                    
                                } label: {
                                    
                                    Image(systemName: "xmark")
                                    
                                }
                             
                                Text("Setting")
                                    .frame(maxWidth: .infinity)
                                
                                
                            }
                            .foregroundColor(Color.white)
                            .font(.title)
                            .padding()
                            
                            
                            
                            
                            
                        }
                        
                        
                        
                        
                        
                        
                        HStack {
                            Button("Blue") {
                                
                                background = Color.blue
                                
                            }
                            .font(SwiftUI.Font.largeTitle)
                            .padding(.leading)
                            
                            Spacer()
                        }
                        
                        HStack {
                            Button("Orange") {
                                
                                background = Color.orange
                                
                            }
                            .font(SwiftUI.Font.largeTitle)
                            .padding(.leading)
                            
                            Spacer()
                        }
                        
                        Spacer()
                        
                        
                        
                        
                    }
                    
                    
                    
                    
                }
               
                .frame(width: UIScreen.main.bounds.width / 2)
                .padding(.trailing, UIScreen.main.bounds.width / 2)
                .transition(AnyTransition.move(edge: .leading))
                .animation(.default)
                .shadow(color: .black, radius: 10, x: 10, y: 10)
                
                
                
                
            }
            
            
            
            
            
       
        }
        
        
        
        
        
        
        
        
        }
        
        
        
    }
    
    
    
        
    
    
    




struct  ResultScreen: View {

    
    @State var imageStr: String
    
    @Environment(\.presentationMode) var modedismis
    
    var body: some View {

        ZStack {
        
        
        //background
        
        
        
        
        
        Color.green.edgesIgnoringSafeArea(.all)
        
        
        VStack {
            
            ZStack {
            
                Button {
                
                    modedismis.wrappedValue.dismiss()
                    
                    
                } label: {
                    
            Image(systemName: "xmark")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                
            }
                    
                    
            Text("Result Screen")
                
                

            }
            .font(.largeTitle)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding(.top, 50)
            .padding(.bottom)
            .background(Color.gray)
            .edgesIgnoringSafeArea(.top)
            
            
            
          Spacer()
            
            
         Image(imageStr)
                .resizable()
                .scaledToFill()
                .padding(.horizontal, 30)
                .frame(width: UIScreen.main.bounds.width - 60)
                .frame(height: UIScreen.main.bounds.height / 2)
                .cornerRadius(10)
                //.padding(.horizontal, 10)
               
                .clipped()
                //.padding(.all, 30)
               
                .shadow(color: .black, radius: 10, x: 10, y: 10)
                
                
              Spacer()
                
            Text(imageStr)
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding(.horizontal)
            
            
            
            Spacer()
            
            
        }
        
        }


    }



}









struct CellView: View {
    
    @State var imageStr: String
    
    @State var newPageBool: Bool = false
    
    
    var body: some View {
        
        
        Button {

            newPageBool = true
            
            
        } label: {
            
            HStack {
                
               Image(imageStr)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100,height: 100)
                    .clipped()
                    .cornerRadius(10)
                    .shadow(color: .black, radius: 10, x: 10, y: 10)
                    
                    
                Spacer()
                
                Text(imageStr)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.trailing)
                    .shadow(color: .black, radius: 10, x: 10, y: 10)
                
                
                Spacer()
                
                
            }
        }
        .sheet(isPresented: $newPageBool) {
            ResultScreen(imageStr: imageStr)
        }
        
        
        
      
       
        
        
        
        
    }
    
    
}




struct PlayerScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        
      
            PlayerScreen()
          
            
     //ResultScreen(imageStr: "20")
        
       
    }
}
