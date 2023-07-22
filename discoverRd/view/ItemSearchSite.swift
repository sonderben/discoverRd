//
//  ItemSearchSite.swift
//  discoverRd
//
//  Created by Benderson Phanor on 29/6/23.
//

import SwiftUI

struct ItemSearchSite: View {
    var site:Site
    var body: some View {
        HStack(alignment:.top){
            Image(site.img)
                .resizable()
                .frame(width: 70, height: 100)
            VStack(alignment: .leading){
                Text(site.name)
                    .bold()
                    .lineLimit(2)
                HStack{
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                   
                    Text("\(Int.random(in: 3 ... 4)).\(Int.random(in: 0 ... 10)) ( \(Int.random(in: 8000 ... 100000)) )")
                    Circle()
                        .frame(width: 8)
                        .foregroundColor(.blue)
                    Text("Open")
                    
                }.lineLimit(1)
                    .font(.caption)
                Text(site.summary)
                    .foregroundColor(.gray.opacity(2))
                    .font(.caption2)
            }
            Spacer()
        }
        .frame(height: 100)
        .padding()
    }
}

struct ItemSearchSite_Previews: PreviewProvider {
    static var previews: some View {
        ItemSearchSite(site: Site())
    }
}
