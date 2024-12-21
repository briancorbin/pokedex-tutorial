// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class PokemonDetailsQuery: GraphQLQuery {
  public static let operationName: String = "PokemonDetails"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query PokemonDetails($pokemonId: Int!) { pokemon_v2_pokemon(where: { id: { _eq: $pokemonId } }) { __typename height name weight pokemon_v2_pokemonstats { __typename base_stat pokemon_v2_stat { __typename game_index } } pokemon_v2_pokemonabilities { __typename is_hidden pokemon_v2_ability { __typename name id } slot } id pokemon_v2_pokemonspecy { __typename pokemon_shape_id pokemon_v2_pokemonspeciesnames(where: { language_id: { _eq: 9 } }) { __typename genus } } } }"#
    ))

  public var pokemonId: Int

  public init(pokemonId: Int) {
    self.pokemonId = pokemonId
  }

  public var __variables: Variables? { ["pokemonId": pokemonId] }

  public struct Data: PokeApi.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { PokeApi.Objects.Query_root }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("pokemon_v2_pokemon", [Pokemon_v2_pokemon].self, arguments: ["where": ["id": ["_eq": .variable("pokemonId")]]]),
    ] }

    /// fetch data from the table: "pokemon_v2_pokemon"
    public var pokemon_v2_pokemon: [Pokemon_v2_pokemon] { __data["pokemon_v2_pokemon"] }

    /// Pokemon_v2_pokemon
    ///
    /// Parent Type: `Pokemon_v2_pokemon`
    public struct Pokemon_v2_pokemon: PokeApi.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { PokeApi.Objects.Pokemon_v2_pokemon }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("height", Int?.self),
        .field("name", String.self),
        .field("weight", Int?.self),
        .field("pokemon_v2_pokemonstats", [Pokemon_v2_pokemonstat].self),
        .field("pokemon_v2_pokemonabilities", [Pokemon_v2_pokemonability].self),
        .field("id", Int.self),
        .field("pokemon_v2_pokemonspecy", Pokemon_v2_pokemonspecy?.self),
      ] }

      public var height: Int? { __data["height"] }
      public var name: String { __data["name"] }
      public var weight: Int? { __data["weight"] }
      /// An array relationship
      public var pokemon_v2_pokemonstats: [Pokemon_v2_pokemonstat] { __data["pokemon_v2_pokemonstats"] }
      /// An array relationship
      public var pokemon_v2_pokemonabilities: [Pokemon_v2_pokemonability] { __data["pokemon_v2_pokemonabilities"] }
      public var id: Int { __data["id"] }
      /// An object relationship
      public var pokemon_v2_pokemonspecy: Pokemon_v2_pokemonspecy? { __data["pokemon_v2_pokemonspecy"] }

      /// Pokemon_v2_pokemon.Pokemon_v2_pokemonstat
      ///
      /// Parent Type: `Pokemon_v2_pokemonstat`
      public struct Pokemon_v2_pokemonstat: PokeApi.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { PokeApi.Objects.Pokemon_v2_pokemonstat }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("base_stat", Int.self),
          .field("pokemon_v2_stat", Pokemon_v2_stat?.self),
        ] }

        public var base_stat: Int { __data["base_stat"] }
        /// An object relationship
        public var pokemon_v2_stat: Pokemon_v2_stat? { __data["pokemon_v2_stat"] }

        /// Pokemon_v2_pokemon.Pokemon_v2_pokemonstat.Pokemon_v2_stat
        ///
        /// Parent Type: `Pokemon_v2_stat`
        public struct Pokemon_v2_stat: PokeApi.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { PokeApi.Objects.Pokemon_v2_stat }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("game_index", Int.self),
          ] }

          public var game_index: Int { __data["game_index"] }
        }
      }

      /// Pokemon_v2_pokemon.Pokemon_v2_pokemonability
      ///
      /// Parent Type: `Pokemon_v2_pokemonability`
      public struct Pokemon_v2_pokemonability: PokeApi.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { PokeApi.Objects.Pokemon_v2_pokemonability }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("is_hidden", Bool.self),
          .field("pokemon_v2_ability", Pokemon_v2_ability?.self),
          .field("slot", Int.self),
        ] }

        public var is_hidden: Bool { __data["is_hidden"] }
        /// An object relationship
        public var pokemon_v2_ability: Pokemon_v2_ability? { __data["pokemon_v2_ability"] }
        public var slot: Int { __data["slot"] }

        /// Pokemon_v2_pokemon.Pokemon_v2_pokemonability.Pokemon_v2_ability
        ///
        /// Parent Type: `Pokemon_v2_ability`
        public struct Pokemon_v2_ability: PokeApi.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { PokeApi.Objects.Pokemon_v2_ability }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("name", String.self),
            .field("id", Int.self),
          ] }

          public var name: String { __data["name"] }
          public var id: Int { __data["id"] }
        }
      }

      /// Pokemon_v2_pokemon.Pokemon_v2_pokemonspecy
      ///
      /// Parent Type: `Pokemon_v2_pokemonspecies`
      public struct Pokemon_v2_pokemonspecy: PokeApi.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { PokeApi.Objects.Pokemon_v2_pokemonspecies }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("pokemon_shape_id", Int?.self),
          .field("pokemon_v2_pokemonspeciesnames", [Pokemon_v2_pokemonspeciesname].self, arguments: ["where": ["language_id": ["_eq": 9]]]),
        ] }

        public var pokemon_shape_id: Int? { __data["pokemon_shape_id"] }
        /// An array relationship
        public var pokemon_v2_pokemonspeciesnames: [Pokemon_v2_pokemonspeciesname] { __data["pokemon_v2_pokemonspeciesnames"] }

        /// Pokemon_v2_pokemon.Pokemon_v2_pokemonspecy.Pokemon_v2_pokemonspeciesname
        ///
        /// Parent Type: `Pokemon_v2_pokemonspeciesname`
        public struct Pokemon_v2_pokemonspeciesname: PokeApi.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { PokeApi.Objects.Pokemon_v2_pokemonspeciesname }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("genus", String.self),
          ] }

          public var genus: String { __data["genus"] }
        }
      }
    }
  }
}
