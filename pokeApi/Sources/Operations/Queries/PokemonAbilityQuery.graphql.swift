// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class PokemonAbilityQuery: GraphQLQuery {
  public static let operationName: String = "pokemonAbility"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query pokemonAbility($abilityId: Int!) { pokemon_v2_ability(where: { id: { _eq: $abilityId } }) { __typename name pokemon_v2_abilityeffecttexts(where: { language_id: { _eq: 9 } }) { __typename effect } } }"#
    ))

  public var abilityId: Int

  public init(abilityId: Int) {
    self.abilityId = abilityId
  }

  public var __variables: Variables? { ["abilityId": abilityId] }

  public struct Data: PokeApi.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { PokeApi.Objects.Query_root }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("pokemon_v2_ability", [Pokemon_v2_ability].self, arguments: ["where": ["id": ["_eq": .variable("abilityId")]]]),
    ] }

    /// fetch data from the table: "pokemon_v2_ability"
    public var pokemon_v2_ability: [Pokemon_v2_ability] { __data["pokemon_v2_ability"] }

    /// Pokemon_v2_ability
    ///
    /// Parent Type: `Pokemon_v2_ability`
    public struct Pokemon_v2_ability: PokeApi.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { PokeApi.Objects.Pokemon_v2_ability }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("name", String.self),
        .field("pokemon_v2_abilityeffecttexts", [Pokemon_v2_abilityeffecttext].self, arguments: ["where": ["language_id": ["_eq": 9]]]),
      ] }

      public var name: String { __data["name"] }
      /// An array relationship
      public var pokemon_v2_abilityeffecttexts: [Pokemon_v2_abilityeffecttext] { __data["pokemon_v2_abilityeffecttexts"] }

      /// Pokemon_v2_ability.Pokemon_v2_abilityeffecttext
      ///
      /// Parent Type: `Pokemon_v2_abilityeffecttext`
      public struct Pokemon_v2_abilityeffecttext: PokeApi.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { PokeApi.Objects.Pokemon_v2_abilityeffecttext }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("effect", String.self),
        ] }

        public var effect: String { __data["effect"] }
      }
    }
  }
}
