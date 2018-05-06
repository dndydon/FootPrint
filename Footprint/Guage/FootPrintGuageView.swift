//
//  FootPrintGuageView.swift
//  Footprint
//
//  Created by Don Sleeter on 5/6/18.
//  Copyright © 2018 Don Sleeter. All rights reserved.
//

import UIKit

class FootPrintGuageView: UIView {

  /// Default values for properties
  @IBInspectable public var value: Float = 0.50
  @IBInspectable public var yellowLine: Float = 0.66
  @IBInspectable public var redLine: Float = 0.75
  
  override func draw(_ rect: CGRect) {
    //let myFrame = self.frame
    StyleKit_Gauge.drawGauge(frame: self.bounds, pressure: CGFloat(self.value), yellowLine: CGFloat(self.yellowLine), redLine: CGFloat(self.redLine))
  }
}
