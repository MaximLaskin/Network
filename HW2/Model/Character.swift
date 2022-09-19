//
//  Character.swift
//  HW2
//
//  Created by Maxim on 19.09.2022.
//

import Foundation

struct Results: Decodable {
    let results: [Character]
}

struct Character: Decodable {
    let name: String?
    let gender: Gender
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String? // почему-то всегда опциональное в симуляторе, наверно не приходят данные
    let status: Status
    let species: Species

    var description: String? {
        """
        gender: \(gender)
        created: \(created)
        status: \(status)
        species: \(species)
        """
    }
}

enum Gender: String, Decodable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

enum Species: String, Decodable {
    case alien = "Alien"
    case human = "Human"
}

enum Status: String, Decodable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}

