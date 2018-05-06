//
//  DetailViewController.swift
//  GaugeApp
//
//  Created by Don Sleeter on 1/11/18.
//  Copyright © 2018 Don Sleeter. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  @IBOutlet weak var detailDescriptionLabel: UILabel!
  @IBOutlet weak var gauge: FootPrintGuageView!
  @IBOutlet weak var valueSlider: UISlider!
  @IBOutlet weak var warningSlider: UISlider!
  @IBOutlet weak var dangerSlider: UISlider!
  
  var detailItem: Scan? {
    didSet {
      // Update the view.
      configureView()
    }
  }
  
  @IBAction func sliderAction(_ sender: Any) {
    switch (sender as! UISlider).restorationIdentifier! {
    case "pressure":
      gauge.value = valueSlider.value
    case "warning":
      gauge.yellowLine = warningSlider.value
    case "danger":
      gauge.redLine = dangerSlider.value
    default:
      fatalError()
    }
    gauge.setNeedsDisplay()
    
    /// save any changes
    if let detail = detailItem {
      do {
        try detail.managedObjectContext?.save()
      } catch let err {
        dump(err.localizedDescription)
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    configureView()
  }
  
  func configureView() {
    // Update the user interface for the detail item.
    if let detail = detailItem {
      if let label = detailDescriptionLabel {
        let dateString = dateFormatter.string(from: detail.timestamp!)
        label.text = dateString
      }
      if let gauge = self.gauge {
        self.valueSlider.value = detail.value
        gauge.value = detail.value
        self.warningSlider.value = 0.66
        gauge.yellowLine = 0.66
        self.dangerSlider.value = 0.75
        //        gauge.redLine = detail.danger
        gauge.setNeedsDisplay()
      }
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  
  
}

