//
//  TabBarComponents.swift
//  FetchTakeHomeTest
//
//  Created by James Menkal on 2/13/25.
//

import SwiftUI

enum TabBarComponents: Hashable, Identifiable, CaseIterable {
    
    case recipeListView, favoritesView


    var id: TabBarComponents { self }
    
    @ViewBuilder
    var label: some View {
        switch self {
        case .recipeListView:
            Label("Recipes", systemImage: "book.fill")
        case .favoritesView:
            Label("Favorites", systemImage: "heart.fill")
        }
    }
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case .recipeListView:
            ContentScrollView()
        case .favoritesView:
            FavoritesView()
        }
    }
}

extension EnvironmentValues {
    var currentTab: Binding<TabBarComponents> {
        get { self[CurrentTabKey.self] }
        set { self[CurrentTabKey.self] = newValue }
    }
}

private struct CurrentTabKey: EnvironmentKey {
    static let defaultValue: Binding<TabBarComponents> = .constant(.recipeListView)
}
