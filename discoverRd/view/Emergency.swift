//
//  Emergency.swift
//  discoverRd
//
//  Created by Benderson Phanor on 30/6/23.
//

import SwiftUI
import MapKit

struct Emergency: View {
    @State var toggle = true
    @State var contact1 = "809 314 23 45"
    @State var contact2 = "849 304 13 45"
    @State var contact3 = "809 404 16 23"
    @State var position = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 18.7009, longitude: -70.1655), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.4))
    var body: some View {
        Form{
            
            
            Toggle("Activate emergency mode", isOn: $toggle)
            Section {
                HStack{
                    Spacer()
                    Map(coordinateRegion: $position)
                        .frame(width: 200,height: 100)
                    Spacer()
                }
            } footer: {
                Text("Activating emergency mode and tapping 3 times in less than a second triggers emergency mode.")
            }
            
            Section {
                VStack{
                    HStack{
                        Text("Mom")
                        TextField("", text: $contact1)
                            .textFieldStyle(.roundedBorder)
                    }
                    HStack{
                        Text("Dad")
                        TextField("", text: $contact2)
                            .textFieldStyle(.roundedBorder)
                    }
                    HStack{
                        Text("Max")
                        TextField("", text: $contact3)
                            .textFieldStyle(.roundedBorder)
                    }
                }
            } header: {
                Text("Emergency contacts")
            }footer: {
                Text("The contacts will receive a message and the exact location when triggering the emergency mode.")
            }

            


        }
        .navigationTitle("Emergency")
    }
}

struct Emergency_Previews: PreviewProvider {
    static var previews: some View {
        Emergency()
    }
}
