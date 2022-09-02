@testable import Houses
import XCTest

final class HousesTests: XCTestCase {
  func testParseHouses() {
    let json = """
    {
        "url": "https://anapioficeandfire.com/api/houses/53",
        "name": "House Burley",
        "region": "The North",
        "coatOfArms": "White, upon a pile azure a knife white",
        "words": "",
        "titles": [
          ""
        ],
        "seats": [
          ""
        ],
        "currentLord": "",
        "heir": "",
        "overlord": "https://anapioficeandfire.com/api/houses/34",
        "founded": "",
        "founder": "",
        "diedOut": "",
        "ancestralWeapons": [
          ""
        ],
        "cadetBranches": [],
        "swornMembers": [
          "https://anapioficeandfire.com/api/characters/162",
          "https://anapioficeandfire.com/api/characters/392"
        ]
      }
    """.data(using: .utf8)!
    let expectedHouse = House(
      url: URL(string: "https://anapioficeandfire.com/api/houses/53"),
      name: "House Burley",
      region: "The North",
      coatOfArms: "White, upon a pile azure a knife white",
      words: nil,
      titles: [],
      seats: [],
      currentLord: nil,
      heir: nil,
      overlord: URL(string: "https://anapioficeandfire.com/api/houses/34"),
      founded: nil,
      founder: nil,
      diedOut: nil,
      ancestralWeapons: [],
      cadetBranches: [],
      swornMembers: [
        URL(string: "https://anapioficeandfire.com/api/characters/162")!,
        URL(string: "https://anapioficeandfire.com/api/characters/392")!,
      ]
    )
    let house = try! JSONDecoder().decode(House.self, from: json)
    XCTAssertEqual(house, expectedHouse)
  }
}
