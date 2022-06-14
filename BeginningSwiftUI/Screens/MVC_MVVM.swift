//
//  ModulVIewBootcamp2.swift
//  BeginningSwiftUI
//
//  Created by Macservis on 04/06/22.
//

import SwiftUI


//MARK:   MVC







//MARK: Modul

struct UserrModal_MVC: Identifiable {
    
    let id = UUID()
    
    let name: String
    
    let image: String
    
    let nic: String
    
    let followers: Int
    
    let checkmark: Bool
    
}


//MARK: VC

struct ViewControler_MVC: View {
    
    @State var users: [UserrModal_MVC] = []
    
    @State var  isLoading: Bool = false
    
    
    var body: some View {
        
        NavigationView{
            
            List {
                
                if isLoading {
                   
                    ProgressView()
                    
                }
                else
                {
                    
                    
                    ForEach(users) { user in
                        
                        HStack {
                            
                            Image(user.image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading) {
                                
                                Text(user.name)
                                    .font(.headline)
                                
                                
                                Text("@\(user.nic)")
                                    .foregroundColor(.gray)
                                    .font(.caption)
                                
                            }
                            
                            Spacer()
                            
                            if user.checkmark {
                                
                                Image(systemName: "checkmark.seal.fill")
                                    .foregroundColor(.blue)
                                
                            }
                            
                            VStack {
                                
                                Text("\(user.followers)")
                                    .font(.headline)
                                
                                Text("followers")
                                    .foregroundColor(SwiftUI.Color.gray)
                                    .font(.caption)
                                
                            }
                            
                        }
                        
                    }//FOREACH
                    .onDelete(perform: removeUser)
                    
                    
                }
                 
            }//LIST
            .navigationTitle("Instagram")
            .onAppear {
                startFuncTion()
            }
            
            
        }//NAVV
    }//BODY
    
    

//
//    init() {
//
//        startFuncTion()
//
//    }
//
    
    
    //MARK: Function
    
    func startFuncTion() {
        
        isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            
            users.append( UserrModal_MVC(name: "Samandar", image: "0", nic: "samandar_0002", followers: 1200, checkmark: true))
            users.append( UserrModal_MVC(name: "Samandar", image: "0", nic: "samandar_0002", followers: 1200, checkmark: true))
            users.append( UserrModal_MVC(name: "Samandar", image: "0", nic: "samandar_0002", followers: 1200, checkmark: true))
            users.append( UserrModal_MVC(name: "Samandar", image: "0", nic: "samandar_0002", followers: 1200, checkmark: true))
            users.append( UserrModal_MVC(name: "Samandar", image: "0", nic: "samandar_0002", followers: 1200, checkmark: true))
            users.append( UserrModal_MVC(name: "Samandar", image: "0", nic: "samandar_0002", followers: 1200, checkmark: true))
            users.append( UserrModal_MVC(name: "Samandar", image: "0", nic: "samandar_0002", followers: 1200, checkmark: true))
            
            isLoading = false
            
        })
        
        
    }
    
    func removeUser(indexSet: IndexSet) {
        
        users.remove(atOffsets: indexSet)
        
    }
    
    
    
}































//MARK: MVVM




//MARK: Modul


struct Modul_MVVM: Identifiable {
    
    var id = UUID()
    
    let name: String
    
    let image: String
    
    let nic: String
    
    let followers: Int
    
    let chekmark: Bool
    
}




//MARK: View

struct View_MVVM: View {
    
    //State Object huddi statega o'xshaydi
    
    @StateObject var viewModel: ViewModul_MVVM = ViewModul_MVVM()
    
    
    //Observedobject huddi Bindingga o'xshaydi
    
    
    // @ObservedObject var viewModel: ViewModul_MVVM = ViewModul_MVVM()
    
   
    
    var body: some View {
        
        NavigationView {
            
            List {
                
                if viewModel.isLoading { //isLoading
                    
                    ProgressView()
                    
                }
                else
                {
                    
                    ForEach(viewModel.users) { user in
                        
                        
                        HStack {
                            
                            Image(user.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading) {
                                
                                Text(user.name)
                                    .font(SwiftUI.Font.headline)
                                
                                Text(user.nic)
                                    .foregroundColor(SwiftUI.Color.gray)
                                    .font(.caption)
                                
                            }
                            
                            Spacer()
                            
                            if user.chekmark {
                               Image(systemName: "checkmark.seal.fill")
                                    .foregroundColor(.blue)
                                    .transition(SwiftUI.AnyTransition.opacity.animation(SwiftUI.Animation.default))
                            }
                            
                            
                            VStack {
                                Text("\(user.followers)")
                                    .font(.headline)
                                
                                Text("followers")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            
                            
                        }

                    }//FOREACH
                    .onDelete(perform: viewModel.deleteuser)
                    
                    
                }

                
            }//LIST
            .navigationTitle("Instagram")
            //.onAppear(perform: viewModel.startFunction)
            .navigationBarItems(trailing:
                NavigationLink(destination: {
                      SecondScreenEnviorement(viewModel: viewModel)
               }, label: {
                Text("Next")
               })
            
            )
            
        }//NAVV
        
        
        
    }//BODY
    
    
    
}


//Bu ham view shunchaki ikkinchi view buni o'chirib tashlasa ham zarari yo'q bunga tegishli viewModul hali yozilmagan

struct SecondScreenEnviorement: View{
    
    @ObservedObject var viewModel: ViewModul_MVVM
    
    
    var body: some View {
        
        List {
        
        ForEach(viewModel.users) { user in
            Text(user.name)
        }
        .onDelete(perform: viewModel.deleteuser)
        
        }
        
    }
    
}





//MARK: ViewModul


class ViewModul_MVVM: ObservableObject {
    
    @Published var users: [Modul_MVVM] = []
    
    @Published var isLoading: Bool = false
    
    
    
    
    
    init() {
        
        startFunction()
        
    }
    
    
    func startFunction() {
        
        isLoading = true
        
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3, execute: { [self] in
            
            
            users.append( Modul_MVVM(name: "Samandar", image: "20", nic: "samandar_0002", followers: 1200, chekmark: true))
            users.append( Modul_MVVM(name: "Samandar", image: "20", nic: "samandar_0002", followers: 1200, chekmark: true))

            users.append( Modul_MVVM(name: "Samandar", image: "20", nic: "samandar_0002", followers: 1200, chekmark: true))

            users.append( Modul_MVVM(name: "Samandar", image: "20", nic: "samandar_0002", followers: 1200, chekmark: true))
            
            isLoading = false
        })
        
       

    }
    
    
    func deleteuser(indexSet: IndexSet) {
        
        users.remove(atOffsets: indexSet)
        
    }
    
    
}







//MARK: Preview

struct ModulVIewBootcamp2_Previews: PreviewProvider {
    static var previews: some View {
        View_MVVM()
    }
}








