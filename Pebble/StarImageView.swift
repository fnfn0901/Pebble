import UIKit

class StarImageView: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        self.image = UIImage(named: "star")
        self.contentMode = .scaleAspectFit
        self.alpha = 0
    }
    
    func showStar() {
        UIView.animate(withDuration: 0.3) {
            self.alpha = 1
        }
    }
    
    func hideStar() {
        UIView.animate(withDuration: 0.8) {
            self.alpha = 0
        }
    }
}
