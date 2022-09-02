import SwiftUI

struct HouseLoadingList: View {
  @State private var houses: [House] = []
  private var page = 0

  func loadFirst() async {
    houses = (try? await API.shared.houses(page: 0)) ?? []
  }

  var body: some View {
    HouseList(houses: houses)
      .refreshable {
        await loadFirst()
      }.onAppear(perform: {
        Task {
          await loadFirst()
        }
      })
  }
}
