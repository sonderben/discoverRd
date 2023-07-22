//
//  SiteInfo.swift
//  discoverRd
//
//  Created by Benderson Phanor on 28/6/23.
//

import SwiftUI

struct SiteInfo: View {
    var site:Site=Site(summary: "Saona Island is located in the extreme southeast of the Dominican Republic. It is part of the Parque Nacional del Este and is known for its mangroves, coral reefs, and palm-fringed beaches, such as La Palmilla. The island's shallow waters are home to starfish. Mano Juan is a sleepy fishing village near the Laguna de los Flamencos, with colorful huts and a turtle sanctuary. To the west is the Cotubanamá Cave, with pre-Columbian rock art.")
    var body: some View {
        NavigationView {
            VStack(alignment: .leading){
                Image(site.img)
                    .resizable()

                    .scaledToFit()
                ScrollView{
                    VStack(alignment: .leading){
                        Group{
                            HStack {
                                Text(site.name)
                                    .font(.system(size: 24))
                                .bold()
                                Spacer()
                                
                                NavigationLink(destination: PaymentView(), label: {
                                    

                                    Text("Reservar")
                                    .foregroundColor(.white)
                                    .padding(.horizontal)
                                    .padding(.vertical,7)
                                    .background(.blue)
                                    .cornerRadius(8)
                                    
                                })
                            }
                            ScrollView(.horizontal,showsIndicators: false) {
                                HStack{
                                    Spacer()
                                    Image(systemName: "star.fill")
                                        .foregroundColor(Color.yellow)
                                    Text("4.6 (623)")
                                    
                   
                                    
                                    Circle()
                                        .frame(width: 10, height: 10)
                                        .foregroundColor(Color.gray)
                                    
                                    Image( "door")
                                        .resizable()
                                        .frame(width: 24,height: 20)
                                        .foregroundColor(Color.black)
                                    Text("Open,  Until  15: 00")
                                    Spacer()
                                    
                                }.font(.callout)
                            }
                            HStack{
                                Spacer()
                                Image("link")
                                    .resizable()
                                    .frame(width: 24,height: 24)
                                Link("Sitio", destination: URL(string: "https://www.apple.com")!)
                                Circle()
                                    .frame(width: 10, height: 10)
                                    .foregroundColor(Color.gray)
                                Image("tel")
                                    .resizable()
                                    .frame(width: 24,height: 24)
                                Link("LLamar", destination: URL(string: "tel:8005551212")!)
                                //Text("Call [123-456-7890](tel:1234567890)")
                                Circle()
                                    .frame(width: 10, height: 10)
                                    .foregroundColor(Color.gray)
                                Image("location")
                                    .resizable()
                                    .frame(width: 24,height: 24)
                                Link("Como llegar", destination: URL(string: "https://www.apple.com")!)
                                Spacer()
                            }
                            if site.summary.count > 20 {
                                Text( "Saona Island is located in the extreme southeast of the Dominican Republic. It is part of the Parque Nacional del Este and is known for its mangroves, coral reefs, and palm-fringed beaches, such as La Palmilla. The island's shallow waters are home to starfish".prefix(200) ).font(.caption).foregroundColor(.gray)+Text("...") + Text(" more").foregroundColor(Color.blue)
                            }else{
                                Text(site.summary)
                                    .font(.caption).foregroundColor(.gray)
                            }
                            
                        }.padding(.horizontal)
                        Text("Comentarios")
                            .bold()
                            .padding(.horizontal)
                            .padding(.top)
                            VStack{
                                ForEach(site.comment){comment in
                                    CommentView(comment: comment)
                                }
                            }
                    }
                }
                Spacer()
            }.edgesIgnoringSafeArea(.top)
        }
    }
}

struct SiteInfo_Previews: PreviewProvider {
    static var previews: some View {
        SiteInfo()
    }
}

struct CommentView:View{
    var comment:Comment
    var body: some View{
        HStack(alignment:.top){
            Image(comment.user.img)
                .resizable()
                .frame(width: 44,height: 44)
                .clipShape(Circle())
                .overlay( Circle().stroke(Color.gray,lineWidth:2.0) )
                .shadow(radius: 10)
            VStack(alignment:.leading){
                Text("\(comment.user.fullName) ")
                    .bold() + Text(comment.date.prettyDHM_RD()).font(.caption2)
                Text(comment.comment)
            }
        }.padding(3)
            .padding(.bottom)
    }
}
