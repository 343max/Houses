import SwiftUI

struct HouseDetails: View {
  let house: House
  
  var body: some View {
    List {
      Text(house.name).font(.largeTitle).bold().listRowSeparator(.hidden)
      Text(house.region).listRowSeparator(.hidden)
      
      house.coatOfArms.map {Text($0).listRowSeparator(.hidden)}
      house.words.map {Text($0).listRowSeparator(.hidden)}
      ForEach(house.titles, id: \.self) { Text($0).listRowSeparator(.hidden) }
      ForEach(house.seats, id: \.self) { Text($0).listRowSeparator(.hidden) }
      house.founded.map {Text($0).listRowSeparator(.hidden)}
      house.founder.map {Text($0).listRowSeparator(.hidden)}
      house.diedOut.map {Text($0).listRowSeparator(.hidden)}
      ForEach(house.ancestralWeapons, id: \.self) { Text($0).listRowSeparator(.hidden) }
    }
    .listStyle(.plain)
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct HouseDetails_Previews: PreviewProvider {
  static let house = try! JSONDecoder().decode([House].self,
                                               from: Data(contentsOf: Bundle.main.url(forResource: "houses",
                                                                                      withExtension: "json")!
                                               ))[0]
  static var previews: some View {
    HouseDetails(house: house)
  }
}
