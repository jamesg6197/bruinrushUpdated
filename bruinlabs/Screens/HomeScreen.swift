
//
//  ContentView.swift
//  bruinlabs
//
//  Created by Daniel Hu on 7/14/20.
//  Copyright © 2020 Daniel Hu. All rights reserved.
//
import SwiftUI
import Firebase
import FirebaseFirestore

struct HomeItem: Identifiable
{
    var id = UUID()
    var featured : String
    var news1 : String
    var news2 : String
}
//***********//
//Main Screen//
//***********//

struct FeaturedView : View
{
    let link : String
    init(feature: String)
    {
        self.link = feature
    }
    var body: some View
    {
        if self.link == "blank"
        {
            ProgressView()
        }
        else
        {
            Image("\(self.link)")
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .frame(width: UIScreen.main.bounds.height * 0.15, height: UIScreen.main.bounds.height * 0.15
                   , alignment: .leading)
        }
    }
}
struct HomeScreen : View {
    @EnvironmentObject var currentUser : CurrentUser
    @State var color = Color.black.opacity(0.7)
    @State var f1 = "blank"
    @State var f2 = "blank"
    @State var f3 = "blank"
    @State var f4 = "blank"
    @State var f5 = "blank"
    @State var features = [String]()
    func getData()
    {
        let db = Firestore.firestore().collection("Home Page").document("homepage")
        db.getDocument{ (document, error) in
            if let document = document
            {
                self.f1 = document.get("featured1") as? String ?? "blank"
                self.f2 = document.get("featured2") as? String ?? "blank"
                self.f3 = document.get("featured3") as? String ?? "blank"
                self.f4 = document.get("featured4") as? String ?? "blank"
                self.f5 = document.get("featured5") as? String ?? "blank"
            }
            else
            {
                print("Document not found in cache!")
            }
        }
            
            
    }
    
    var body: some View
    {
        VStack
        {
            
            ScrollView
            {
                VStack()
                {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.gray.opacity(0.2))
                        .frame(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.height * 0.2
                           , alignment: .leading)
                        .overlay(FeaturedView(feature: self.f1))
                        .padding()
                 
                    HStack(spacing: 18)
                    {
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.height * 0.2)
                            
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.height * 0.2)
                            
                    }.padding()
                
                    HStack(spacing: 18)
                    {
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.height * 0.2)
                            
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.height * 0.2)
                            
                    }.padding()
                }
                VStack
                {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.gray.opacity(0.2))
                        .frame(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.height * 0.2
                           , alignment: .leading)
                        .overlay(FeaturedView(feature: self.f2))
                        .padding()
                 
                    HStack(spacing: 18)
                    {
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.height * 0.2)
                            
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.height * 0.2)
                            
                    }.padding()
                
                    HStack(spacing: 18)
                    {
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.height * 0.2)
                            
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.height * 0.2)
                            
                    }.padding()
                }
                VStack
                {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.gray.opacity(0.2))
                        .frame(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.height * 0.2
                           , alignment: .leading)
                        .overlay(FeaturedView(feature: self.f3))
                        .padding()
                 
                    HStack(spacing: 18)
                    {
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.height * 0.2)
                            
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.height * 0.2)
                            
                    }.padding()
                
                    HStack(spacing: 18)
                    {
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.height * 0.2)
                            
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.height * 0.2)
                            
                    }.padding()
                }
                VStack
                {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.gray.opacity(0.2))
                        .frame(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.height * 0.2
                           , alignment: .leading)
                        .overlay(FeaturedView(feature: self.f4))
                        .padding()
                 
                    HStack(spacing: 18)
                    {
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.height * 0.2)
                            
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.height * 0.2)
                            
                    }.padding()
                
                    HStack(spacing: 18)
                    {
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.height * 0.2)
                            
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.height * 0.2)
                            
                    }.padding()
                }
                VStack
                {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.gray.opacity(0.2))
                        .frame(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.height * 0.2
                           , alignment: .leading)
                        .overlay(FeaturedView(feature: self.f5))
                        .padding()
                 
                    HStack(spacing: 18)
                    {
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.height * 0.2)
                            
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.height * 0.2)
                            
                    }.padding()
                
                    HStack(spacing: 18)
                    {
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.height * 0.2)
                            
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.height * 0.2)
                            
                    }.padding()
                }
            }.navigationBarTitle("What's Happening?")
            .frame(minWidth: 0 , maxWidth: .infinity)
            .background(LinearGradient(gradient: Gradient(colors: [.bruinblue, .white, .bruinyellow]), startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea(.all, edges: .all))
            
            
            
            BottomView().padding()
        }.onAppear()
        {
            self.getData()
        }
    }
            
         
}
struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}


