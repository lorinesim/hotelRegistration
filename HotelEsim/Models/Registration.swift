//
//  Registration.swift
//  HotelEsim
//
//  Created by lorin esim on 13.05.2023.
//

import Foundation
struct Registration {
    var firstName: String
    var lastName: String
    var emailAddress: String
    
    // cek tarihleri
    var checkInDate: Date
    var checkOutDate: Date
    
    // yetiskin ve cocuk sayısı bilgisi
    var numberOfAdults: Int
    var numberOfChildren: Int
    
    // RoomType türünden veri
    var roomType: RoomType
    
    
    var wifi: Bool
}
