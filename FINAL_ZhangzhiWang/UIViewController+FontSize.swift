import UIKit

extension UIViewController {

    func adjustFontSize() {
        let increaseFontSize = UserDefaults.standard.bool(forKey: "increaseFontSizeEnabled")
        
        if increaseFontSize {
            adjustLabelsFontSize(view: self.view)
        }
    }
    
    func adjustLabelsFontSize(view: UIView) {
        for subview in view.subviews {
            if let label = subview as? UILabel {
                label.font = UIFont.systemFont(ofSize: label.font.pointSize + 5)
            }
            adjustLabelsFontSize(view: subview)
        }
    }
}
