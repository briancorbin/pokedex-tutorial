//
//  PokemonDetails.swift
//  Pokedex Tutorial
//
//  Created by Brian Corbin on 12/14/24.
//

import PokeApi

struct Pokemon: Identifiable {
    let id: Int
    let name: String
    let types: [PokemonType]
    let height: Int
    let weight: Int
    let bodyShapeId: Int
    let genus: String
    let stats: [PokemonStat]
    let slot1Ability: PokemonAbility
    let slot2Ability: PokemonAbility?
    let slot3Ability: PokemonAbility?
    
    init(id: Int, name: String, types: [PokemonType], height: Int, weight: Int, bodyShapeId: Int, genus: String, stats: [PokemonStat], slot1Ability: PokemonAbility, slot2Ability: PokemonAbility?, slot3Ability: PokemonAbility?) {
        self.id = id
        self.name = name
        self.types = types
        self.height = height
        self.weight = weight
        self.bodyShapeId = bodyShapeId
        self.genus = genus
        self.stats = stats
        self.slot1Ability = slot1Ability
        self.slot2Ability = slot2Ability
        self.slot3Ability = slot3Ability
    }
    
    init(pokemonDetails: PokemonDetailsQuery.Data.Pokemon_v2_pokemon) {
        self.id = pokemonDetails.id
        self.name = pokemonDetails.name
        self.types = []
        self.height = pokemonDetails.height!
        self.weight = pokemonDetails.weight!
        self.bodyShapeId = pokemonDetails.pokemon_v2_pokemonspecy!.pokemon_shape_id!
        self.genus = pokemonDetails.pokemon_v2_pokemonspecy!.pokemon_v2_pokemonspeciesnames.first!.genus
        
        var stats: [PokemonStat] = []
        
        for stat in pokemonDetails.pokemon_v2_pokemonstats {
            stats.append(PokemonStat(id: stat.pokemon_v2_stat!.game_index, baseStat: stat.base_stat))
        }
        
        self.stats = stats
    
        var slot1Ability: PokemonAbility?
        var slot2Ability: PokemonAbility?
        var slot3Ability: PokemonAbility?
        for ability in pokemonDetails.pokemon_v2_pokemonabilities {
            let pokemonAbility = PokemonAbility(id: ability.pokemon_v2_ability!.id, name: ability.pokemon_v2_ability!.name, isHidden: ability.is_hidden)
            if ability.slot == 1 {
                slot1Ability = pokemonAbility
            } else if ability.slot == 2 {
                slot2Ability = pokemonAbility
            } else if ability.slot == 3 {
                slot3Ability = pokemonAbility
            }
        }
        
        self.slot1Ability = slot1Ability!
        self.slot2Ability = slot2Ability
        self.slot3Ability = slot3Ability
    }
}

struct PokemonStat: Identifiable {
    let id: Int
    let baseStat: Int
    
    var name: String {
        switch id {
        case 1: return "HP"
        case 2: return "ATK"
        case 3: return "DEF"
        case 4: return "SPE"
        case 5: return "SATK"
        case 6: return "SDEF"
        default: return ""
        }
    }
    
    init(id: Int, baseStat: Int) {
        self.id = id
        self.baseStat = baseStat
    }
}

struct PokemonAbility {
    let id: Int
    let name: String
    let isHidden: Bool
    
    init(id: Int, name: String, isHidden: Bool) {
        self.id = id
        self.name = name
        self.isHidden = isHidden
    }
}
