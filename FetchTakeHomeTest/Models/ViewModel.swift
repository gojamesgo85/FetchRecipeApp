//
//  ViewModel.swift
//  FetchTakeHomeTest
//
//  Created by James Menkal on 2/13/25.
//

import SwiftUI

@Observable
class ViewModel: ObservableObject {
    

    var storedRecipes: [Recipe] = []
    var convertedRecipes: [ConvertedRecipe] = []
    var favoriteRecipes: [ConvertedRecipe] = []
    var currentRecipe = ConvertedRecipe(id: UUID(),
                                        name: "",
                                        cuisine: "",
                                        largePhoto: UIImage(),
                                        smallPhoto: UIImage(),
                                        sourceURL: nil,
                                        youtubeURL: nil, isFavorite: false)
    var isLoading = false
    var didLoadRecipes = false 
    var searchText = ""
    var currentIngredientUUID = UUID()
 
    func fetchData() async  {
        isLoading = true
        let downloadTask = Task {
            let url = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            return data
        }
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let recipes = try await decoder.decode(RecipeCollection.self, from: downloadTask.value)
            storedRecipes = recipes.recipes
            await cacheRecipeImages()
        } catch {
            print("Error parsing json data: \(error)")
        }
        isLoading = false
    }
    
    func convertImage(for imageToConvert: String) async -> UIImage {
        var returnImage = UIImage()
        let imageTask = Task {
            var imageData = Data()
            if let url = URL(string: imageToConvert) {
                let (data, _) = try await URLSession.shared.data(from: url)
                imageData = data
            }
            return UIImage(data: imageData)
        }
        do {
            if let image = try await imageTask.value {
                returnImage = image
            } else {
                returnImage = UIImage(named: "oops")!
            }
        } catch {
            print("Error: \(error)")
        }
        return returnImage
    }
    
    func cacheRecipeImages() async  {
        for recipe in storedRecipes {
            if let validURL = recipe.youtubeUrl {
                convertedRecipes.append(ConvertedRecipe(id: UUID(),
                                                        name: recipe.name, cuisine: recipe.cuisine,
                                                        largePhoto: await convertImage(for: recipe.photoUrlLarge),
                                                        smallPhoto:await convertImage(for: recipe.photoUrlSmall),
                                                        sourceURL: recipe.sourceUrl,
                                                        youtubeURL: validURL,
                                                        isFavorite: false))
                
            }
        }
    }
    
    func searchResults() -> [ConvertedRecipe] {
        if searchText.isEmpty {
            return convertedRecipes
        } else {
            return convertedRecipes.filter { $0.name.contains(searchText) }
        }
    }
    
    func swipeToRemoveIngredient() {
        if let index = favoriteRecipes.firstIndex(where: { $0.id == currentIngredientUUID}) {
            favoriteRecipes.remove(at: index)
        }
    }
    
    func favoriteCocktail() {
        for recipe in convertedRecipes {
            if recipe.id == currentIngredientUUID {
                recipe.isFavorite.toggle()
                if recipe.isFavorite {
                    favoriteRecipes.append(recipe)
                } else {
                    favoriteRecipes.removeAll(where: { $0.id == currentIngredientUUID})
                }
            }
        }
    }
}


