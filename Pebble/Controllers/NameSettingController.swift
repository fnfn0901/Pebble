import UIKit

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
        
        saveButton.layer.cornerRadius = 16
        textField.text = initialText
        
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
