//
//  Profile.swift
//  discoverRd
//
//  Created by Benderson Phanor on 29/6/23.
//

import SwiftUI
import WebKit


struct Profile: View {
    var body: some View {
        
        ScrollView{
            VStack(){
                Image("jeff")
                    .resizable()
                    .frame(width: 100,height: 100)
                    .clipShape(Circle())
                    .overlay( Circle().stroke(Color.gray,lineWidth:2.0) )
                    .shadow(radius: 10)
                Text("Jeff Bezos")
                HStack{
                    Spacer()
                    VStack{
                        Text("3")
                            .bold()
                        Text("Visites")
                            .font(.caption)
                    }
                    Spacer()
                    VStack{
                        Text("$ 6 340 us")
                            .bold()
                        Text("Spent")
                            .font(.caption)
                    }
                    Spacer()
                    VStack{
                        Text("22")
                            .bold()
                        Text("Discorvers")
                            .font(.caption)
                    }
                    Spacer()
                }.padding(.vertical)
                HStack{
                    Group{
                        
                        NavigationLink {
                            WKWebViewRepresentable()
                                .navigationTitle("Law")
                        } label: {
                            VStack{
                                
                                Image("legal")
                                    .resizable()
                                    .foregroundColor(.blue)
                                    .frame(width: 34,height: 34)
                                    .padding(.top,3)
                                Text("Law")
                                    .padding(.horizontal)
                                    .padding(.bottom)
                            }
                        }.buttonStyle(PlainButtonStyle())
                        
                        NavigationLink(destination: {Emergency()}, label: {
                            VStack{
                                Image("emergency")
                                    .resizable()
                                    .frame(width: 34,height: 34)
                                    .padding(.top,3)
                                Text("Emergency")
                                    .foregroundColor(.black)
                                    .padding(.horizontal)
                                    .padding(.bottom)
                                //
                            }
                        })
                        NavigationLink {
                            Discorver()
                        } label: {
                            VStack{
                                Image("rd")
                                    .resizable()
                                    .frame(width: 34,height: 34)
                                    .padding(.top,3)
                                Text("Discovers")
                                    .foregroundColor(.black)
                                    .padding(.horizontal)
                                    .padding(.bottom)
                            }
                        }
                        
                    }.frame(width: 120)
                        .font(.caption)
                        .background(Color.gray.opacity(0.3))
                    
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                
                
                
                
            }
           
            Section {
                VStack(alignment: .leading){
                    NavigationLink {
                        WKWebViewRepresentable(url: "https://www.britannica.com/place/Dominican-Republic")
                            .navigationTitle("About Dominican Republic")
                    } label: {
                        VStack(alignment:.leading){
                            Text("About Dominican Republic")
                                .foregroundColor(.black)
                                .bold()
                            Text("Dominican Republic, country of the West Indies that occupies the eastern two-thirds of Hispaniola, the second largest island of the Greater Antilles chain in the Caribbean Sea. Haiti, also an independent republic, occupies the western third of the island. The Dominican Republic’s shores are washed by the Caribbean to the south and the Atlantic Ocean to the north. Between the eastern tip of the island and Puerto Rico flows the Mona Passage, a channel about 80 miles (130 km) wide. The Turks and Caicos Islands are located some 90 miles (145 km) to the north, and Colombia lies about 300 miles (500 km) to the south. The republic’s area, which includes such adjacent islands as Saona, Beata, and Catalina, is about half the size of Portugal. The national capital is Santo Domingo, on the southern coast.")
                                .font(.caption)
                                .lineLimit(3)
                                .foregroundColor(Color.gray)
                        }
                    }
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            
            
            
            VStack(alignment:.leading){
                
                
                Group{
                    HStack{
                        Image(systemName: "network")
                        Text("Language")
                        Spacer()
                    }
                    
                    HStack{
                        Image(systemName: "bell.badge")
                        Text("Notification")
                        Spacer()
                    }
                    
                    HStack{
                        Image(systemName: "dollarsign")
                        Text("Payment method")
                        Spacer()
                    }
                    
                    HStack{
                        Image(systemName: "dollarsign")
                        Text("My reservations")
                        Spacer()
                    }
                    
                    HStack{
                        Image(systemName: "iphone.gen2.slash")
                        Text("Autorization")
                        Spacer()
                    }
                    
                    HStack{
                        Image(systemName: "paperplane.fill")
                        Text("Share App")
                        Spacer()
                    }
                        
                }.padding()
                .background(.gray.opacity(0.2))
                .cornerRadius(10)
                    .padding(.horizontal)
                    
                
                
                
                
                
                
            }
            
            
            
            Button {
                UserDefaults.standard.setValue(false, forKey: "IS_LOGIN")
            } label: {
                Text("Sign out")
            }
            
            VStack {
            
                Text("Version: 1.0.0")
                    .padding(.vertical)
            }
            
        }
        .navigationBarTitle("Me")
        .toolbar {
            ToolbarItem {
                Text("Edit profile")
                    .foregroundColor(.blue)
            }
        }
       
        
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}


struct WKWebViewRepresentable:UIViewRepresentable{
    var web = WKWebView(frame: CGRect(x: 0, y: 0, width: 400, height: 600))
    var url:String
    init(url:String="https://mip.gob.do/transparencia/images/docs/Publicaciones_Oficiales/Libros_y_Revistas/Ley%20de%20Migraci%C3%B3n/LEY%20DE%20MIGRACION.pdf") {
        self.url = url
        web.load(URLRequest(url: URL(string: url)! ) )
    }
    func makeUIView(context: Context) -> some UIView {
        /*web.load( URLRequest(url: URL(string: "https://mip.gob.do/transparencia/images/docs/Publicaciones_Oficiales/Libros_y_Revistas/Ley%20de%20Migraci%C3%B3n/LEY%20DE%20MIGRACION.pdf")!) )*/
        return web
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
