import SwiftUI

struct HouseList: View {
  let houses: [House]
  var body: some View {
    List {
      ForEach(houses) { house in
        Button(house.name) {
          //
        }
      }
    }
  }
}

struct HouseList_Preview: PreviewProvider {
  static let houses = try! JSONDecoder().decode([House].self, from: Data(contentsOf: Bundle.main.url(forResource: "houses", withExtension: "json")!))
  
  static var previews: some View {
    HouseList(houses: houses)
  }
}
