//
//  Extension.swift
//  discoverRd
//
//  Created by Benderson Phanor on 28/6/23.
//

import Foundation

extension Date{
    var dateFormaterHourMin: DateFormatter{
        let formater=DateFormatter()
                formater.doesRelativeDateFormatting = true
                formater.dateStyle = .short
                formater.timeStyle = .short
        return formater
        }
    func prettyDHM_RD()->String{
            
            return dateFormaterHourMin.string(from: self)
        }
}
