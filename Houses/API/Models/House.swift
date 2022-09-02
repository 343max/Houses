import Foundation

struct House {
  let url: URL
  let name: String
  let region: String
  let coatOfArms: String?
  let words: String?
  let titles: [String]
  let seats: [String]
  let currentLord: URL?
  let heir: URL?
  let overlord: URL?
  let founded: String?
  let founder: String?
  let diedOut: String?
  let ancestralWeapons: [String]
  let cadetBranches: [URL]
  let swornMembers: [URL]
}

extension House: Equatable {}

extension House: Identifiable {
  var id: URL {
    url
  }
}
