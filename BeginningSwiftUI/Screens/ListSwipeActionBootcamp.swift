//
//  ListSwipeActionBootcamp.swift
//  BeginningSwiftUI
//
//  Created by Macservis on 08/06/22.
//

import SwiftUI

struct ListSwipeActionBootcamp: View {
    
    @State var users: [String] = [
    "Samandar", "Akbarjon","Sardorbek","Rustambek"
    ]
    
    
    var body: some View {
        
        
        List {
            
            ForEach(users,id: \.self) {
                
                Text($0)
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "trash")
                        }
                        .tint(.red)
                        
                        Button {
                            
                        } label: {
                            Text("Save")
                        }
                        .tint(.blue)
                        
                       

                    }
                    .swipeActions(edge: .leading, allowsFullSwipe: false) {
                        Button {
                            
                        } label: {
                            Text("Arxiv")
                        }

                    }
                
        }
        //    .onDelete(perform: ondelete)
    }
}

    
    
    func ondelete(indexSet: IndexSet) {
        
       // users.remove(atOffsets: indexSet)
        
    }
}



struct ListSwipeActionBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ListSwipeActionBootcamp()
    }
}
