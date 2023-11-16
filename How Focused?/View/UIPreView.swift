import UIKit

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct UIViewPreview<View: UIView>: UIViewRepresentable {
    let view: View
    
    init(_ builder: @escaping () -> View) {
        view = builder()
    }
    
    func makeUIView(context: Context) -> some UIView {
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
}
#endif

enum DeviceType {
    case iPhoneSE2
    case iPhone8
    case iPhone12Pro
    case iPhone12ProMax
    case iPhone14Pro
    case iPhone14ProMax
    case iPhone15Pro
    case iPhone15ProMax
    
    
    func name() -> String {
        switch self {
        case .iPhoneSE2:
            return "iPhone SE"
        case .iPhone8:
            return "iPhone 8"
        case .iPhone12Pro:
            return "iPhone 12 Pro"
        case .iPhone12ProMax:
            return "iPhone 12 Pro Max"
        case .iPhone14Pro:
            return "iPhone 14 Pro"
        case .iPhone14ProMax:
            return "iPhone 14 Pro Max"
        case .iPhone15Pro:
            return "iPhone 15 Pro"
        case .iPhone15ProMax:
            return "iPhone 15 Pro Max"
        }
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

extension UIViewController{
    
    private struct Preview: UIViewControllerRepresentable{
        let viewController: UIViewController
        
        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        }
    }

    
    func showPreView(_ deviceType: DeviceType = .iPhone15Pro) -> some View {
        Preview(viewController: self).previewDevice(PreviewDevice(rawValue: deviceType.name()))
    }
}
#endif
