//
//  RoomType.swift
//  HotelEsim
//
//  Created by lorin esim on 13.05.2023.
//

import Foundation

struct RoomType: Equatable {
    var id: Int
    var name: String
    var shortName: String
    var price: Int
    
    static func ==(lhs: RoomType, rhs: RoomType) -> Bool {
        return lhs.id == rhs.id
        
    }
    
}
