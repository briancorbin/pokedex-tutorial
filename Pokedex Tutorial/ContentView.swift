//
//  ContentView.swift
//  Pokedex Tutorial
//
//  Created by Brian Corbin on 11/29/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var pokedexManager = PokedexManager()
    
    var body: some View {
        PokedexView(pokemon: pokedexManager.pokemon)
    }
}

#Preview {
    ContentView()
}
