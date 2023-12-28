//
//  BaseViewController.swift
//  Hydrated
//
//  Created by Paulo Keller on 27/12/23.
//

import UIKit

class BaseViewController: UIViewController {
  
  func showErrorAlert(with message: String) {
    let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in }))
    present(alert, animated: true, completion: nil)
  }
}
