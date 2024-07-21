import UIKit

class HeartEmitterView: UIView {
    private var heartEmitter: CAEmitterLayer?
    
    func startHeartEmitter() {
        let emitter = CAEmitterLayer()
        emitter.emitterPosition = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
        emitter.emitterSize = CGSize(width: 200, height: 200)
        emitter.emitterShape = .rectangle
        
        let love1 = makeEmitterCell(imageName: "love1")
        let love2 = makeEmitterCell(imageName: "love2")
        
        emitter.emitterCells = [love1, love2]
        self.layer.addSublayer(emitter)
        
        heartEmitter = emitter
    }
    
    func stopHeartEmitter() {
        guard let heartEmitter = heartEmitter else { return }
        heartEmitter.birthRate = 0
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            heartEmitter.removeFromSuperlayer()
            self.heartEmitter = nil
        }
    }
    
    private func makeEmitterCell(imageName: String) -> CAEmitterCell {
        let cell = CAEmitterCell()
        cell.contents = UIImage(named: imageName)?.cgImage
        cell.birthRate = 4
        cell.lifetime = 2.0
        cell.velocity = 50
        cell.velocityRange = 50
        cell.emissionRange = .pi * 2
        cell.scale = 0.2
        cell.scaleRange = 0.1
        return cell
    }
}
