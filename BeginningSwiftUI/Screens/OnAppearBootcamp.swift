//
//  OnAppearBootcamp.swift
//  BeginningSwiftUI
//
//  Created by Macservis on 28/05/22.
//

import SwiftUI

struct OnAppearBootcamp: View {
    
    @State var showThridView: Bool = false
    
    
    
    var body: some View {
        
        NavigationView {
            ZStack {
                
                Color.green.edgesIgnoringSafeArea(.all)
                
                
                VStack {//VSTACK
                    
                    Text("First View")
                        .font(.largeTitle)
                    
                    
                    Button(action: {
                        
                        showThridView.toggle()
                        
                    }, label: {
                        
                       Text("Click Me")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding()
                            .padding(.horizontal)
                            .background(Color.blue.cornerRadius(10))
                    })
                    
                }//VSTSCK
                
            }//ZSTACK
            .navigationTitle("First View")
            .navigationBarItems(trailing:
            
                     NavigationLink(destination: {
                     SecondApperView()
                     }, label: {
                       Text("Second")
                     })
            
            )
            .onAppear(perform: {
                    
                    print("On Apper: First")
                    
                })
            .onDisappear(perform: {
                    
                    print("On DisApper: First")
                })
              
            
        }//NAVV
        .sheet(isPresented: $showThridView, content: {
            ThridApperView()
        })
        
    }//BODY
}




struct SecondApperView: View{
    
    @Environment(\.presentationMode) var modee
    
    
    
    var body: some View {
        
        ZStack {
            
            Color.red.ignoresSafeArea()

            Text("Second View")
               
            
            
        }//ZSTACK
        .navigationTitle("Second View")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                                Button(action: {
            modee.wrappedValue.dismiss()
                               }, label: {
                                Text("Back")
                               })
                                
        )
        .onAppear(perform: {
            
            print("On apper: Second")
            
        })
        .onDisappear(perform: {
            
            print("on disApper: Second")
            
        })
      
        
        
        
    }//BODY
    
}

struct ThridApperView: View {
    
    
    @Environment(\.presentationMode) var modee
    
    var body: some View {
        
        ZStack {
            
            Color.purple.edgesIgnoringSafeArea(.all)
            
           
            
            VStack {

                Button {
                    modee.wrappedValue.dismiss()
                } label: {
                    Text("Back")
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                }

                Spacer()
                
                Text("Thrid View")
                
                Spacer()
                
            }
            
            
          
            
        }
            .navigationTitle("Thrid View")
            .onAppear(perform: {
                
                print("On Apper: Thrid")
            })
            .onDisappear(perform: {
                
                print("On Dis Apper: Thrid")
            })
    }
    
}











struct CustomApperView: View {
    
    @State var apperViews: [String] = []
    
    
    
    var body: some View {
        
       
            
            ScrollView {
                
                LazyVStack(spacing: 30) {
                    
                    
                    ForEach(0 ..< 100) { i in

                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.green)
                            .frame(height: 200)
                            .overlay(
                                Text("\(i)")
                                    .foregroundColor(.primary)
                                    .font(.largeTitle)
                            )
                            .onAppear(perform: {
                                
                                apperViews.append(" \(i),")
                                
                                print(apperViews)
                                print("\(i)")
                                
                            })
                            .onDisappear(perform: {
                                apperViews.removeFirst()
                                print("DisApper \(i)")
                            })
                        
                    }
                    
                
            }//VSTACK
                .padding()
                
        }//SCrollView


    }//BODY
    
}

struct CustomApperView2: View {
    
    @State var selectedText: String = "My Text"
    
    @State var count: Int = 0
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {


                LazyVStack {


                    Text(selectedText)
                        .onAppear(perform: {

                            DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {

                                selectedText = "This is Text"

                            })

                        })

                    ForEach(0..<100) { i in
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.green)
                            .frame(height: 300)
                            .onAppear {
                                count += 1
                            }
                            .onDisappear {
                                count -= 1
                            }
                    }





                }//LAZYVS
                .padding()


            }//SCROLLV
            .navigationTitle("Apper VIvew: \(count)")
            
            }//LIST
            .navigationTitle("Apper VIvew: \(count)")
            
        }//NAVV
        
 
    }
    



struct CustomApperView3: View {
    
    @State var selectedText: String = "My Text"
    
    @State var count: Int = 0
    
    var body: some View {
        
        NavigationView {
            

            
            List(0 ..< 100) { i in
                
                Text("\(i)")
                    .onAppear {
                        count += 1
                    }
                    .onDisappear {
                        count -= 1
                    }
                
            }//LIST
            .navigationTitle("Apper VIvew: \(count)")
            
        }//NAVV
        
 
    }
    
}





struct OnAppearBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CustomApperView3()
    }
}
