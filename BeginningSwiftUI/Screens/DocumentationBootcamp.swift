//
//  DocumentationBootcamp.swift
//  BeginningSwiftUI
//
//  Created by Macservis on 28/05/22.
//

import SwiftUI

struct DocumentationBootcamp: View {
    
    
    //MARK: PROPERTYS
    @State var users: [String] = [
     "Samandar", "Rustambek","Akbarjon","Sardorbek"
                                 ]
    @State var background: Color = Color.green
    
    @State var showAlert: Bool = false
    
    
    
    //MARK: BODY
    var body: some View {//BODY
       
        
        NavigationView {//NAVV
            
            ZStack {//ZSTACK
//background
                background.edgesIgnoringSafeArea(.all)
//ViewContent
                contentView
            }//ZSTACK
            .navigationTitle("Documentation")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing:
            
                                    Button(action: {
                                           showAlert.toggle()
                                         }, label: {
                                            Text("Alert")
                                                    })
            )
            .alert(isPresented: $showAlert, content: {
                alertShow(text: "This is Alert")
            })
            
            
        }//NAVV
      
    }//BODY
    
    
    
  /// This is first init View
    var contentView: some View {
        
        ScrollView {//SCROLLV
            
            VStack(spacing: 20) {//VSTACK
                
                ForEach(users, id: \.self) {//FOREACH
                                               user in
                    Text("\(user)")
                        .frame( maxWidth: .infinity, alignment: .leading)
                        .font(.largeTitle)
                        .padding()
                        .background(Color.red.cornerRadius(10))
                        .shadow(color: .black, radius: 10, x: 10, y: 10)
                    
                }//FOREACH
                 
            }//VSTACK
            .padding()
            
        }//SCROLLV
        
    }
    
    
    //MARK: FUNCTIONS
    
    
    /// This is alert functions
    ///
    ///And this is no lcose bad alert
    ///
    ///```
    ///alertShow(text: "Hi Samandar") -> Alert(title: Text("Hi Samandar"))
    ///```
    ///
    /// - Parameter text: Parametr is string type
    /// - Returns: Return is Alert
    func alertShow(text: String) -> Alert {
        
        return Alert(title: Text(text))
        
    }
    
}


//MARK: PREVIEW

struct DocumentationBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DocumentationBootcamp()
    }
}
