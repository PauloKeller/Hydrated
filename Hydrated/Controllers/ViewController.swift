//
//  ViewController.swift
//  Hydrated
//
//  Created by Paulo Keller on 22/12/23.
//

import UIKit
import Lottie

class ViewController: BaseViewController {
  @IBOutlet weak var animationView: LottieAnimationView!
  @IBOutlet weak var intervalLabel: UILabel!
  
  private let manager = LocalNotificationManager.shared
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    viewConfiguration()
  }
  
  private func viewConfiguration() {
    title = "Hydrated"
    
    setupAnimationView()
    
    LocalNotificationModel.checkNotificationPermission { isGranted, error in
      if let error = error {
        self.showErrorAlert(with: error.localizedDescription)
      }
    }
    
    intervalLabel.text = "You need to drink water every \(Int(manager.model.hours)) hours"
  }
  
  private func setupAnimationView() {
    animationView.loopMode = .loop
    animationView.contentMode = .scaleAspectFit
    animationView.animation = LottieAnimation.named("WaterAnimation")
    animationView.play()
  }
}

