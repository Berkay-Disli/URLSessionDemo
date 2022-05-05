//
//  Excuse.swift
//  ExcusesAPI
//
//  Created by Berkay Disli on 5.05.2022.
//

import Foundation

struct Excuse: Hashable, Codable {
    let id: Int
    let excuse: String
    let category: String
}
