//
//  StoreStruct.swift
//  Zadatak2.1
//
//  Created by Aleksandar Stojanovic on 10/10/21.
//

import Foundation

struct Store: Codable {
    var name: String
    var city: String
    var address: String
    var zipcode: String
    var state: String
    var phone: String
}

struct Stores: Codable {
    var stores: [Store]
}
