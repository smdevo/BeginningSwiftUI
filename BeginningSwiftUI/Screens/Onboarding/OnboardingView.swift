//
//  OnboardingView.swift
//  BeginningSwiftUI
//
//  Created by Macservis on 07/06/22.
//

import SwiftUI

struct OnboardingView: View {
    
    
    //ApstorageVariables
    
    @AppStorage("signed_In") var signedView: Bool?
    
    @AppStorage("name") var currentname: String?
    
    @AppStorage("age") var currentage: Int?
    
    @AppStorage("gender") var currentgender: String?
    
    
    
    //State variables
    
    @State var onboardingValue: Int = 0
    
    @State var name: String = ""
    
    @State var age: Double = 50
    
    @State var gender: String = "Male"
    
    @State var alerttitle: String = ""
    
    @State var showAlert: Bool = false
    
    //transition
    
   // let transition = AnyTransition
    
    var body: some View {
        ZStack {
            
            ZStack {
                
                switch onboardingValue {
                    
                case 0:
                    welcomeView
                case 1:
                    nameView
                    
                case 2:
                    ageView
                    
                case 3:
                    genderView
                    
                    
                    
                default: RoundedRectangle(cornerRadius: 25)
                    
                    
                }
  
            }
            
            
            VStack {
                
                Spacer()
                
                bottomButton
                
            }
            .padding()
            
        }//ZStack
        .alert(isPresented: $showAlert, content: {
            
            Alert(title: Text(alerttitle))
            
        })
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
            .background(Color.purple)
    }
}



//MARK: ViewComponents

extension OnboardingView {
    
    private var bottomButton: some View {
        
        Text("SignIn")
            .frame(height: 55)
            .font(.title)
            .frame(maxWidth: .infinity)
            .foregroundColor(.purple)
            .background(Color.white.cornerRadius(10))
            .onTapGesture {
                
                withAnimation(.spring()) {
                    todonextPage()
                }
                
               
            }
        
        
    }
    
    
    private var welcomeView: some View {
        
        VStack {
            
            Spacer()
            
            
            
            Image(systemName: "heart.text.square.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundColor(.white)
            
            Text("Welcome Too")
                .font(.largeTitle)
                .foregroundColor(.white)
                //.frame(maxWidth: .infinity)
                .overlay(
                    Capsule()
                        .frame(height: 5)
                        .foregroundColor(.white),
                    alignment: .bottomTrailing
                )
            
            Text("Welcome to my App. And we Are happy")
                .padding(.top, 20)
                .foregroundColor(.white)
            
            
            Spacer()
            Spacer()
            
        }
        
        
    }
    
    private var nameView: some View {
        
        VStack {
            
            Spacer()
           
            Text("What is your name?")
                .font(.largeTitle)
                .foregroundColor(.white)
               
                
            TextField("Added your name...", text: $name)
                .padding()
                .background(Color.white.cornerRadius(10))
                .padding()
           
            
            
            Spacer()
            Spacer()
            
        }
        
        
    }
    
    private var ageView: some View {
        
        VStack {
            
            Spacer()
           
            Text("How old are you?")
                .font(.largeTitle)
                .foregroundColor(.white)
               
            Text("\(Int(age))")
                .font(.largeTitle)
                .foregroundColor(.white)
           
            Slider(value: $age, in: 10 ... 100)
                .accentColor(.white)
                .padding()
            
            
            Spacer()
            Spacer()
            
        }
        
        
    }
    
    private var genderView: some View {
        
        VStack {
            
            Spacer()
           
            Text("Choose your gender?")
                .font(.largeTitle)
                .foregroundColor(.white)
               
            Text(gender.count > 0 ? "\(gender)" : "Gender")
                .font(.largeTitle)
                .foregroundColor(.white)
            
            
            
            Picker(selection: $gender, content: {
                
                Text("Male").tag("Male").foregroundColor(.purple).font(.largeTitle)
                Text("FeMale").tag("FeMale").foregroundColor(.purple)
                    .font(.largeTitle)
                
            }, label: {
                
               Text("Select")
                
            })
            .pickerStyle(WheelPickerStyle())
            .background(Color.white.cornerRadius(10))
            .padding()
            
            Spacer()
            Spacer()
            
        }
        
        
    }
    
}



//MARK: Functions

extension OnboardingView {
    
    func todonextPage() {
        
        
        switch onboardingValue {
            
       
            
        case 1:
            guard name.count > 3 else {
                
                alertfunc(title: "Please enter your age🤨☹️🥺😩")
                
                return }
            nextView()
            
        case 3:
            
            goProfileView()
            
            
            
        default:
            nextView()
            
        }
        
        
    }
    
    func alertfunc(title: String) {
        
        alerttitle = title
        showAlert.toggle()
        
    }
    
    
    func goProfileView() {
        
        signedView = true
        
        currentname = name
        
        currentage = Int(age)
        
        currentgender = gender

    }
    
    
    
    func nextView() {
        
        onboardingValue += 1
        
    }
    
}
