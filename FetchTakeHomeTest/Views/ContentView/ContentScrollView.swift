//
//  ContentScrollView.swift
//  FetchTakeHomeTest
//
//  Created by James Menkal on 2/13/25.
//

import SwiftUI
import WebKit

struct ContentScrollView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        NavigationStack {
            VStack{
                List {
                    ForEach (viewModel.searchResults(), id: \.id) { recipe in
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
                    }
                    
                }
                .listStyle(.plain)
                .padding()
                .task {
                    if !viewModel.didLoadRecipes {
                        await viewModel.fetchData()
                    }
                    viewModel.didLoadRecipes = true
                }
            }
            .navigationTitle("Sweet Treats")
            
        }
        .searchable(text: $viewModel.searchText)
    }
}

#Preview {
    ContentScrollView()
        .environmentObject(ViewModel())
}
