//
//  MarketAndPharms.swift
//  Pets
//
//  Created by Uladzimir Kulakou on 10/8/21.
//

import Foundation

struct Market: Decodable {
    let marketID: Int
    let address: String
    let phone: String
    let time: String
    let latitude: Double
    let longitude: Double
    let marketName: String
    let city: String
}
struct Pharm: Decodable {
    let pharmsName: String
    let pharmsShortName: String
    let pharmsID: Int
}
struct PharmPrice: Decodable {
    let marketID: Int
    let pharmsID: Int
    let marketPrice: Double
}
