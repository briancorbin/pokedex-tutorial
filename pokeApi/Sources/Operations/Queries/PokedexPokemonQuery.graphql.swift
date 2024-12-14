// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class PokedexPokemonQuery: GraphQLQuery {
  public static let operationName: String = "PokedexPokemon"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query PokedexPokemon($pokedexId: Int!) { pokemon_v2_pokedex(where: { id: { _eq: $pokedexId } }) { __typename pokemon_v2_pokemondexnumbers { __typename pokedex_number pokemon_v2_pokemonspecy { __typename name pokemon_v2_pokemons { __typename pokemon_v2_pokemontypes { __typename pokemon_v2_type { __typename id } } } } } } }"#
    ))

  public var pokedexId: Int

  public init(pokedexId: Int) {
    self.pokedexId = pokedexId
  }

  public var __variables: Variables? { ["pokedexId": pokedexId] }

  public struct Data: PokeApi.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { PokeApi.Objects.Query_root }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("pokemon_v2_pokedex", [Pokemon_v2_pokedex].self, arguments: ["where": ["id": ["_eq": .variable("pokedexId")]]]),
    ] }

    /// fetch data from the table: "pokemon_v2_pokedex"
    public var pokemon_v2_pokedex: [Pokemon_v2_pokedex] { __data["pokemon_v2_pokedex"] }

    /// Pokemon_v2_pokedex
    ///
    /// Parent Type: `Pokemon_v2_pokedex`
    public struct Pokemon_v2_pokedex: PokeApi.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { PokeApi.Objects.Pokemon_v2_pokedex }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("pokemon_v2_pokemondexnumbers", [Pokemon_v2_pokemondexnumber].self),
      ] }

      /// An array relationship
      public var pokemon_v2_pokemondexnumbers: [Pokemon_v2_pokemondexnumber] { __data["pokemon_v2_pokemondexnumbers"] }

      /// Pokemon_v2_pokedex.Pokemon_v2_pokemondexnumber
      ///
      /// Parent Type: `Pokemon_v2_pokemondexnumber`
      public struct Pokemon_v2_pokemondexnumber: PokeApi.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { PokeApi.Objects.Pokemon_v2_pokemondexnumber }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("pokedex_number", Int.self),
          .field("pokemon_v2_pokemonspecy", Pokemon_v2_pokemonspecy?.self),
        ] }

        public var pokedex_number: Int { __data["pokedex_number"] }
        /// An object relationship
        public var pokemon_v2_pokemonspecy: Pokemon_v2_pokemonspecy? { __data["pokemon_v2_pokemonspecy"] }

        /// Pokemon_v2_pokedex.Pokemon_v2_pokemondexnumber.Pokemon_v2_pokemonspecy
        ///
        /// Parent Type: `Pokemon_v2_pokemonspecies`
        public struct Pokemon_v2_pokemonspecy: PokeApi.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { PokeApi.Objects.Pokemon_v2_pokemonspecies }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("name", String.self),
            .field("pokemon_v2_pokemons", [Pokemon_v2_pokemon].self),
          ] }

          public var name: String { __data["name"] }
          /// An array relationship
          public var pokemon_v2_pokemons: [Pokemon_v2_pokemon] { __data["pokemon_v2_pokemons"] }

          /// Pokemon_v2_pokedex.Pokemon_v2_pokemondexnumber.Pokemon_v2_pokemonspecy.Pokemon_v2_pokemon
          ///
          /// Parent Type: `Pokemon_v2_pokemon`
          public struct Pokemon_v2_pokemon: PokeApi.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: any ApolloAPI.ParentType { PokeApi.Objects.Pokemon_v2_pokemon }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("pokemon_v2_pokemontypes", [Pokemon_v2_pokemontype].self),
            ] }

            /// An array relationship
            public var pokemon_v2_pokemontypes: [Pokemon_v2_pokemontype] { __data["pokemon_v2_pokemontypes"] }

            /// Pokemon_v2_pokedex.Pokemon_v2_pokemondexnumber.Pokemon_v2_pokemonspecy.Pokemon_v2_pokemon.Pokemon_v2_pokemontype
            ///
            /// Parent Type: `Pokemon_v2_pokemontype`
            public struct Pokemon_v2_pokemontype: PokeApi.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: any ApolloAPI.ParentType { PokeApi.Objects.Pokemon_v2_pokemontype }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("pokemon_v2_type", Pokemon_v2_type?.self),
              ] }

              /// An object relationship
              public var pokemon_v2_type: Pokemon_v2_type? { __data["pokemon_v2_type"] }

              /// Pokemon_v2_pokedex.Pokemon_v2_pokemondexnumber.Pokemon_v2_pokemonspecy.Pokemon_v2_pokemon.Pokemon_v2_pokemontype.Pokemon_v2_type
              ///
              /// Parent Type: `Pokemon_v2_type`
              public struct Pokemon_v2_type: PokeApi.SelectionSet {
                public let __data: DataDict
                public init(_dataDict: DataDict) { __data = _dataDict }

                public static var __parentType: any ApolloAPI.ParentType { PokeApi.Objects.Pokemon_v2_type }
                public static var __selections: [ApolloAPI.Selection] { [
                  .field("__typename", String.self),
                  .field("id", Int.self),
                ] }

                public var id: Int { __data["id"] }
              }
            }
          }
        }
      }
    }
  }
}
