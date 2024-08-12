//
//  we.swift
//  SwiftUI.c1
//
//  Created by CSmohmmadSH on 09/08/2024.
//

import Foundation

struct CityData : Decodable ,Identifiable{
    let id : Int
    var coord : coord
    var name : String    
    
}

struct coord : Decodable{
    var lon : Double
    var lat : Double
}


