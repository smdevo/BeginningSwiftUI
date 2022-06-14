//
//  EnvironmentObjBootcamp.swift
//  BeginningSwiftUI
//
//  Created by Macservis on 06/06/22.
//

import SwiftUI

//MARK: Modul

struct DeviceEnvironment: Identifiable {
   
    var id  = UUID()
    var name: String
    var summa: Int
    
}


//MARK: ViewModul

class ViewModulEnvironment: ObservableObject {
    
   @Published var devices: [DeviceEnvironment] = []
 
    
    
    
    
    init() {
        
       addDevice()
        
        
    }
    
    
    
    func addDevice() {
        
        devices.append(
            contentsOf:
                [
                    DeviceEnvironment(name: "Macbook", summa: 5000),
                    DeviceEnvironment(name: "Iphone", summa: 1300),
                    DeviceEnvironment(name: "Ipad", summa: 1700),
                    DeviceEnvironment(name: "Ipod", summa: 300)
                ]
        )
        
    }
    
    
    func deleteDevice(indexSet: IndexSet) {
        
        devices.remove(atOffsets: indexSet)
        
    }
    
    
}




//MARK: View

struct ContentViewEnvironment: View {
    
    @StateObject var viewModul: ViewModulEnvironment = ViewModulEnvironment()
    
    
    var body: some View {
        
        NavigationView {
            
            List {
                
                ForEach(viewModul.devices, id: \.id) { device in
                    NavigationLink(destination: {
                        
                        SecondScreenEnvironment(selectedPr: device.name)
                        
                    }, label: {
                        
                        Text(device.name)
                        
                    })
                }
                .onDelete(perform: viewModul.deleteDevice)
                
                
            }
            .navigationTitle("Apple devices")
            
            
        }
        .environmentObject(viewModul)
        
    }
}


struct SecondScreenEnvironment: View {
    
   // @ObservedObject var viewModul2: ViewModulEnvironment
    
    var selectedPr: String
    
    
    var body: some View {
        
        
        ZStack {
            //background
            
            Color.green.edgesIgnoringSafeArea(.all)
            
            
            //foreground
            VStack {
                
                
                NavigationLink(destination: {
                    
                    FinalScreenEnvironment()
                    
                }, label: {
                    
                    Text(selectedPr)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding()
                        .padding(.horizontal)
                        .background(Color.blue.cornerRadius(10))
                })
                
                
            }
            
        }
        .navigationTitle("Second")
        
    }
}


struct FinalScreenEnvironment: View {
    
    //@ObservedObject var viewModul3: ViewModulEnvironment
    
    @EnvironmentObject var viewModull: ViewModulEnvironment
    
    var body: some View {
        
        List {
            
           
                
            ForEach(viewModull.devices, id: \.id) { device in
                    HStack {
                        
                        Text(device.name)
                            .padding(.leading)
                        
                        Spacer()
                        
                        Text("\(device.summa)")
                            .padding(.trailing)
                        
                        
                    }
                }//FOREACH
            .onDelete(perform: viewModull.deleteDevice)
                
           
            
            
        }//LIST
        .navigationTitle("Final View")
        
    }
    
    
}


struct EnvironmentObjBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewEnvironment()
    }
}
