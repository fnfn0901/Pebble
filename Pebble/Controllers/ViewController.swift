import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var waterButton: UIButton!
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var starButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    
    let heartEmitterView = HeartEmitterView()
    let starEmitterView = StarEmitterView(frame: CGRect(x: 0, y: 0, width: 168, height: 76))
    let waterEmitterView = WaterEmitterView(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCircularButton(button: waterButton, radius: 40)
        configureCircularButton(button: heartButton, radius: 40)
        configureCircularButton(button: starButton, radius: 40)
        
        configureEditButtonTapArea()
        loadName()
        
        heartButton.addTarget(self, action: #selector(heartButtonTouchDown), for: .touchDown)
        heartButton.addTarget(self, action: #selector(heartButtonTouchUpInside), for: .touchUpInside)
        heartButton.addTarget(self, action: #selector(heartButtonTouchUpOutside), for: .touchUpOutside)
        
        heartEmitterView.frame = view.bounds
        heartEmitterView.isUserInteractionEnabled = false
        view.addSubview(heartEmitterView)
        
        starEmitterView.center = CGPoint(x: view.center.x - 7, y: view.center.y - 60)
        view.addSubview(starEmitterView)
        
        starButton.addTarget(self, action: #selector(starButtonTouchDown), for: .touchDown)
        starButton.addTarget(self, action: #selector(starButtonTouchUp), for: .touchUpInside)
        starButton.addTarget(self, action: #selector(starButtonTouchUp), for: .touchUpOutside)
        
        waterEmitterView.center = view.center
        view.addSubview(waterEmitterView)
        
        waterButton.addTarget(self, action: #selector(waterButtonTouchDown), for: .touchDown)
        waterButton.addTarget(self, action: #selector(waterButtonTouchUp), for: .touchUpInside)
        waterButton.addTarget(self, action: #selector(waterButtonTouchUp), for: .touchUpOutside)
    }
    
    func configureCircularButton(button: UIButton, radius: CGFloat) {
        button.layer.cornerRadius = radius
        button.layer.masksToBounds = true
        
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowOpacity = 0.2
        button.layer.shadowRadius = 8
        button.layer.masksToBounds = false
        
        button.addTarget(self, action: #selector(buttonTouchDown(_:)), for: .touchDown)
        button.addTarget(self, action: #selector(buttonTouchUp(_:)), for: .touchUpInside)
        button.addTarget(self, action: #selector(buttonTouchUp(_:)), for: .touchUpOutside)
    }
    
    func configureEditButtonTapArea() {
        let largerFrame = CGRect(
            x: editButton.frame.origin.x - (48 - editButton.frame.size.width) / 2,
            y: editButton.frame.origin.y - (48 - editButton.frame.size.height) / 2,
            width: 48,
            height: 48
        )
        
        let touchAreaView = UIView(frame: largerFrame)
        touchAreaView.backgroundColor = .clear
        touchAreaView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(editButtonTapped(_:)))
        touchAreaView.addGestureRecognizer(tapGesture)
        
        self.view.addSubview(touchAreaView)
    }
    
    @objc func buttonTouchDown(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1) {
            sender.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }
    }
    
    @objc func buttonTouchUp(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1) {
            sender.transform = CGAffineTransform.identity
        }
    }
    
    @objc func editButtonTapped(_ sender: UITapGestureRecognizer) {
        let storyboard = UIStoryboard(name: "SettingName", bundle: nil)
        if let nameSettingVC = storyboard.instantiateViewController(withIdentifier: "NameSettingController") as? NameSettingController {
            nameSettingVC.initialText = name.text
            nameSettingVC.delegate = self
            self.present(nameSettingVC, animated: true, completion: nil)
        }
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
    
    @objc func starButtonTouchDown() {
        starEmitterView.showStar()
    }
    
    @objc func starButtonTouchUp() {
        starEmitterView.hideStar()
    }
    
    @objc func waterButtonTouchDown() {
        waterEmitterView.startWaterEmitter()
    }
    
    @objc func waterButtonTouchUp() {
        waterEmitterView.stopWaterEmitter()
    }
}

extension ViewController: NameSettingControllerDelegate {
    func didSaveName(name: String) {
        self.name.text = name
        saveName(name)
    }
}
