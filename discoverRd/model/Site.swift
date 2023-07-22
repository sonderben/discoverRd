//
//  Site.swift
//  discoverRd
//
//  Created by Benderson Phanor on 28/6/23.
//

import Foundation
import MapKit


struct Site: Identifiable{
    let id = UUID()
    let keySearch: String
    let name: String
    let summary: String
    let numberVisiting:Int
    let rate: Int
    let voteAverage: Int
    let comment:[Comment]
    let telephone:String
    let urlSite:String
    let img:String
    let rangePrice:ClosedRange<Int>
    let coordinate: CLLocationCoordinate2D
    
    let tempSum = "Saona Island is located in the extreme southeast of the Dominican Republic. It is part of the Parque Nacional del Este and is known for its mangroves, coral reefs, and palm-fringed beaches, such as La Palmilla. The island's shallow waters are home to starfish. Mano Juan is a sleepy fishing village near the Laguna de los Flamencos, with colorful huts and a turtle sanctuary. To the west is the Cotubanamá Cave, with pre-Columbian rock art."
    
    init(keySearch: String="plagia enjoy coco", name: String="Isla Saona", summary: String="Saona Island is located in the extreme southeast of the Dominican Republic",numberVisiting:Int=300, rate: Int=4,voteAverage: Int=254, comment: [Comment]=[Comment(comment: "Just returned from Soana, DR, and I'm already longing for its breathtaking beaches and tranquil vibes. A slice of paradise that stole my heart! #Soana #BeachLife"),Comment(user: Visitor(fullName: "Richard Stallman",img: "richard"),comment: "Saona is a tropical paradise that captivates with sus beaches and crystal waters. Important to protect the privacy of visitors and preserve their natural beauty. Free software can contribute to a more sustainable tourism. #IslaSaona #Privacidad #SoftwareLibre")], telephone: String="829 456 23 45", urlSite: String="https://www.google.com/search?q=dominican+republic", img: String="saona", rangePrice: ClosedRange<Int>=1...3, coordinate: CLLocationCoordinate2D=CLLocationCoordinate2D(latitude: 18.155555555556, longitude: -68.699444444444) ) {
        self.keySearch = keySearch
        self.name = name
        self.summary = summary
        self.rate = rate
        self.voteAverage = voteAverage
        self.comment = comment
        self.numberVisiting = numberVisiting
        self.telephone = telephone
        self.urlSite = urlSite
        self.img = img
        self.rangePrice = rangePrice
        self.coordinate = coordinate
    }
    
