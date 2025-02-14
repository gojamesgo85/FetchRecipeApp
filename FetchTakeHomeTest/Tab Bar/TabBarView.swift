//
//  TabBarView.swift
//  FetchTakeHomeTest
//
//  Created by James Menkal on 2/13/25.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectedTab: TabBarComponents = .recipeListView
    
    var body: some View {
        TabView(selection: $selectedTab)  {
            ForEach(TabBarComponents.allCases) { screen in
                
                screen.destination
                    .tag(screen as TabBarComponents?)
                    .tabItem { screen.label }
            }
        }
        .environment(\.currentTab, $selectedTab)
    }
}

#Preview {
    TabBarView()
}

