//
//  PaymentView.swift
//  discoverRd
//
//  Created by Benderson Phanor on 21/7/23.
//

import SwiftUI

struct PaymentView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var selected = "1"
     var price = 230
    @State var priceByQuantity = 230
    
    @State var showAlert = false
    
    @State var isPAid = false
    @State private var date = Date()

    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        var sixMonthsLaterComponents = DateComponents()
        sixMonthsLaterComponents.month = 6
        let endDate = calendar.date(byAdding: sixMonthsLaterComponents, to: today)!
        let endOfDay = calendar.date(bySettingHour: 23, minute: 59, second: 59, of: endDate)!
        
        return today...endOfDay
    }()
    
    var body: some View {
        VStack{
            Image("botanico")
                .resizable()

                .scaledToFit()
            HStack{
                Text("Soana")
                    .lineLimit(1)
                    .font(.largeTitle)
                    .bold()
                    
                Spacer()
                Text("$\(priceByQuantity). 00")
                    .foregroundColor(.blue)
            }
            .font(.system(.title2))
            .padding(.horizontal)
            HStack {
                Text("Cantitad de persona")
                Spacer()
                Picker(selection: $selected) {
                    ForEach(1...104,id: \.self){ id in
                        Text("\(id)")
                            .tag("\(id)")
                    }.onChange(of: selected) { newValue in
                        priceByQuantity = price * Int(selected)!
                    }
                } label: {
                    Text("coo")
                }
            .pickerStyle(.menu)
            }.padding(.horizontal)
            
            DatePicker(
                "Date",
                 selection: $date,
                 in: dateRange,
                 displayedComponents: [.date, .hourAndMinute]
            ).datePickerStyle(.automatic)
            .padding(.horizontal)
            Spacer()
            Button {
                showAlert = true
            } label: {
                Text("Pagar")
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal,50)
                    .background(.blue)
                    
                    
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Reservation approved.")
                        .foregroundColor(.blue),
                    message: Text("You can see this reservation in your reservation list.."),
                    dismissButton: .default(
                        Text("Ok"),
                        action: {
                            presentationMode.wrappedValue.dismiss()
                        }
                    )
                )
                
                
                
                
            }

            Spacer()
        }
    }
}

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView()
    }
}
