//
//  DatePickerBootcamp.swift
//  BeginningSwiftUI
//
//  Created by Macservis on 26/05/22.
//
import Foundation
import UIKit
import SwiftUI

struct DatePickerBootcamp: View {
    
    @State var selectedDate: Date = Date()
    
    
    let startingDate: Date = Calendar.current.date(from: DateComponents(year: 2002, month: 6, day: 15, hour: 16, minute: 10, second: 10)) ?? Date()
    
    let endingDate: Date = Date()
    
    
    var body: some View {
        
        
        NavigationView {
            
            VStack {
                
//
//                DatePicker("Know date", selection: $dateselection)
//                    .datePickerStyle(
//
//
//                       // GraphicalDatePickerStyle()
//                    WheelDatePickerStyle()
//
//                    )
//                    .frame(maxWidth: .infinity)
//                    .accentColor(.red)
//                    .foregroundColor(.blue)
//                    .background(Color.gray.opacity(0.5).cornerRadius(10))
//                    .padding()
                
                
//                DatePicker("SelectionDate", selection: $dateselection, displayedComponents: [.date,.hourAndMinute])
//                    .datePickerStyle(WheelDatePickerStyle())
//                    .padding()
                
                DatePicker("Know Date", selection: $selectedDate, in: startingDate...endingDate, displayedComponents: [.date,.hourAndMinute])
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                
                
            
                
            }//VStack
            .navigationTitle("DatePicker")
            
            
        }//NavigationView
        
    }//body
}


struct UserDP {
    
    var name: String
    
  fileprivate  var passWord: String
    
    let id = UUID()
    
    var color: Color
    
    var databirthDay: Date
    
    
}


struct Userss {
    
    static let users: [UserDP] = [
    
        UserDP(name: "Samandar", passWord: "150602ST", color: Color.white, databirthDay: Calendar.current.date(from: DateComponents(year: 2002, month: 06, day: 15)) ?? Date()),
        
        
        UserDP(name: "Akbarjon", passWord: "090503AM", color: Color.blue, databirthDay: Calendar.current.date(from: DateComponents(year: 2003, month: 05, day: 09)) ?? Date()),
        
        
        UserDP(name: "Sardorbek", passWord: "020703SF", color: Color.orange, databirthDay: Calendar.current.date(from: DateComponents(year: 2003, month: 02, day: 07)) ?? Date()),
        
        
        UserDP(name: "Rustambek", passWord: "111202RI", color: Color.green, databirthDay: Calendar.current.date(from: DateComponents(year: 2002, month: 12, day: 11)) ?? Date())
        
        
        
        
    
    ]
    
    
    
}






struct CustomDatePicker: View {
    
    
    @State var users: [UserDP] = Userss.users
    
    @State var nametft: String = ""
    
    @State var password: String = ""
    
    @State var selectedColor: Color = Color.gray.opacity(0.3)
    
    @State var selectedDate: Date = Date()
    
    @State var showAlert: Bool = false
    
    @State var alertText: String = ""
    
    @State var alertTitle: String = ""
    
    var knowDate = Date()
    
    init() {
        knowDate = selectedDate
    }
    
    
    let startingDate: Date = Calendar.current.date(from: DateComponents(year: 1800, month: 01, day: 1)) ?? Date()
    
