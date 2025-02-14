//
//  Model.swift
//  FetchTakeHomeTest
//
//  Created by James Menkal on 2/13/25.
//

import SwiftUI

struct Recipe: Codable {
    
    let cuisine: String
    let name: String
    let photoUrlLarge: String
    let photoUrlSmall: String
    let sourceUrl: String?
    let uuid: String
    let youtubeUrl: String?
    
}

struct RecipeCollection: Codable {
    
    var recipes: [Recipe]
}


final class ConvertedRecipe: Identifiable, Hashable {
    
    static func == (lhs: ConvertedRecipe, rhs: ConvertedRecipe) -> Bool {
        return lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    
    let id: UUID
    let name: String
    let cuisine: String
    let largePhoto: UIImage
    let smallPhoto: UIImage
    let sourceURL: String?
    let youtubeURL: String?
    var isFavorite: Bool = false
    
    init(id: UUID, name: String, cuisine: String, largePhoto: UIImage, smallPhoto: UIImage, sourceURL: String?, youtubeURL: String?, isFavorite: Bool) {
        self.id = id
        self.name = name
        self.cuisine = cuisine
        self.largePhoto = largePhoto
        self.smallPhoto = smallPhoto
        self.sourceURL = sourceURL
        self.youtubeURL = youtubeURL
        self.isFavorite = isFavorite
    }
    
}
