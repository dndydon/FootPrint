//
//  FootPrintViewController.swift
//  Footprint
//
//  Created by Don Sleeter on 5/6/18.
//  Copyright © 2018 Don Sleeter. All rights reserved.
//

import UIKit

class FootPrintViewController: UIViewController {
  
  @IBOutlet weak var itemNameLabel: UITextField!
  @IBOutlet weak var footPrintView: FootPrintView!
  @IBOutlet weak var upcLabel: UILabel!
  
  var detailItem: Scan? {
    didSet {
      // Update the view.
      configureView()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureView()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func configureView() {
    // Update the user interface for the detail item.
    if let detail = detailItem {
      if let label = itemNameLabel {
        let dateString = dateFormatter.string(from: detail.timestamp!)
        label.text = dateString
      }
      if let footprint = self.footPrintView {
        footprint.sustainabilityValue = detail.value
        footprint.setNeedsDisplay()
      }
      //if let upcLabel = self.
    }
  }
  
}
