import UIKit

extension UIButton {
    func pulsset () {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.6
        pulse.fromValue = 0.8
        pulse.toValue = 1.2
        pulse.autoreverses = true
        pulse.initialVelocity = 0.5
        pulse.damping = 1
        layer.add(pulse, forKey: nil)
    }
}
