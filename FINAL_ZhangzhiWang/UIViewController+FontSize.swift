import UIKit

extension UIViewController {

    func adjustFontSize() {
        let increaseFontSize = UserDefaults.standard.bool(forKey: "increaseFontSizeEnabled")
        
        // Increase font size of the page if user set large font
        if increaseFontSize {
            adjustLabelsFontSize(view: self.view)
        }
    }
    
    // Iterate through all subviews of a View and increase the font size of all labels by 5
    func adjustLabelsFontSize(view: UIView) {
        for subview in view.subviews {
            if let label = subview as? UILabel {
                label.font = UIFont.systemFont(ofSize: label.font.pointSize + 5)
            }
            adjustLabelsFontSize(view: subview)
        }
    }
}
