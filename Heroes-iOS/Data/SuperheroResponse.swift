//
//  SuperheroResponse.swift
//  Heroes-iOS
//
//  Created by Tardes on 24/6/25.
//

import Foundation

struct SuperheroResponse: Codable {
    let data: [superheroResponse]
}

struct SuperheroResponse: Codable {
    let id: String
    let attributes: Attributes
}
