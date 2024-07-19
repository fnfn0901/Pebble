import UIKit

protocol NameSettingControllerDelegate: AnyObject {
    func didSaveName(name: String)
}

class NameSettingController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
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
        delegate?.didSaveName(name: textField.text ?? "")
        dismiss(animated: true, completion: nil)
    }
}
