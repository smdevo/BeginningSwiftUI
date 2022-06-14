//
//  PickerBootcamp.swift
//  BeginningSwiftUI
//
//  Created by Macservis on 25/05/22.
//

import SwiftUI

struct PickerBootcamp: View {
    
    @State var selection: Int = 1
    
  
    
    
    
    var body: some View {
      
       
        NavigationView {
            
            ScrollView {
                
                VStack {
            
                    
                    Text("Age: \(selection)")
                    
                    
                    Picker(selection: $selection, label: Text("PickerSelected"), content: {
                        
                        
                        Text("One").tag(1)
                        Text("Two").tag(2)
                        Text("Three").tag(3)
                        Text("Four").tag(4)
                        Text("Five").tag(5)
                        Text("Six").tag(6)
                        Text("Seven").tag(7)
                        Text("Eight").tag(8)
                        
                        
                    })//picker
                        .padding(.horizontal)
                        .pickerStyle(MenuPickerStyle())
                        
                        

                    
                 
                    
                    
                }//VStack
                
                
            }//ScrollView
            .navigationTitle("Picker")
            
            
        }//NavigationView
        
        
    }//body
    
    
    
}

struct Person: Hashable {
    
    let id = UUID()
    var name: String
    var age: Int
    var image: String
     
    
    
}

extension Person {
    
    static var none: Person = Person(name: "", age: 0, image: "20")
    
}


struct Persons {
    
   static var persons: [Person] = [

        Person(name: "Humoyun", age: 23, image: "1"),
        Person(name: "Samandar", age: 20, image: "2"),
        Person(name: "Akbarjon", age: 19, image: "3"),
        Person(name: "Sardorbek", age: 19, image: "4"),
        Person(name: "Rustambek", age: 20, image: "5"),
        Person(name: "Hasanboy", age: 21, image: "6"),
        Person(name: "Ahror", age: 20, image: "7"),
        Person(name: "Amirqul", age: 19, image: "8"),
        Person(name: "Shahboz", age: 19, image: "9"),
        Person(name: "Shahzod", age: 20, image: "10"),
        Person(name: "G'aybulla", age: 20, image: "11"),
        Person(name: "Muhiddin", age: 20, image: "12"),
        Person(name: "Avazbek", age: 20, image: "13"),
        Person(name: "Xurshid", age: 20, image: "14")
    ]
    
    
}



struct PickerBootcamp2: View {
    
    
    
    
    
    @State var selected: Person = Person.none
    
    @State var persons: [Person] = Persons.persons
    
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
                
                
                VStack {
                    
                    HStack {
                        
                        
                        Text("Picker: ")
                        
                        Text("\(selected.name)")
                        
                        
                    }
                    .font(.title)
                    
                    
                    Picker(selection: $selected,
                           content: {
                        
                        ForEach(persons, id: \.id,content: { person in
                            
                            Text("\(person.name)").tag(person)
                                
                            
                            
                        })
                        
                        
                    },
                           label: {
                        
                        Text("Picker Selected")
                            
                        
                    })
                    
                 .pickerStyle(InlinePickerStyle())
                    
                    
                    
                    VStack {
                        
                    
                        Image("\(selected.image)")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                            .frame(height:280)
                        
                        
                        
                        Text("Name:  \(selected.name)")
                            .font(.title)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .padding()
                            .background(Color.gray.cornerRadius(10))
                            
                        Text("Age:  \(selected.age)")
                            .font(.title)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .padding()
                            .background(Color.gray.cornerRadius(10))
   
                    }
                    .shadow(color: .black, radius: 10, x: 10, y: 10)
                    
                    
                    
                    
                }//VStack
                .padding()
               
                
            }//ScrollView
            .navigationTitle("PickerView")
            .navigationBarTitleDisplayMode(.inline)
            
            
        }//NavigationView
        
        
    }//body
    
    
}





struct PickerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        PickerBootcamp2()
    }
}







