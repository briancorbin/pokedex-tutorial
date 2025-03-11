//
//  SpeciesInfoView.swift
//  Pokedex Tutorial
//
//  Created by Brian Corbin on 12/14/24.
//

import SwiftUI

struct PokemonSpeciesInfoView: View {
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
                    SpeciesInfoImageView(image: Image("icon/bodyshape/Body\(bodyShapeId)"), imageSize: 30, subtitle: "Shape", color: nil)
                    SpeciesInfoFootprintView(speciesId: id)
                    SpeciesInfoTextView(title: genus.replacingOccurrences(of: " Pokémon", with: "").capitalized, subtitle: "Genus")
                }
                .frame(minWidth: 0, maxWidth: .infinity)
            }
        }
    }
}

struct SpeciesInfoFootprintView: View {
    let speciesId: Int
    
    private var speciesIdFormatted: String {
        return "\(String(format: "%03d", speciesId))"
    }
    
    var body: some View {
        VStack(spacing: 0) {
            AsyncImage(url: URL(string: "https://pokencyclopedia.info/sprites/footprints/ftp__\(speciesIdFormatted).png")) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }.frame(width: 30, height: 30)
            Text("Footprint")
                .font(.caption)
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
    PokemonSpeciesInfoView(id: 1, height: 160, weight: 160, bodyShapeId: 1, genus: "Seed", color: .grass, playCry: nil)

}
