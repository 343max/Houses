import SwiftUI

struct HouseList: View {
  @State private var houses: [House] = []
  @State private var isLoading = false
  @State private var hasMore = false
  @State private var page = 0
  
  func load(page: Int) async -> [House] {
    if (isLoading) {
      return []
    } else {
      isLoading = true
      let houses = (try? await API.shared.houses(page: page)) ?? []
      isLoading = false
      return houses
    }
  }
  
  func loadFirst() async {
    if !isLoading {
      page = 0
      houses = await load(page: 0)
      hasMore = true
    }
  }
  
  func loadNext() async {
    if !isLoading {
      page += 1
      let newHoueses = await load(page: page)
      hasMore = newHoueses.count > 0
      houses += newHoueses
    }
  }
  
  var body: some View {
    ScrollViewReader { proxy in
      List {
        Section {
          ForEach(houses) { house in
            Button(house.name) {
              //
            }
          }
        } footer: {
          if (hasMore) {
            VStack(alignment: .center) {
              Spinner(spinning: .constant(true))
            }
            .frame(maxWidth: .infinity)
            .padding(EdgeInsets(top: 60, leading: 0, bottom: 60, trailing: 0))
            .onAppear {
              Task {
                await loadNext()
              }
            }
          }
        }
      }
      .refreshable {
        await loadFirst()
      }
      .onAppear(perform: {
        Task {
          await loadFirst()
        }
      })
    }
  }
}
