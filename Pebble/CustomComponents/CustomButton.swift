import UIKit

class CustomButton: UIButton {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let touchableArea = self.bounds.insetBy(dx: -20, dy: -20)
        return touchableArea.contains(point) ? self : super.hitTest(point, with: event)
    }
}
