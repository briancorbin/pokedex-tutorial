//
//  PokemonDetailsView.swift
//  Pokedex Tutorial
//
//  Created by Brian Corbin on 12/14/24.
//

import SwiftUI

struct PokemonDetailsView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PokemonDetailsSectionView: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.title2)
            .bold()
    }
}

#Preview {
    PokemonDetailsView()
}

#Preview {
    PokemonDetailsSectionView(text: "Species Info")
}
