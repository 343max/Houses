import Foundation

class API {
  static let shared = API()
  
  func houses(page: Int) async throws -> [House] {
    let url = URL(string: "https://anapioficeandfire.com/api/houses?pageSize=50&page=\(page)")!
    let request = URLRequest(url: url)
    let (data, _) = try await URLSession.shared.data(for: request)
    return try JSONDecoder().decode([House].self, from: data)
  }
}
