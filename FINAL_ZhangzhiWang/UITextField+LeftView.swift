

import UIKit

// Extend the UITextField and add a offset for the instance
extension UITextField {
    func setCursorOffset(offset: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: offset, height: self.frame.size.height))
        self.leftView = paddingView
        // leftView should always be visible
        self.leftViewMode = .always
    }
}