    let endDate: Date = Date()
    
    
    var body: some View {
        
        
        NavigationView {
            
            ScrollView {
                
                ZStack {
                    
                    
                    //selectedColor.edgesIgnoringSafeArea(.all)
                    
                    
                    
                    VStack {

                        Text("Your Name:")
                            .font(.title)
                            .padding(5)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.blue.opacity(0.4).cornerRadius(10))
                        
                        TextField("Name ", text: $nametft)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .font(Font.system(size: 25))
                            .padding(5)
                            .frame(maxWidth: .infinity)
                          
                        
                        
                        Text("Your Password:")
                            .font(.title)
                            .padding(5)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.blue.opacity(0.4).cornerRadius(10))
                        
                        SecureField("Password", text: $password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .font(Font.system(size: 25))
                            .padding(5)
                            .frame(maxWidth: .infinity)
                        
                        ColorPicker("Your Favorite Color", selection: $selectedColor)
                            .padding()
                            .font(.headline)
                            .background(Color.green.cornerRadius(10))
                        
                        Text("Your birthday  🥳")
                             .font(.title)
                             .padding(5)
                             .frame(maxWidth: .infinity)
                             .background(selectedColor.cornerRadius(10))

      //MARK: DataPicker
                        
                        DatePicker("Your birthday", selection: $selectedDate, in: startingDate ... endDate, displayedComponents: [.date,])
                            .padding()
                            //.background(Color.purple.opacity(0.2).cornerRadius(10))
                            //.datePickerStyle(WheelDatePickerStyle())
                           
                        
                        
                        Button(action: {
                            
                            addFunc()
                            
                        }, label: {
                            
                            
                            
                            Text("Add")
                                .font(.title)
                                .padding()
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .background(Color.blue.cornerRadius(10))
                            
                        })
                        .alert(isPresented: $showAlert, content: {
                            
                            Alert(
                                title: Text(alertText),
                                message: Text(alertTitle),
                                dismissButton: Alert.Button.default(Text("OK")))
                            
                        })
                           
                    
       
                        
                    }//VStack
                    .shadow(color: .black,radius: 10, x: 10, y: 10)
                    .navigationTitle("Added")
                    //.navigationBarTitleDisplayMode(.inline)
                    .navigationBarItems(trailing:
                                
                           NavigationLink(destination: {
                        
                        ResultDPView(users: $users, background: $selectedColor)
                        
                        
                           }, label: {
                        
                        
                            Text("Users")
    //                               .foregroundColor(.white)
    //                               .bold()
    //                               .padding(5)
    //                               .background(Color.black.cornerRadius(5))
    //                               .shadow(color: .black, radius: 5, x: 5, y: 5)
                        
                           })
                    
                    
                    )
                    .padding()
                    
                    
                    
                }//Zstack
                
                
                
            }//ScrollView
   
        }//NavigationView
        
        
    }//body
 
//MARK: functions
        
    
    func addFunc() {

        var baggs: [Baggs] = []
        
        var baggsS: [String] = []
        
        
        if nametft.isEmpty {
            
            baggs.append(.noName)
            
            baggsS.append("Name does not exist")
        }
        
        if password.isEmpty {
            
            baggs.append(.noPassword)
            baggsS.append("PassWord does not exist")
            
        }
        
        if  selectedDate == knowDate {
            
            baggs.append(.noDate)
            baggsS.append("No date has been set")
        }
        
        
        if baggs.isEmpty {
            
           alertText = "Create🥳🥳🥳"
            
           alertTitle = "successfully added"
            
           users.append(UserDP(name: nametft, passWord: password, color: selectedColor, databirthDay: selectedDate))
        } else {
            
            alertText = "Errors:🙃🙃🙃"
             
            alertTitle = """
                         
                         \(baggsS.joined(separator: ",\n\n"))
                         
                         """
        }
        
        showAlert.toggle()

        nametft = ""
    
        password = ""
    
        selectedColor = Color.gray.opacity(0.3)
    
        selectedDate = Date()
    
    }
    
//MARK:  functions

    
//MARK:  Enums
    
    enum Baggs: String {
        
        case noName, noPassword, noDate
        
    }
    
    
    
    
    
}//struct


struct ResultDPView: View {

    @Binding var users: [UserDP]
    
    
    @Binding var background: Color
    
    var formatter: DateFormatter {
        
        let formatter = DateFormatter()
        
        formatter.dateStyle = .medium
        
        return formatter
    }
    
    
    var body: some View {

        
    ScrollView {
            
          ZStack {
                
              Color.gray.opacity(0.3).edgesIgnoringSafeArea(.all)
                
                
              VStack(spacing: 5) {
                    
               
                    ForEach(users, id: \.id) { user in
                        
                        Text("Name: \(user.name)")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Password: \(user.passWord)")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Birthday: \(formatter.string(from: user.databirthDay))")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Favorite Color: \(user.color.description)")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Spacer()
                            .frame(height: 20)
                        
                    }
                    
                    
                    
                }//VStack
              .padding()
                
                
            }//ZStack

        }//ScrollView
        .navigationTitle("Users")
        
        
        
    }//body
    
    
    
}//struct











struct DatePickerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CustomDatePicker()
    }
}
