import SwiftUI

struct Spinner: UIViewRepresentable {
  @Binding var spinning: Bool
  
  func makeUIView(context _: Context) -> UIActivityIndicatorView {
    let spinner = UIActivityIndicatorView()
    spinner.style = .large
    if spinning {
      spinner.startAnimating()
    }
    return spinner
  }
  
  func updateUIView(_ uiView: UIActivityIndicatorView, context _: Context) {
    if spinning {
      uiView.startAnimating()
    } else {
      uiView.stopAnimating()
    }
  }
}
