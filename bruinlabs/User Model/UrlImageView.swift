//
//  SwiftUIView.swift
//  bruinlabs
//
//  Created by James Guo on 1/2/21.
//  Copyright © 2021 Daniel Hu. All rights reserved.
//
import Foundation
import SwiftUI
struct UrlImageView
{
    var body: some View
    {
        Image(uiImage: UrlImageView.defaultImage!)
            .resizable()
            .scaledToFit()
            .frame(width: 120.0, height: 120.0)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
    }
    static var defaultImage = UIImage(named: "defaultpfp")
}
class
