//
//  FavoritesView.swift
//  FetchTakeHomeTest
//
//  Created by James Menkal on 2/13/25.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.favoriteRecipes.count > 0 {
                    List{
                        ForEach(viewModel.favoriteRecipes, id: \.id) { recipe in
                            NavigationLink {
                                DetailView(convertedRecipe: recipe)
                            } label: {
                                HStack {
                                    Image(uiImage: recipe.smallPhoto)
                                        .resizable()
                                        .frame(width: 77, height: 77)
                                        .clipShape(.buttonBorder)
                                    
                                    Text(recipe.name)
                                        .font(.headline)
                                }
                            }
                            .listRowSeparator(.hidden)
                            .swipeActions(edge: .trailing) {
                                Button(role: .none) {
                                    withAnimation {
                                        viewModel.currentIngredientUUID = recipe.id
                                        viewModel.swipeToRemoveIngredient()
                                    }
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                                .tint(.red)
                            }
                        }
                    }
                    .listStyle(.plain)
                } else {
                    ContentUnavailableView("No Favorites Yet", systemImage: "magnifyingglass", description: Text("You may add or remove favorited sweet treats from their recipe thumbnail."))
                }
            }
            .navigationTitle("Favorite Sweet Treats")
        }
    }
}

#Preview {
    FavoritesView()
        .environmentObject(ViewModel())
}
