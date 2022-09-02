import Foundation

private struct DirtyHouse: Decodable {
  let url: String
  let name: String
  let region: String
  let coatOfArms: String
  let words: String
  let titles: [String]
  let seats: [String]
  let currentLord: String
  let heir: String
  let overlord: String
  let founded: String
  let founder: String
  let diedOut: String
  let ancestralWeapons: [String]
  let cadetBranches: [String]
  let swornMembers: [String]
}

private extension Array where Element == String {
  var nonEmpty: [String] {
    get {
      self.map({$0.nonEmpty}).compactMap({$0})
    }
  }
}

private extension String {
  var nonEmpty: String? {
    get {
      self == "" ? nil : self
    }
  }
}

extension House: Decodable {
  init(from decoder: Decoder) throws {
    let dirtyHouse = try DirtyHouse(from: decoder)
    url = URL(string: dirtyHouse.url)!
    name = dirtyHouse.name
    region = dirtyHouse.region
    coatOfArms = dirtyHouse.coatOfArms.nonEmpty
    words = dirtyHouse.words == "" ? nil : dirtyHouse.words
    titles = dirtyHouse.titles.nonEmpty
    seats = dirtyHouse.seats.nonEmpty
    currentLord = URL(string: dirtyHouse.currentLord)
    heir = URL(string: dirtyHouse.heir)
    overlord = URL(string: dirtyHouse.overlord)
    founded = dirtyHouse.founded.nonEmpty
    founder = dirtyHouse.founder.nonEmpty
    diedOut = dirtyHouse.diedOut.nonEmpty
    ancestralWeapons = dirtyHouse.ancestralWeapons.nonEmpty
    cadetBranches = dirtyHouse.cadetBranches.nonEmpty.map({URL(string: $0)!})
    swornMembers = dirtyHouse.swornMembers.nonEmpty.map({URL(string: $0)!})
  }
}
