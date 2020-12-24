
//
//  ContentView.swift
//  bruinlabs
//
//  Created by Daniel Hu on 7/14/20.
//  Copyright © 2020 Daniel Hu. All rights reserved.
//
import SwiftUI
import Firebase

//*****************//
//Completed Reviews//
//*****************//
struct completedReviews: Identifiable{
    var id = UUID()
    var sName: String
    var sReview: String
    var sRating: Int
}
//***********//
//ContentView//
//***********//
struct ContentView: View {
    
    init()
    {
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
    var body: some View
    {
        Display()
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//***********//
//The Display//
//***********//
struct Display: View
{
    @State var status = false
    @State var show = false
    var body: some View
    {
        NavigationView
        {
            VStack
            {
                if self.status {
                    
                    HomeScreen()
                    
                }
                else {
                    ZStack
                    {
                        NavigationLink(destination: SignUp(show: self.$show), isActive: self.$show)
                        {
                            Text("")
                        }.hidden()
                        LoginScreen(show: self.$show)
                    }
                }
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle("")
            .onAppear {
                NotificationCenter.default.addObserver(forName: NSNotification.Name("status"), object: nil, queue: .main) { (_) in
                self.status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                }
            }
        }
    }
}

struct ErrorView : View
{
    @State var color = Color.black.opacity(0.7)
    @Binding var alert : Bool
    @Binding var error : String
    var body: some View
    {
        ZStack {
        GeometryReader{_ in
            
        }
        .background(Color.black.opacity(0.3).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/))
        VStack {
        HStack
        {
            Text(self.error == "RESET" ? "Message" :"Error" )
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(self.color)
        }
        .padding(.horizontal, 25)
            Text(self.error == "RESET" ? "Password Reset link has been sent!": self.error)
            .foregroundColor(self.color)
            .padding(.top)
            .padding(.horizontal, 25)
        Button(action: {
            self.alert.toggle()
        })
        {
            Text(self.error == "RESET" ? "Done" : "Cancel")
                .foregroundColor(self.color)
                .padding(.vertical)
                .frame(width: UIScreen.main.bounds.width - 120)
        }
        .background(Color("Color"))
        .cornerRadius(10)
        .padding(.top, 25)
        }
                .padding(.vertical, 25)
                .frame(width: UIScreen.main.bounds.width - 70)
                .background(Color.white)
                .cornerRadius(15)
        }
        
    }
}

//************//
//Login Screen//
//************//
struct LoginScreen: View
{
    @State var color = Color.black.opacity(0.7)
    @State var email: String = ""
    @State var password: String = ""
    @State var visible = false
    @Binding var show : Bool
    @State var alert = false
    @State var error = ""
    var calculations: CGFloat{
        if UIDevice.current.userInterfaceIdiom == .pad {
            return UIScreen.main.bounds.height * 0.6
        }
        else {
            return UIScreen.main.bounds.height * 0.3
        }
    }

    var body: some View
    {

        ZStack  {
            ZStack(alignment: .topTrailing) {
                
            GeometryReader
                {_ in
                
                    VStack
                        {
                        Image("logo")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width * 0.6 , height: calculations,
                                alignment: .center)
                            .padding(20)
                        Text("Log into your account")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(self.color)
                            .padding(.top, UIScreen.main.bounds.height * 0.03)
                        TextField("Email", text: self.$email)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color(.blue) : self.color, lineWidth: 2))
                            .padding(.top, UIScreen.main.bounds.height * 0.03)
                            .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        HStack (spacing: UIScreen.main.bounds.height * 0.015)
                        {
                
                            VStack
                            {
                                if self.visible
                                {
                                    TextField("Password", text: self.$password)
                                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                                }
                                else
                                {
                                    SecureField("Password", text: self.$password)
                                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                                }
                            }
                            Button(action : {self.visible.toggle()})
                            {
                                Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(self.color)
                            }
                        }.padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(self.password != "" ? Color(.blue) : self.color, lineWidth: 2))
                        .padding(.top, UIScreen.main.bounds.height * 0.03)
                        HStack
                        {
            
                            Button(action : { self.reset() })
                            {
                                Text("Forgot Password?")
                                    .fontWeight(.bold)
                                    .foregroundColor(self.color)
                                
                            }.padding(.leading, UIScreen.main.bounds.width * 0.5)
                            
                        }.padding(.top, UIScreen.main.bounds.height * 0.025)
                        Button(action :{
                            self.verify()
                        })
                        {
                            Text("Login")
                                .fontWeight(.bold)
                                .foregroundColor(self.color)
                                .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.05)
                        }
                        .background(Color("bruinblue"))
                        .cornerRadius(15)
                        .padding(.top,UIScreen.main.bounds.height * 0.025 )
                    }
                        .padding(.horizontal, UIScreen.main.bounds.height * 0.03)
                    .padding(.top, UIScreen.main.bounds.height * 0.05)
                }
            Button (action: {
                self.show.toggle()
            })
                {
                    Text("Register")
                        .fontWeight(.bold)
                        .foregroundColor(self.color)
            }.padding()
                
            }
            if self.alert {
                ErrorView(alert: self.$alert, error : self.$error)
            }
        }.background(LinearGradient(gradient: Gradient(colors: [.bruinblue, .white, .bruinyellow]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all))
           

    }

    func verify(){
        if self.email != "" && self.password != ""
        {
            Auth.auth().signIn(withEmail: self.email, password: self.password) { (res, err) in
                if err != nil {
                    self.error = err!.localizedDescription
                    self.alert.toggle()
                    return
                }
                print("success")
                UserDefaults.standard.set(true, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
            }
        }
        else
        {
            self.error = "Please fill all the respected fields"
            self.alert.toggle()
        }
    }
    func reset()
    {
        if self.email != ""
        {
            Auth.auth().sendPasswordReset(withEmail: self.email) { (err) in
                if err != nil {
                    self.error = err!.localizedDescription
                    self.alert.toggle()
                    return
                }
                self.error = "RESET"
                self.alert.toggle()
            }
        }
        else
        {
            self.error = "Please type an Email"
            self.alert.toggle()
        }
    }
}
//*************//
//Signup Screen//
//*************//
struct SignUp: View
{
    @State var color = Color.black.opacity(0.7)
    @State var email: String = ""
    @State var password: String = ""
    @State var retype: String = ""
    @State var visible = false
    @State var revisible = false
    @State var username = ""
    @State var alert = false
    @State var error = ""
    @Binding var show : Bool
    var calculations: CGFloat{
        if UIDevice.current.userInterfaceIdiom == .pad {
            return UIScreen.main.bounds.height * 0.6
        }
        else {
            return UIScreen.main.bounds.height * 0.3
        }
    }
    var body: some View
    {
        ZStack{
            ZStack(alignment: .topLeading){
                GeometryReader
                    {_ in
                        VStack
                            {
                            Text("Sign Up")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(self.color)
                                .padding(.top, UIScreen.main.bounds.height * 0.03)
                            TextField("Email", text: self.$email)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color(.blue) : self.color, lineWidth: 2))
                                .padding(.top, UIScreen.main.bounds.height * 0.03)
                            TextField("Username", text: self.$username)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color(.blue) : self.color, lineWidth: 2))
                                .padding(.top, UIScreen.main.bounds.height * 0.03)
                            HStack (spacing: UIScreen.main.bounds.height * 0.015)
                            {
                    
                                VStack
                                {
                                    if self.visible
                                    {
                                        TextField("Password", text: self.$password)
                                            .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                                    }
                                    else
                                    {
                                        SecureField("Password", text: self.$password)
                                            .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                                    }
                                }
                                Button(action : {self.visible.toggle()})
                                {
                                    Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                                        .foregroundColor(self.color)
                                }
                            }.padding()
                            .background(RoundedRectangle(cornerRadius: 4).stroke(self.password != "" ? Color(.blue) : self.color, lineWidth: 2))
                            .padding(.top, UIScreen.main.bounds.height * 0.03)
                            HStack (spacing: UIScreen.main.bounds.height * 0.015)
                        {
                    
                                VStack
                                {
                                    if self.revisible
                                    {
                                        TextField("Retype Password", text: self.$retype)
                                            .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                                    }
                                    else
                                    {
                                        SecureField("Retype Password", text: self.$retype)
                                            .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                                    }
                                }
                                Button(action : {self.visible.toggle()})
                                {
                                    Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                                        .foregroundColor(self.color)
                                }
                            }.padding()
                            .background(RoundedRectangle(cornerRadius: 4).stroke(self.password != "" ? Color(.blue) : self.color, lineWidth: 2))
                            .padding(.top, UIScreen.main.bounds.height * 0.03)
                            Button(action :{
                                self.register()
                            })
                            {
                                Text("Register")
                                    .fontWeight(.bold)
                                    .foregroundColor(self.color)
                                    .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.05)
                                    
                            }
                            .background(Color("bruinblue"))
                            .cornerRadius(15)
                            .padding(.top,UIScreen.main.bounds.height * 0.025 )
                        }
                            .padding(.horizontal, UIScreen.main.bounds.height * 0.03)
                        .padding(.top, UIScreen.main.bounds.height * 0.05)
                }
                Button (action: {
                    self.show.toggle()
                })
                    {
                        Image(systemName: "chevron.left")
                            .font(.title)
                            .foregroundColor(.bruinblue)
                }.padding()
            }
            .navigationBarHidden(true)
            if self.alert {
                ErrorView(alert: self.$alert, error: self.$error)
            }
        }.navigationBarBackButtonHidden(true)
    }
    func register(){
        if self.email != "" {
            if self.password == self.retype {
                Auth.auth().createUser(withEmail: self.email, password: self.password){
                    (res, err) in
                    if err != nil {
                        self.error = err!.localizedDescription
                        self.alert.toggle()
                        return
                    }
                    print("success")
                    UserDefaults.standard.set(true, forKey: "status")
                    NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                }
            }
            else{
                self.error = "Password and Retyped Password don't match!"
                self.alert.toggle()
            }
        }
        else
        {
            self.error = "Please fill out all required fields!"
            self.alert.toggle()
        }
    }
}
//***********//
//Main Screen//
//***********//
struct HomeScreen : View {
    @State var color = Color.black.opacity(0.7)
    var body: some View
    {
        
        
            VStack
            {
                ScrollView{
                Text("Logged in successfully!")
                    .font(.title)
                    .foregroundColor(color)
                    .fontWeight(.bold)
                Button(action :{
                    try! Auth.auth().signOut()
                    UserDefaults.standard.set(false, forKey: "status")
                    NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                })
                {
                    Text("Log out")
                        .fontWeight(.bold)
                        .foregroundColor(self.color)
                        .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.05)
                }
                }
                .background(Color("bruinblue"))
                .cornerRadius(15)
                .padding(.top,UIScreen.main.bounds.height * 0.025 )
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                BottomView().padding()
            }
        }
         
}


