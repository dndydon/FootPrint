//
//  FootPrintView.swift
//  Footprint
//
//  Created by Don Sleeter on 5/5/18.
//  Copyright © 2018 Don Sleeter. All rights reserved.
//

import UIKit

@IBDesignable
class FootPrintView: UIView {

  /// Default values for properties
  @IBInspectable var sustainabilityValue: Float = 0.50
  @IBInspectable public var yellowLine: Float = 0.66
  @IBInspectable public var redLine: Float = 0.75
  
  override func draw(_ rect: CGRect) {
    FootPrintStyleKit.drawEcoPrint(frame: self.bounds, resizing: .aspectFit, value: 0.44)
    //drawFootPrintWorldView(frame: self.bounds, resizing: .aspectFill)
  }

  
  override var description: String {
    return "FootPrint is (\(sustainabilityValue)"
  }
  
}
