//
//  ListBootcamp2.swift
//  BeginningSwiftUI
//
//  Created by Macservis on 21/05/22.
//

import SwiftUI

struct ListBootcamp2: View {
    
    
    @State var images:[String] = [
     "1","2","3","4","5","6","7","8","9","10","12","13","14","15","16","17","18","19","20"
    ]
    
    
    var body: some View {
        
        
        
       navView
            
        
    }

    var navView: some View {
      
        NavigationView {
            
           list
                .navigationTitle("Home Page")
            
        }
        
        
        
    }
    
    
    
    
    var list: some View {
        
        List{
            
            Section(content: { contentSection1 }, header: {
                
                Text("Numbers")
                
            })
            
           
            Section(content: contentViewSection1, header: {
                
                Text("Numeric Function")
                
            })
            
            
            
            
        }
       
        
        
        
    }
    
    
    func contentViewSection1() -> some View {
      
       
        return ForEach(0..<10) { i in
            
            Text("Function \(i)")
            
        }
        
        
    }
    
    
    
    
    var contentSection1: some View {
        
        ForEach(0..<10) { i in
            
            Text("\(i)")
            
        }
        
        
    }
    
    
    
    
    
    
}





















struct ListBootcamp3: View {
    
    @State var fruits: [String] = [
        "banana", "apple", "peach","ananas"
    ]
    @State var vegetables: [String] = [
    "potato", "onion", "carrot", "cucumber"
    ]
    
    
    var body: some View {
  
        NavigationView(content: {
            
            List(content: {
                
             
                Section(content: section1, header: {Text("Fruits")})
                
                
                Section(content: section2, header: {Text("Vegetables")})
                
                
            })
            .navigationTitle("First Page")
            
            
        })
        
    }
    
    
    
    
    
    func section1() -> some View {
        
        ForEach(fruits, id: \.self) { fruit in
            
            Text("\(fruit.capitalized)")
            
        }
        
        
    }
    
    
    func section2() -> some View {
        
        ForEach(vegetables, id: \.self) { vegetable in
            
            Text("\(vegetable.capitalized)")
            
            
        }
        
        
    }
    
}


struct ListBootcamp4: View {
    
    let viewarrays = ListBootcamp3()
    
    var body: some View {
        
        NavigationView {
            
            List {
                
                Section {
                    ForEach(0..<viewarrays.fruits.count) { i in
                        
                        Text(viewarrays.fruits[i])
                        
                    }
                    .onDelete(perform: deleteS1)
                    .onMove { indexSet, next in
                        viewarrays.fruits.move(fromOffsets: indexSet, toOffset: next)
                    }
                } header: {
                    Text("Fruits")
                }
                
                
                
                
                
                
                Section(content: {
                    
                    ForEach(0 ..< viewarrays.vegetables.count) { i in
                        
                        Text("\(viewarrays.vegetables[i])")
                        
                    }
                    .onDelete { IndexSet in
                        viewarrays.vegetables.remove(atOffsets: IndexSet)
                    }
                    .onMove { indexSet, next in
                        viewarrays.vegetables.move(fromOffsets: indexSet, toOffset: next)
                    }
                   
                    
                    
                }, header: {
                    
                    Text("Vegetables")
                })
                
                
                
            }
            .navigationTitle("Home Page")
            .navigationBarItems(leading: EditButton())
            
            
            
        }
        
        
    }
    
    
    func deleteS1(indexSet: IndexSet) {
        
        viewarrays.fruits.remove(atOffsets: indexSet)
        
    }
    
    
    
    
    
}



struct ListBootcamp5: View {
    
    
    var body: some View {
        
        NavigationView {
            
            List(0..<30) { i in
                Text("\(i)")
            }
            .navigationTitle("Home Page")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: EditButton())
            
        }
        
        
    }
    
    
    
}



   


   

struct ListBootcamp2_Previews: PreviewProvider {
    static var previews: some View {
        ListBootcamp5()
    }
}
