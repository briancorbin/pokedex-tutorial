// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == PokeApi.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == PokeApi.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == PokeApi.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == PokeApi.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: any ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
    switch typename {
    case "pokemon_v2_ability": return PokeApi.Objects.Pokemon_v2_ability
    case "pokemon_v2_pokedex": return PokeApi.Objects.Pokemon_v2_pokedex
    case "pokemon_v2_pokemon": return PokeApi.Objects.Pokemon_v2_pokemon
    case "pokemon_v2_pokemonability": return PokeApi.Objects.Pokemon_v2_pokemonability
    case "pokemon_v2_pokemondexnumber": return PokeApi.Objects.Pokemon_v2_pokemondexnumber
    case "pokemon_v2_pokemonspecies": return PokeApi.Objects.Pokemon_v2_pokemonspecies
    case "pokemon_v2_pokemonspeciesname": return PokeApi.Objects.Pokemon_v2_pokemonspeciesname
    case "pokemon_v2_pokemonstat": return PokeApi.Objects.Pokemon_v2_pokemonstat
    case "pokemon_v2_pokemontype": return PokeApi.Objects.Pokemon_v2_pokemontype
    case "pokemon_v2_stat": return PokeApi.Objects.Pokemon_v2_stat
    case "pokemon_v2_type": return PokeApi.Objects.Pokemon_v2_type
    case "query_root": return PokeApi.Objects.Query_root
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
