//
//  ViewModalBootcamp.swift
//  BeginningSwiftUI
//
//  Created by Macservis on 30/05/22.
//

import SwiftUI



//MARK: Model

struct FruitModel: Identifiable {
    
    var id = UUID()
    
    let name: String
    
    let count: Int
    
}



//MARK: Modul

class FruitsObjectViewColntrol: ObservableObject {
    
  @Published  var classfruits: [FruitModel] = []
    
    @Published var isLoading: Bool = false
    
    
    
    
    
    func startLoad() {
        isLoading = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [self] in
            
            classfruits.append(FruitModel(name: "Apple", count: 4))
            classfruits.append(FruitModel(name: "Orange", count: 3))
            classfruits.append(FruitModel(name: "Banana", count: 9))
            classfruits.append(FruitModel(name: "Peach", count: 100))
            classfruits.append(FruitModel(name: "Watermelon", count: 10))
            
            isLoading = false
        }
        
       
        
    }
    
    
    
    
    
    func deletefruit(indexSet :IndexSet) {
        
        classfruits.remove(atOffsets: indexSet)
        
    }
    
    
    
    
    
}






//MARK: View
struct ViewModalBootcamp: View {
    
    //@State var fruits: [FruitModel] = []
    
    @ObservedObject var controllFruitViewObj: FruitsObjectViewColntrol = FruitsObjectViewColntrol()
    
    
    var body: some View {
       
        NavigationView{
            
            
            ZStack {
                
                if controllFruitViewObj.isLoading {
                    
                    ProgressView()
                    
                }
                else {
                    
                    List {
                        
                        ForEach(controllFruitViewObj.classfruits) { fruit in
                            
                            HStack {
                                
                                Text("\(fruit.count)")
                                    .frame(width: 30)
                                
                                Text("\(fruit.name)")
                                
                            }
                        }
                        .onDelete(perform: controllFruitViewObj.deletefruit)
                        
                        
                    }//LIST
                    //.listStyle(GroupedListStyle())
                    
                    
                }
                
                
                
            }//ZStack
            .navigationTitle("Home")
            .onAppear{
                
                controllFruitViewObj.startLoad()
                
            }
            
        }//NAVV
        
        
    }//BODY
    
    
//    func srartLoad() {
//
//        fruits.append(FruitModel(name: "Apple", count: 4))
//        fruits.append(FruitModel(name: "Orange", count: 3))
//        fruits.append(FruitModel(name: "Banana", count: 9))
//        fruits.append(FruitModel(name: "Peach", count: 100))
//
//    }
//
//
//    func deleteFruit(indexSet: IndexSet) {
//
//         fruits.remove(atOffsets: indexSet)
//
//    }
    
    
}

struct ViewModalBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ControllerCustom()
    }
}




//Modul
struct Persoon: Identifiable {
    var id = UUID()
    var image: String
    var name: String
    var age: String
    
}


struct ModullUsers {
    
    var userd: [Person] = [
    Person(name: "Samandar", age: 20, image: "1"),
    
    Person(name: "Akbarjon", age: 19, image: "2"),
    
    Person(name: "Sardorbek", age: 19, image: "3"),
    
    Person(name: "Rustambek", age: 19, image: "4")
    
    ]
    
    
    
    
}






//View
struct ViewDisplay: View {
    
    var users: ModullUsers
    
    var body: some View {
        
        TabView {
            
            ForEach(users.userd,id: \.id) { user in
                
                
                VStack {
                    
                    Image(user.image)
                        .resizable()
                        .scaledToFit()
                    
                    Text(user.name)
                        .font(.largeTitle)
                    
                    Text("\(user.age)")
                        .font(.largeTitle)
                    
                    
                }
                
                
            }
            
            
        }
        .tabViewStyle(PageTabViewStyle())
       
    }
    
    
}



struct ControllerCustom: View {
    
    var modul: ModullUsers = ModullUsers()
    
    var vieww: ViewDisplay = ViewDisplay(users: ModullUsers())
    

    var body: some View {
        
        vieww
        
    }
    
    
    init() {
        
        
        
    }
    
}




