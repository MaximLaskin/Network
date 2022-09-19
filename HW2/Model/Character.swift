//
//  Character.swift
//  HW2
//
//  Created by Maxim on 19.09.2022.
//

import Foundation

struct Character: Codable {
    let name: String
    let gender: Gender
    let image: String
    let episode: [String]
    let url: String
    let created: String
    let status: Status
    let species: Species
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}

