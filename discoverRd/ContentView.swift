//
//  ContentView.swift
//  discoverRd
//
//  Created by Benderson Phanor on 28/6/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State var search = ""
    @State var position = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 18.7009, longitude: -70.1655), span: MKCoordinateSpan(latitudeDelta: 4, longitudeDelta: 0.4))
    
    var items = [
        ItemType(name: "Discover", image: "rd",true),
        ItemType(name: "Hotel", image: "hotel",true),
        ItemType(name: "Rent", image: "rent",true),
        ItemType(name: "Restaurant", image: "house")
    ]
    let allSite = Site.allSite
    @State var isSheetPresented = false
    @State var siteInfo:Site?
    
    var body: some View {
        NavigationView {
            ZStack(alignment:.top) {
               
                VStack {
                    TextField("Busca destinos, empresa y mucho mas.", text: $search)
                    
                        .padding(9)
                            .background(Color.white)
                            .cornerRadius(7)
                            .padding()
                        
                    if search.isEmpty{
                        ScrollView(.horizontal,showsIndicators: true){
                            HStack {
                                ForEach(items){it in
                                    item(itemType: it, isSelected: it.image == "rd" ? true : false)
                                        
                                }
                            }
                        }.padding(.horizontal)
                    }
                    
                    else {
                        List{
                            ForEach(Site.allSite) { item in
                                ItemSearchSite(site: item)
                            }
                        }
                    }
                }
                .zIndex(2)
                    
               
                
                Map(coordinateRegion: $position, annotationItems: allSite) { site in
                    MapAnnotation(coordinate: site.coordinate) {
                       
                            
                        Image(site.name.count > 20 ? "location" : "person")
                                .resizable()
                                .foregroundColor(.red)
                                .frame(width: 40, height: 40)
                           
                        
                        .onTapGesture {
                            siteInfo = site
                            isSheetPresented = true
                        }
                        .sheet(isPresented: $isSheetPresented, content: {
                           
                                SiteInfo(site: Site())
                            
                        })
                        
                        }
                }
                    
                    .edgesIgnoringSafeArea(.all)
            }.navigationTitle("DiscorverRd")
                
                .navigationBarTitle("", displayMode: .inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        NavigationLink {
                            Profile()
                        } label: {
                            Image("jeff")
                                .resizable()
                                .frame(width: 44,height: 44)
                                .clipShape(Circle())
                                .overlay( Circle().stroke(Color.gray,lineWidth:2.0) )
                                .shadow(radius: 10)
                        }

                    }
                    
                }
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct item:View{
    var itemType:ItemType
    var isSelected:Bool
    var body: some View{
        VStack{
            HStack{
                
                
                if !itemType.isFRomAsset{
                    Image(systemName: itemType.image)
                }else{
                    
                    Image(itemType.image)
                        .resizable()
                        .frame(width: 24,height: 24)
                }
                Text(itemType.name)
                    .foregroundColor(isSelected ? .blue.opacity(0.7) : .black)
                    .bold(isSelected ? true : false)
                Spacer()
                
            }.frame(minWidth: 90)
            
                .padding(.horizontal)
                .padding(.vertical,7)
                .background( .white)
            .cornerRadius(10)
            
        }
        
    }
}

struct ItemType: Identifiable{
    var id:UUID
    var name:String
    var image:String
    var isFRomAsset = false
    init( name: String, image: String,_ isFRomAsset:Bool=false) {
        self.id = UUID()
        self.name = name
        self.image = image
        self.isFRomAsset = isFRomAsset
    }
    
}

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}
