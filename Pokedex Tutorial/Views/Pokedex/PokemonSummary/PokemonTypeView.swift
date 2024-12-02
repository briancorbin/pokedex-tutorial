//
//  PokemonSummaryTypeView.swift
//  Pokedex Tutorial
//
//  Created by Brian Corbin on 11/30/24.
//

import SwiftUI

struct PokemonTypeView: View {

    let type: PokemonType

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(hex: "D8D8D8"))
                .cornerRadius(4)
                .opacity(0.55)
                .frame(height: 30)
            HStack {
                type.icon()
                    .frame(width: 25, height: 25)
                    .opacity(0.55)
                Text(type.text().uppercased())
                    .font(.system(.subheadline))
                    .fontWeight(.semibold)
                    .opacity(0.55)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
            }
        }
    }
}

#Preview {
    PokemonTypeView(type: .grass).previewLayout(.sizeThatFits)
    PokemonTypeView(type: .poison).previewLayout(.sizeThatFits)
}
