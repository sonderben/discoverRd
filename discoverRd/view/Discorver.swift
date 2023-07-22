//
//  Discorver.swift
//  discoverRd
//
//  Created by Benderson Phanor on 30/6/23.
//

import SwiftUI

struct Discorver: View {
    var disvover = [
        DiscoverObj(name: "Isla Soana", img: "saonamap", date: 1688137602),
        DiscoverObj(name: "Monumento a los Héroes de la Restauración", img: "restauracion", date: 1682867196),
        DiscoverObj(name: "Nuestra Señora de la Encarnación", img: "senora", date: 1687867496),
        DiscoverObj(name: "Isla Soana", img: "saonamap", date: 1682867196)
    ]
    var body: some View {
        ScrollView {
            ForEach(disvover){ item in
                ItemDiscorver(item: item)
            }
        }.navigationTitle("Discovers")
    }
}

struct Discorver_Previews: PreviewProvider {
    static var previews: some View {
        Discorver()
    }
}


struct ItemDiscorver: View {
    var item: DiscoverObj
    var body: some View {
        VStack(alignment: .leading){
            Image(item.img)
                .resizable()
                .scaledToFit()
            Text(item.name)
                .bold()
            Text(item.date.prettyDHM_RD() )
        }
        .padding()
        .background(.gray.opacity(0.1))
    }
}

struct DiscoverObj: Identifiable{
    var id: UUID
    var name:String;
    var img:String;
    var date:Date;
    init(name: String, img: String, date: Int) {
        self.name = name
        self.img = img
        self.date = Date(timeIntervalSince1970: TimeInterval(date))
        self.id = UUID()
    }
    
}
