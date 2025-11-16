//
//  ContentView.swift
//  iOS-CleanArchitecture
//
//  Created by 野口隼輔 on 2025/11/03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            PokemonListView()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
