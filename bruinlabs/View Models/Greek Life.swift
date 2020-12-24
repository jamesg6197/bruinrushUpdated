//
//  Greek Life.swift
//  bruinlabs
//
//  Created by James Guo on 12/6/20.
//  Copyright © 2020 Daniel Hu. All rights reserved.
//

//
//  GreekLife.swift
//  bruinlabs
//
//  Created by James Guo on 11/27/20.
//  Copyright © 2020 Daniel Hu. All rights reserved.
//
import SwiftUI
import Foundation

class GreekLife
{
    let id = UUID()
    let name: String
    let image: String
    let children: [GreekLifeTypes]
    init(name: String, image: String, children: [GreekLifeTypes]) {
              self.name = name
              self.image = image
              self.children = children
         }
}
class GreekLifeTypes: BaseType
{
}

extension GreekLife
{
    static func getGlifeData() -> GreekLife
    {

        let councils : [GreekLifeTypes] = [GreekLifeTypes(name: "AGC", image: "agc"), GreekLifeTypes(name: "IFC", image: "ifc"), GreekLifeTypes(name:"LGC", image: "lgc")]
        let greekLife = GreekLife(name: "Greek Life", image: "greeklife", children: councils)
        return greekLife
    }
}
struct GreekLifeCell: View
{
    var body: some View
    {
        HStack{

            Image(GreekLife.getGlifeData().image)
                .resizable()
                .frame(width: UIScreen.main.bounds.width * 0.25, height: UIScreen.main.bounds.width * 0.25)
                .cornerRadius(15)
            Text("Greek Life")
                .bold()
                .font(.headline)
            Spacer()
            NavigationLink("View", destination: CouncilView(greeklife: GreekLife.getGlifeData()))
            
        }
        .padding()
    }
}
struct CouncilCell: View
{
    let council: GreekLifeTypes
    var body: some View
    {
        HStack{
            Image(council.image)
                .resizable()
                .frame(width: UIScreen.main.bounds.width * 0.25, height: UIScreen.main.bounds.width * 0.25)
                .cornerRadius(15)
            Text(council.name)
                .bold()
                .font(.headline)
            Spacer()
        }
        .padding()
    }
    
}
struct CouncilView: View
{
    let greeklife: GreekLife
    var body: some View
    {
        ScrollView{
            ForEach(greeklife.children, id: \.id)
            {child in
                HStack{
                    CouncilCell(council: child)
                    Spacer()
                    NavigationLink("View", destination:
                                    BaseStructureView(Basetype: child))
                        .padding()
                }
            Divider().background(Color(.black))
            }
        }
    }
}

