//
//  ViewSelector.swift
//  bruinlabs
//
//  Created by James Guo on 11/29/20.
//  Copyright © 2020 Daniel Hu. All rights reserved.
//
import SwiftUI
import Foundation
struct BottomView: View {
    @ObservedObject var data = getData()
    
    var body: some View {
        HStack{
            NavigationLink (destination: HomeScreen()){
                 Image(systemName: "house")
                 .resizable()
                 .frame(width: UIScreen.main.bounds.height * 0.03, height: UIScreen.main.bounds.height * 0.03)
             }.padding()
             
             Spacer()
             
            NavigationLink (destination: SearchScreen(data: self.$data.catalog )){
                Image(systemName: "magnifyingglass")
                 .resizable()
                 .frame(width: UIScreen.main.bounds.height * 0.03, height: UIScreen.main.bounds.height * 0.03)
             }.padding()
             
             Spacer()
             
             
            NavigationLink (destination: SearchScreen(data: self.$data.catalog)){
                 Image(systemName: "dollarsign.circle")
                 .resizable()
                    .frame(width: UIScreen.main.bounds.height * 0.03, height: UIScreen.main.bounds.height * 0.03)
             }.padding()
             
             Spacer()
             
            NavigationLink (destination: SearchScreen(data: self.$data.catalog)){
                Image(systemName: "person")
                 .resizable()
                    .frame(width: UIScreen.main.bounds.height * 0.03 , height: UIScreen.main.bounds.height * 0.03)
             }.padding()
            Spacer()
            
            NavigationLink (destination: InfoPage()){
                Image(systemName: "info.circle")
                .resizable()
                    .frame(width: UIScreen.main.bounds.height * 0.03, height: UIScreen.main.bounds.height * 0.03)
            }.padding()
            
            Spacer()
        }.frame(height: UIScreen.main.bounds.height * 0.035)
    }
}

