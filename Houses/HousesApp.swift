import SwiftUI

@main
struct HousesApp: App {
  var body: some Scene {
    WindowGroup {
      NavigationView {
        HouseList()
      }
    }
  }
}
