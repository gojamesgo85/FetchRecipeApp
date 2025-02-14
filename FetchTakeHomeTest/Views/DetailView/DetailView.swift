//
//  DetailView.swift
//  FetchTakeHomeTest
//
//  Created by James Menkal on 2/13/25.
//

import SwiftUI
import WebKit

struct DetailView: View {
    @EnvironmentObject var viewModel: ViewModel
    @State private var isFavorite: Bool = false
    var convertedRecipe: ConvertedRecipe
    
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                
                VStack {
                    HStack {
                        Spacer()
                        Button {
                            viewModel.currentIngredientUUID = convertedRecipe.id
                            viewModel.favoriteCocktail()
                            isFavorite.toggle()
                            
                        } label: {
                            HStack{
                                FavoriteHeart(isFavorite: $isFavorite)
                                FavoriteHeart(isFavorite: $isFavorite)
                                FavoriteHeart(isFavorite: $isFavorite)
                            }
                        }
                        .padding(.horizontal, 70)
                        Spacer()
                    }
                    
                    Image(uiImage: convertedRecipe.largePhoto)
                        .resizable()
                        .frame(width: 300, height: 300)
                        .clipShape(.buttonBorder)
                    
                    if let validYoutubeUrl = convertedRecipe.youtubeURL {
                        
                        YouTubeView(videoURL: validYoutubeUrl)
                            .frame(width: 300, height: 300)
                            .padding()
                    }
                    
                    if let validSourceURL = convertedRecipe.sourceURL {
                        Link("Learn More", destination: URL(string: validSourceURL)!)
                            .frame(width: 140, height: 44)
                            .background(.blue)
                            .foregroundStyle(.white)
                            .clipShape(.capsule)
                            .font(.headline)
                    }
                }
                .navigationTitle("\(convertedRecipe.name): \(convertedRecipe.cuisine)")
                .navigationBarTitleDisplayMode(.inline)
                .task {
                    if convertedRecipe.isFavorite {
                        isFavorite = true
                    } else {
                        isFavorite = false
                    }
                }
            }
        }
    }
}

#Preview {
    DetailView(convertedRecipe: ConvertedRecipe(id: UUID(), name: "Example Recipe", cuisine: "British", largePhoto: UIImage(named: "feast")!, smallPhoto: UIImage(), sourceURL: nil, youtubeURL: nil, isFavorite: false))
        .environmentObject(ViewModel())
}

struct YouTubeView: UIViewRepresentable {
    let videoURL: String
    func makeUIView(context: Context) ->  WKWebView {
        return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let demoURL = URL(string: videoURL) else { return }
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: demoURL))
    }
}

struct FavoriteHeart: View {
    @Binding var isFavorite: Bool
    var body: some View {
        Image(systemName: isFavorite ? "heart.fill" : "heart")
            .resizable()
            .foregroundStyle(isFavorite ? .red : .gray)
            .frame(width: 44, height: 44)
            .animation(.default, value: isFavorite)
    }
}
