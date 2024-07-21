import UIKit

// UITextField의 서브클래스 생성
class CustomTextField: UITextField {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let touchableArea = self.bounds.insetBy(dx: -20, dy: -20)
        return touchableArea.contains(point) ? self : super.hitTest(point, with: event)
    }
}

// UIButton의 서브클래스 생성
class CustomButton: UIButton {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let touchableArea = self.bounds.insetBy(dx: -20, dy: -20)
        return touchableArea.contains(point) ? self : super.hitTest(point, with: event)
    }
}

protocol NameSettingControllerDelegate: AnyObject {
    func didSaveName(name: String)
}

class NameSettingController: UIViewController {

    @IBOutlet weak var textField: CustomTextField!
    @IBOutlet weak var saveButton: CustomButton!
    
    weak var delegate: NameSettingControllerDelegate?
    var initialText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 저장 버튼의 코너 반경 설정
        saveButton.layer.cornerRadius = 16
        
        // 텍스트 필드의 초기 텍스트 설정
        textField.text = initialText
        
        // 텍스트 필드의 아래쪽에 스트로크 추가
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: textField.frame.height - 1, width: textField.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.black.cgColor
        textField.borderStyle = .none
        textField.layer.addSublayer(bottomLine)
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        // delegate를 통해 이름 저장
        delegate?.didSaveName(name: textField.text ?? "")
        dismiss(animated: true, completion: nil)
    }
}
