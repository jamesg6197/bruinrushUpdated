//
//  Organizations.swift
//  bruinlabs
//
//  Created by James Guo on 12/6/20.
//  Copyright © 2020 Daniel Hu. All rights reserved.
//

import Foundation
import Firebase
import SwiftUI
class Organization
{
    var id = UUID()
    var name : String
    var image: String
    var children: [OrganizationType]
    init(name: String, image: String, children: [OrganizationType]) {
              self.name = name
              self.image = image
              self.children = children
         }
}
class OrganizationType
{
    let id = UUID()
    let name : String
    let image: String
    let children: [OrganizationTypeDetailed]
    init(name: String, image: String, children: [OrganizationTypeDetailed]) {
              self.name = name
              self.image = image
              self.children = children
    }
}
class OrganizationTypeDetailed: BaseType
{
}

extension Organization
{
    static func getallorgData() -> Organization {
        let businesstypes = [OrganizationTypeDetailed(name: "Consulting Clubs", image: "consulting"), OrganizationTypeDetailed(name: "Investing Clubs", image: "investment")]
        let technologytypes = [OrganizationTypeDetailed(name:"Computer Science Clubs", image: "computerscience")]
        let clubtypes  = [OrganizationType(name:"Business", image: "business", children: businesstypes), OrganizationType(name:"Technology", image: "technology", children: technologytypes)]
        let organizations = Organization(name: "Organizations", image: "organization", children: clubtypes)
        return organizations
    }
    
}
struct OrganizationCell: View
{
    var body: some View
    {
        HStack{

            Image(Organization.getallorgData().image)
                .resizable()
                .frame(width: UIScreen.main.bounds.width * 0.25, height: UIScreen.main.bounds.width * 0.25)
                .cornerRadius(15)
            Text("Organizations")
                .bold()
                .font(.headline)
            Spacer()
            NavigationLink("View", destination: OrganizationTypeView(organization: Organization.getallorgData()))
            
        }
        .padding()
        
    }
}
struct OrganizationTypeCell: View
{
    let organizationtype: OrganizationType
    var body: some View
    {
        HStack{
            Image(organizationtype.image)
                .resizable()
                .frame(width: UIScreen.main.bounds.width * 0.25, height: UIScreen.main.bounds.width * 0.25)
                .cornerRadius(15)
            Text(organizationtype.name)
                .bold()
                .font(.headline)
            Spacer()

            
        }
        .padding()
        
    }
}
struct OrganizationTypeView: View
{
    let organization: Organization
    var body: some View {
        ScrollView{
            ForEach(organization.children, id: \.id)
            {child in
                HStack{
                    OrganizationTypeCell(organizationtype: child)
                    Spacer()
                    NavigationLink("View", destination: OrganizationTypeDetailedView(organizationtype: child))
                        .padding()
                }
            Divider().background(Color(.black))
            }
        }
    }
}
struct OrganizationTypeDetailedCell: View
{
    let organizationtypedetailed: OrganizationTypeDetailed
    var body: some View
    {
        HStack{
            Image(organizationtypedetailed.image)
                .resizable()
                .frame(width: UIScreen.main.bounds.width * 0.25, height: UIScreen.main.bounds.width * 0.25)
                .cornerRadius(15)
            Text(organizationtypedetailed.name)
                .bold()
                .font(.headline)
            Spacer()

            
        }
        .padding()
        
    }
}
struct OrganizationTypeDetailedView: View
{
    let organizationtype: OrganizationType
    var body: some View {
        ScrollView{
            ForEach(organizationtype.children, id: \.id)
            {child in
                HStack{
                    OrganizationTypeDetailedCell(organizationtypedetailed: child)
                    Spacer()
                    NavigationLink("View", destination: BaseStructureView(Basetype: child))
                        .padding()
                }
            Divider().background(Color(.black))
            }
        }
    }
}
