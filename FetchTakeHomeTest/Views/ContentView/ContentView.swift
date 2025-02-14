//
//  ContentView.swift
//  FetchTakeHomeTest
//
//  Created by James Menkal on 2/13/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ViewModel
   
    var body: some View {
        ZStack {
            LoadingScreen()
                .opacity(viewModel.isLoading ? 1 : 0)
            TabBarView()
                .opacity(viewModel.isLoading ? 0 : 1)
        
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ViewModel())
}


