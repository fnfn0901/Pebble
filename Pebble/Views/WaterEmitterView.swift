import UIKit

class WaterEmitterView: UIView {
    private var waterEmitter: CAEmitterLayer?
    private let emitterSize: CGSize = CGSize(width: 700, height: 200)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupEmitterView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupEmitterView()
    }
    
    private func setupEmitterView() {
        self.frame = CGRect(x: 0, y: 0, width: emitterSize.width, height: emitterSize.height)
        self.center = superview?.center ?? CGPoint.zero
        self.clipsToBounds = true
    }
    
    func startWaterEmitter() {
        let emitter = CAEmitterLayer()
        emitter.frame = self.bounds
        emitter.emitterPosition = CGPoint(x: self.bounds.midX, y: 0)
        emitter.emitterSize = CGSize(width: self.bounds.size.width, height: 1)
        emitter.emitterShape = .line
        
        let water1 = makeEmitterCell(imageName: "water1", size: CGSize(width: 36, height: 72))
        let water2 = makeEmitterCell(imageName: "water2", size: CGSize(width: 45, height: 81))
        let water3 = makeEmitterCell(imageName: "water3", size: CGSize(width: 32, height: 60))
        
        emitter.emitterCells = [water1, water2, water3]
        
        self.layer.addSublayer(emitter)
        
        waterEmitter = emitter
    }
    
    func stopWaterEmitter() {
        guard let waterEmitter = waterEmitter else { return }
        waterEmitter.birthRate = 0
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            waterEmitter.removeFromSuperlayer()
            self.waterEmitter = nil
        }
    }
    
    private func makeEmitterCell(imageName: String, size: CGSize) -> CAEmitterCell {
        let cell = CAEmitterCell()
        cell.contents = UIImage(named: imageName)?.cgImage
        cell.birthRate = 3
        cell.lifetime = 4.0
        cell.velocity = 90
        cell.velocityRange = 30
        cell.emissionLongitude = .pi
        cell.scale = size.width / 100.0
        cell.scaleRange = size.height / 400.0
        cell.yAcceleration = 50
        cell.xAcceleration = 0
        
        return cell
    }
}
