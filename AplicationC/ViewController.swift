import UIKit
import SwiftUI
import Lottie


class ViewController: UIViewController {
    
    @IBOutlet weak var stackV: UIStackView!
    @IBOutlet weak var coreView: UIView!
    @IBOutlet weak var coreBtn: UIButton!
    @IBOutlet weak var lottieBtn: UIButton!
    @IBOutlet weak var under: UIImageView!
    @IBOutlet weak var under2: UIImageView!
    
    private var lottieAnimationView: LottieAnimationView!
    
    private let picNames = ["wired-lineal-35-edit", "wired-lineal-27-globe", "wired-lineal-146-basket-trolley-shopping-card", "wired-lineal-2030-frysztak-town", "wired-lineal-1122-thumb-down"]
    
    private var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lottieAnimationViewSetup()
    }
    
    
    @IBAction func coreAnBtb(_ sender: UIButton) {
        sender.pulsset()
        UIImageView.animate(withDuration: 1,
                            delay: 0,
                            options: [.autoreverse, .repeat]) {
            self.under.frame.origin.x += -80
            self.under2.frame.origin.x += +80
        } completion: { complete in
            print(complete)
        }
    }
    
    @IBAction func lottieAnV(_ sender: UIButton) {
        sender.pulsset()
            startTimer()
        lottieAnimationView.play()
        }
    
    private func lottieAnimationViewSetup() {
            if let picName = getRandomAnimationName() {
                lottieAnimationView = LottieAnimationView(name: picName)
                lottieAnimationView.heightAnchor.constraint(equalToConstant: 200).isActive = true
                lottieAnimationView.contentMode = .scaleAspectFit
                lottieAnimationView.loopMode = .loop
                lottieAnimationView.animationSpeed = 0.5
                stackV.addArrangedSubview(lottieAnimationView)
            }
        }
        
    private func getRandomAnimationName() -> String? {
         guard !picNames.isEmpty else { return nil }
         let randomIndex = Int.random(in: 0..<picNames.count)
         return picNames[randomIndex]
     }
        
    private func startTimer() {
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateAnimation), userInfo: nil, repeats: true)
        }
   
    @objc private func updateAnimation() {
          if let picName = getRandomAnimationName() {
              lottieAnimationView = LottieAnimationView(name: picName)
              lottieAnimationView.play(fromProgress: 0, toProgress: 1, completion: { [weak self] completed in
                  self?.updateAnimation()
              })
          }
      }
        
        deinit {
            timer?.invalidate()
        }
    }

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
