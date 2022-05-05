//
//  Category.swift
//  ExcusesAPI
//
//  Created by Berkay Disli on 5.05.2022.
//

import Foundation

enum Category: String, CaseIterable {
    case familyy, office, childrenn, college, party
    
    
    var title: String {
        switch self {
        case .familyy:
            return "family"
        case .office:
            return "office"
        case .childrenn:
            return "children"
        case .college:
            return "college"
        case .party:
            return "party"
        }
    }
    
    
}
