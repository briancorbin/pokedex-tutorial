//
//  Color+Extensions.swift
//  SwiftDex
//
//  Created by Brian Corbin on 4/2/22.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let alpha, red, green, blue: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (alpha, red, green, blue) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (alpha, red, green, blue) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (alpha, red, green, blue) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (alpha, red, green, blue) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(red) / 255,
            green: Double(green) / 255,
            blue: Double(blue) / 255,
            opacity: Double(alpha) / 255
        )
    }
}

extension Color {
    static let steel = Colors.Types.steel
    static let ghost = Colors.Types.ghost
    static let poison = Colors.Types.poison
    static let water = Colors.Types.water
    static let flying = Colors.Types.flying
    static let grass = Colors.Types.grass
    static let fire = Colors.Types.fire
    static let fairy = Colors.Types.fairy
    static let dark = Colors.Types.dark
    static let dragon = Colors.Types.dragon
    static let normal = Colors.Types.normal
    static let ice = Colors.Types.ice
    static let rock = Colors.Types.rock
    static let fighting = Colors.Types.fighting
    static let electric = Colors.Types.electric
    static let psychic = Colors.Types.psychic
    static let bug = Colors.Types.bug
    static let ground = Colors.Types.ground

    static let hp = Colors.Ev.hp
    static let atk = Colors.Ev.atk
    static let def = Colors.Ev.def
    static let satk = Colors.Ev.satk
    static let sdef = Colors.Ev.sdef
    static let spe = Colors.Ev.spe

    static let male = Colors.Gender.male
    static let female = Colors.Gender.female
}
