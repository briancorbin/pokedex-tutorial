//
//  SpeciesInfoView.swift
//  Pokedex Tutorial
//
//  Created by Brian Corbin on 12/14/24.
//

import SwiftUI

struct SpeciesInfoView: View {
    let id: Int
    let height: Int
    let weight: Int
    let bodyShapeId: Int
    let genus: String
    let color: Color
    let playCry: ((_: Int) -> Void)?
    
    private var heightInMetersText: String {
        return String(format: "%.1f", CGFloat(height) / 10)
    }

    private var weightInKGText: String {
        return String(format: "%.1f", CGFloat(weight) / 10)
    }

    var body: some View {
        VStack {
            PokemonDetailsSectionView(text: "Species Info")
            HStack(alignment: .lastTextBaseline) {
                Group {
                    SpeciesInfoTextView(title: "\(heightInMetersText)m", subtitle: "Height")
                    SpeciesInfoTextView(title: "\(weightInKGText)kg", subtitle: "Weight")
                    Button(action: {
                        playCry?(id)
                    }, label: {
                        SpeciesInfoImageView(image: Image("icon/cry"), imageSize: 18, subtitle: "Cry", color: color)
                    })
                }
                .frame(minWidth: 0, maxWidth: .infinity)
            }
            HStack(alignment: .lastTextBaseline) {
                Group {
                    SpeciesInfoImageView(image: Image("icon/bodyshape/Body\(id)"), imageSize: 30, subtitle: "Shape", color: nil)
                    SpeciesInfoImageView(image: Image("icon/footprint/F\(id)"), imageSize: 30, subtitle: "Footprint", color: color)
                    SpeciesInfoTextView(title: genus.replacingOccurrences(of: " Pokémon", with: "").capitalized, subtitle: "Genus")
                }
                .frame(minWidth: 0, maxWidth: .infinity)
            }
        }
    }
}

struct SpeciesInfoTextView: View {
    let title: String
    let subtitle: String

    var body: some View {
        VStack(spacing: 0) {
            Text(title)
                .font(.headline)
            Text(subtitle)
                .font(.caption)
        }
    }
}

struct SpeciesInfoImageView: View {
    let image: Image
    let imageSize: CGFloat
    let subtitle: String
    let color: Color?

    var body: some View {
        VStack(spacing: 0) {
            image
                .resizable()
                .frame(width: imageSize, height: imageSize, alignment: .center)
                .foregroundColor(color)
            Text(subtitle)
                .font(.caption)
        }
    }
}

#Preview {
    SpeciesInfoView(id: 1, height: 160, weight: 160, bodyShapeId: 1, genus: "Seed", color: .grass, playCry: nil)

}
