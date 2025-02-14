//
//  LoadingScreen.swift
//  FetchTakeHomeTest
//
//  Created by James Menkal on 2/13/25.
//

import SwiftUI

struct LoadingScreen: View {
   
    @State private var rotationCircle = 0.0
    
    var body: some View {
        VStack {
            
            Image("feast")
                .resizable()
                .scaledToFit()
                .clipShape(.circle)
                .rotationEffect(.degrees(rotationCircle))
                .animation(Animation.linear(duration: 7).repeatForever(autoreverses: false), value: rotationCircle)
        }
        .task {
            await MainActor.run {
                rotationCircle = 360
            }
        }
    }
}

#Preview {
    LoadingScreen()
}