    public static var allSite:[Site] = [
                        Site(summary: "Saona Island is located in the extreme southeast of the Dominican Republic. It is part of the Parque Nacional del Este and is known for its mangroves, coral reefs, and palm-fringed beaches, such as La Palmilla. The island's shallow waters are home to starfish"),
                        Site(name:"Cayo Arena",summary: "Cayo Arena, cuyo nombre real es Cayo Paraíso, es un islote de coral ubicado al Noroeste de la República Dominicana frente a las costas de Puerto Plata en Punta Rucia. De increíble belleza, esta pequeña islita esta sumida en un paisaje tan hermoso que las personas piensan estar en un sueño. Imaginémonos tomando sol en una pequeña isla perdida en el mar rodeada de arenas blancas y sus aguas tan cristalinas que puedes visualizar el fondo con increíble nitidez, de sus colores que oscilan del azul turquesa al verde esmeralda, bueno...literalmente eso es precisamente esta islita llamada Cayo Arena.",img:"cayo_arena",coordinate: CLLocationCoordinate2D(latitude: 19.167625840259916, longitude: -69.2764924671786)),
                        Site(name: "Dream Royal beach Punta Cana",summary: "Only 23 minutes from Punta Cana International Airport, offering a high level of luxury for couples and couples with children, in ideal beachfront settings. All 373 spacious guest rooms and suites, graciously appointed and luxuriously equipped provide a picture-perfect vacation experience with welcoming service and romantic inclusions. Spacious family rooms can accommodate large families of up to six people. Preferred Club room categories offer upgraded amenities and access to a Private lounge and restaurant, an enhanced mini-bar and more.",img:"dreams", coordinate: CLLocationCoordinate2D(latitude: 18.692037328072697, longitude: -68.41712000248454)),
                        Site(name: "Nuestra Señora de la Encarnación",summary: "La Catedral Primada de América, Catedral de Santo Domingo o Basílica Menor de Santa María de la Encarnación, es una catedral y basílica menor dedicada a Santa María de la Encarnación que se encuentra en la Ciudad Colonial de Santo Domingo, en República Dominicana. Su nombre oficial es Santa Iglesia Catedral Basílica Metropolitana de Nuestra Señora Santa María de la Encarnación o Anunciación. Está ubicada entre las calles Arzobispo Meriño e Isabela La Católica, junto al Parque Colón; quedando su puerta principal al oeste, frente a la calle Arzobispo Meriño, casi esquina Arzobispo Nouel.",img:"encarnacion", coordinate: CLLocationCoordinate2D(latitude: 18.47321295069666, longitude: -69.88412506226848)),
                        Site(name: "Salto del Limón",summary: "El Salto del Limón, localizado a 30 minutos de las Terrenas, en otra de las paradas imprescindibles en una ruta por Samaná y la cascada más famosa que visitar en República Dominicana. Para llegar a la cascada antes deberás dejar el coche en alguno de los parkings de pago habilitados alrededor de la cascada, nosotros recomendamos dejarlo en el conocido como «El Limon Parking» (marcada su ubicación en el mapa de más abajo) y recorrer andando el Sendero del Café que te llevará unos 40 minutos cuesta arriba.",img:"limon", coordinate: CLLocationCoordinate2D(latitude: 19.270611136160433, longitude: -69.44558491224625)),
                        Site(name: "Monumento a los Héroes de la Restauración",summary: "El Monumento a los Héroes de la Restauración conocido también como el Monumento de Santiago está erigido en la ciudad de Santiago de los Caballeros para conmemorar el 100 aniversario de la independencia del país. Originalmente fue nombrado como el Monumento de la Paz de Trujillo y el mismo sería parte de una serie de obras de distintas índoles construidas en Santiago de los Caballeros en la misma época. Su construcción inició y finalizó en 1944, pero no sería hasta 1953 por voluntad del entonces vicepresidente Joaquín Balaguer que sería inaugurado.",img:"santiago", coordinate: CLLocationCoordinate2D(latitude: 19.45115127790629, longitude: -70.69470334689602)),
                        Site(name: "Jardín Botánico de Santiago ",summary: "El Monumento a los Héroes de la Restauración conocido también como el Monumento de Santiago está erigido en la ciudad de Santiago de los Caballeros para conmemorar el 100 aniversario de la independencia del país. Originalmente fue nombrado como el Monumento de la Paz de Trujillo y el mismo sería parte de una serie de obras de distintas índoles construidas en Santiago de los Caballeros en la misma época. Su construcción inició y finalizó en 1944, pero no sería hasta 1953 por voluntad del entonces vicepresidente Joaquín Balaguer que sería inaugurado.",img:"botanico", coordinate: CLLocationCoordinate2D(latitude: 19.49634615992376, longitude: -70.69795764047329))
                       
                       //      19.49634615992376, -70.69795764047329
    ]
}


struct Comment:Identifiable{
    let id:UUID
    let user:Visitor
    let comment: String
    let date: Date
    
    init(user: Visitor=Visitor(), comment: String="Soana, Dominican Republic: A tropical haven with stunning beaches, warm hospitality, and unforgettable experiences. A true paradise escape! #Soana #DominicanRepublic") {
        id = UUID()
        self.user = user
        self.comment = comment
        self.date = Date(timeIntervalSince1970: TimeInterval(Int.random(in: 1682867196...1688137602)))//1688137602)//Int.random(in: 200...400)//
    }
    
}

struct Visitor{
    let fullName:String
    let img:String
    let nationality:String
    let email:String
    let password:String
    init(fullName: String="Jeff Bezos", img: String="jeff", nationality: String="USA", email: String="jeffBezos@amazon.com", password: String="A!1234") {
        self.fullName = fullName
        self.img = img
        self.nationality = nationality
        self.email = email
        self.password = password
    }
}


//Location(name: "mac donald", coordinate: CLLocationCoordinate2D(latitude: 18.46691, longitude: -69.91115)),
