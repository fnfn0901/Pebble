import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var waterButton: UIButton!
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var starButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    
    let heartEmitterView = HeartEmitterView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 버튼을 원형으로 설정
        configureCircularButton(button: waterButton, radius: 40)
        configureCircularButton(button: heartButton, radius: 40)
        configureCircularButton(button: starButton, radius: 40)
        
        // editButton의 터치 영역 설정
        configureEditButtonTapArea()
        
        // 저장된 이름 불러오기
        loadName()
        
        // 하트 버튼에 Touch Down 및 Touch Up Inside 이벤트 추가
        heartButton.addTarget(self, action: #selector(heartButtonTouchDown), for: .touchDown)
        heartButton.addTarget(self, action: #selector(heartButtonTouchUpInside), for: .touchUpInside)
        heartButton.addTarget(self, action: #selector(heartButtonTouchUpOutside), for: .touchUpOutside)
        
        // heartEmitterView 설정
        heartEmitterView.frame = view.bounds
        heartEmitterView.isUserInteractionEnabled = false
        view.addSubview(heartEmitterView)
    }
    
    func configureCircularButton(button: UIButton, radius: CGFloat) {
        button.layer.cornerRadius = radius
        button.layer.masksToBounds = true
    }
    
    func configureEditButtonTapArea() {
        // editButton의 터치 영역을 48x48로 변경
        let largerFrame = CGRect(
            x: editButton.frame.origin.x - (48 - editButton.frame.size.width) / 2,
            y: editButton.frame.origin.y - (48 - editButton.frame.size.height) / 2,
            width: 48,
            height: 48
        )
        
        let touchAreaView = UIView(frame: largerFrame)
        touchAreaView.backgroundColor = .clear
        
        // 터치 이벤트를 받도록 설정
        touchAreaView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(editButtonTapped(_:)))
        touchAreaView.addGestureRecognizer(tapGesture)
        
        self.view.addSubview(touchAreaView)
    }
    
    @objc func editButtonTapped(_ sender: UITapGestureRecognizer) {
        // SettingName 스토리보드에서 NameSettingController를 로드
        let storyboard = UIStoryboard(name: "SettingName", bundle: nil)
        if let nameSettingVC = storyboard.instantiateViewController(withIdentifier: "NameSettingController") as? NameSettingController {
            nameSettingVC.initialText = name.text
            nameSettingVC.delegate = self
            self.present(nameSettingVC, animated: true, completion: nil)
        }
    }

    @IBAction func waterButtonTapped(_ sender: UIButton) {
        // waterButtonTapped 액션 구현
    }
    
    @IBAction func heartButtonTapped(_ sender: UIButton) {
        // heartButtonTapped 액션 구현
    }
    
    @IBAction func starButtonTapped(_ sender: UIButton) {
        // starButtonTapped 액션 구현
    }
    
    func saveName(_ name: String) {
        UserDefaults.standard.set(name, forKey: "savedName")
    }
    
    func loadName() {
        if let savedName = UserDefaults.standard.string(forKey: "savedName") {
            self.name.text = savedName
        }
    }
    
    @objc func heartButtonTouchDown() {
        heartEmitterView.startHeartEmitter()
    }
    
    @objc func heartButtonTouchUpInside() {
        heartEmitterView.stopHeartEmitter()
    }
    
    @objc func heartButtonTouchUpOutside() {
        heartEmitterView.stopHeartEmitter()
    }
}

extension ViewController: NameSettingControllerDelegate {
    func didSaveName(name: String) {
        self.name.text = name
        saveName(name)
    }
}
