//
//  StyleKit_Gauge.swift
//  ProjectName
//
//  Created by Don Sleeter on 1/12/18.
//  Copyright © 2018 Stone Canyon Software. All rights reserved.
//
//  Generated by PaintCode
//  http://www.paintcodeapp.com
//



import UIKit

public class StyleKit_Gauge : NSObject {

    //// Cache

    private struct Cache {
        static let lowPressureColor: UIColor = UIColor(red: 0.441, green: 0.768, blue: 0.111, alpha: 1.000)
        static let highPressureColor: UIColor = UIColor(red: 0.805, green: 0.169, blue: 0.169, alpha: 1.000)
        static let color: UIColor = UIColor(red: 0.925, green: 0.925, blue: 0.925, alpha: 1.000)
        static let needleColor: UIColor = UIColor(red: 0.136, green: 0.116, blue: 0.116, alpha: 1.000)
        static let mediumPressureColor: UIColor = UIColor(red: 1.000, green: 0.885, blue: 0.203, alpha: 1.000)
        static let strokeColor: UIColor = UIColor(red: 0.437, green: 0.437, blue: 0.437, alpha: 1.000)
        static let shadow: NSShadow = NSShadow(color: UIColor.black.withAlphaComponent(0.66), offset: CGSize(width: 0, height: 1.5), blurRadius: 3)
    }

    //// Colors

    @objc dynamic public class var lowPressureColor: UIColor { return Cache.lowPressureColor }
    @objc dynamic public class var highPressureColor: UIColor { return Cache.highPressureColor }
    @objc dynamic public class var color: UIColor { return Cache.color }
    @objc dynamic public class var needleColor: UIColor { return Cache.needleColor }
    @objc dynamic public class var mediumPressureColor: UIColor { return Cache.mediumPressureColor }
    @objc dynamic public class var strokeColor: UIColor { return Cache.strokeColor }

    //// Shadows

    @objc dynamic public class var shadow: NSShadow { return Cache.shadow }

    //// Drawing Methods

    @objc dynamic public class func drawGauge(frame: CGRect = CGRect(x: 0, y: 0, width: 240, height: 240), pressure: CGFloat = 0.5, yellowLine: CGFloat = 0.66, redLine: CGFloat = 0.75) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        // This non-generic function dramatically improves compilation times of complex expressions.
        func fastFloor(_ x: CGFloat) -> CGFloat { return floor(x) }


        //// Variable Declarations
        let angle: CGFloat = -241 * pressure
        let limitingColor = pressure > redLine ? StyleKit_Gauge.highPressureColor : (pressure > yellowLine ? StyleKit_Gauge.mediumPressureColor : StyleKit_Gauge.lowPressureColor)
        let lowestValue: CGFloat = -359
        let highestValue: CGFloat = -241
        let range: CGFloat = highestValue - lowestValue
        let redYellowLowerLimit: CGFloat = -0.333 * range
        let yellowAngle: CGFloat = yellowLine < redYellowLowerLimit ? redYellowLowerLimit : (yellowLine > redLine ? highestValue * redLine : highestValue * yellowLine)
        let redAngle: CGFloat = redLine < redYellowLowerLimit ? redYellowLowerLimit : highestValue * redLine


        //// Subframes
        let group: CGRect = CGRect(x: frame.minX + fastFloor((frame.width - 240) / 2 + 0.5) + 0, y: frame.minY + fastFloor((frame.height - 240) / 2 - 0.5) + 1, width: 240, height: 240)


        //// Group
        //// Outer Frame Drawing
        context.saveGState()
        context.translateBy(x: group.minX + 119.87, y: group.minY + 120.13)

        let outerFramePath = UIBezierPath(ovalIn: CGRect(x: -94.9, y: -94.9, width: 189.8, height: 189.8))
        context.saveGState()
        context.setShadow(offset: StyleKit_Gauge.shadow.shadowOffset, blur: StyleKit_Gauge.shadow.shadowBlurRadius, color: (StyleKit_Gauge.shadow.shadowColor as! UIColor).cgColor)
        StyleKit_Gauge.color.setFill()
        outerFramePath.fill()
        context.restoreGState()

        StyleKit_Gauge.strokeColor.setStroke()
        outerFramePath.lineWidth = 1
        outerFramePath.stroke()

        context.restoreGState()


        //// GreenZone Drawing
        context.saveGState()
        context.translateBy(x: group.minX + 120.43, y: group.minY + 119.96)
        context.rotate(by: 150 * CGFloat.pi/180)

        let greenZoneRect = CGRect(x: -87.53, y: -87.53, width: 175.51, height: 175.51)
        let greenZonePath = UIBezierPath()
        greenZonePath.addArc(withCenter: CGPoint(x: greenZoneRect.midX, y: greenZoneRect.midY), radius: greenZoneRect.width / 2, startAngle: 359 * CGFloat.pi/180, endAngle: -(yellowAngle - 359.76) * CGFloat.pi/180, clockwise: true)
        greenZonePath.addLine(to: CGPoint(x: greenZoneRect.midX, y: greenZoneRect.midY))
        greenZonePath.close()

        StyleKit_Gauge.lowPressureColor.setFill()
        greenZonePath.fill()
        StyleKit_Gauge.lowPressureColor.setStroke()
        greenZonePath.lineWidth = 0.5
        greenZonePath.stroke()

        context.restoreGState()


        //// YellowZone Drawing
        context.saveGState()
        context.translateBy(x: group.minX + 120.18, y: group.minY + 120.21)
        context.rotate(by: 150 * CGFloat.pi/180)

        let yellowZoneRect = CGRect(x: -87.53, y: -87.53, width: 175.51, height: 175.51)
        let yellowZonePath = UIBezierPath()
        yellowZonePath.addArc(withCenter: CGPoint(x: yellowZoneRect.midX, y: yellowZoneRect.midY), radius: yellowZoneRect.width / 2, startAngle: -yellowAngle * CGFloat.pi/180, endAngle: -redAngle * CGFloat.pi/180, clockwise: true)
        yellowZonePath.addLine(to: CGPoint(x: yellowZoneRect.midX, y: yellowZoneRect.midY))
        yellowZonePath.close()

        StyleKit_Gauge.mediumPressureColor.setFill()
        yellowZonePath.fill()
        StyleKit_Gauge.mediumPressureColor.setStroke()
        yellowZonePath.lineWidth = 0.5
        yellowZonePath.stroke()

        context.restoreGState()


        //// RedZone Drawing
        context.saveGState()
        context.translateBy(x: group.minX + 120.43, y: group.minY + 119.96)
        context.rotate(by: 150 * CGFloat.pi/180)

        let redZoneRect = CGRect(x: -87.53, y: -87.53, width: 175.51, height: 175.51)
        let redZonePath = UIBezierPath()
        redZonePath.addArc(withCenter: CGPoint(x: redZoneRect.midX, y: redZoneRect.midY), radius: redZoneRect.width / 2, startAngle: -redAngle * CGFloat.pi/180, endAngle: 241 * CGFloat.pi/180, clockwise: true)
        redZonePath.addLine(to: CGPoint(x: redZoneRect.midX, y: redZoneRect.midY))
        redZonePath.close()

        StyleKit_Gauge.highPressureColor.setFill()
        redZonePath.fill()
        StyleKit_Gauge.highPressureColor.setStroke()
        redZonePath.lineWidth = 0.5
        redZonePath.stroke()

        context.restoreGState()


        //// Oval Drawing
        context.saveGState()
        context.translateBy(x: group.minX + 120.41, y: group.minY + 120.43)

        let ovalPath = UIBezierPath(ovalIn: CGRect(x: -55.98, y: -55.98, width: 110.47, height: 110.47))
        StyleKit_Gauge.color.setFill()
        ovalPath.fill()

        context.restoreGState()


        //// Scale Frame Drawing
        context.saveGState()
        context.translateBy(x: group.minX + 120.18, y: group.minY + 120.21)

        let scaleFramePath = UIBezierPath()
        scaleFramePath.move(to: CGPoint(x: -65.05, y: 38.96))
        scaleFramePath.addCurve(to: CGPoint(x: -37.56, y: -67.49), controlPoint1: CGPoint(x: -85.79, y: 1.69), controlPoint2: CGPoint(x: -73.48, y: -45.97))
        scaleFramePath.addCurve(to: CGPoint(x: 65.05, y: -38.96), controlPoint1: CGPoint(x: -1.63, y: -89.01), controlPoint2: CGPoint(x: 44.31, y: -76.24))
        scaleFramePath.addCurve(to: CGPoint(x: 65.05, y: 38.96), controlPoint1: CGPoint(x: 78.47, y: -14.85), controlPoint2: CGPoint(x: 78.47, y: 14.85))
        scaleFramePath.addLine(to: CGPoint(x: 42.84, y: 25.66))
        scaleFramePath.addCurve(to: CGPoint(x: 42.84, y: -25.66), controlPoint1: CGPoint(x: 51.67, y: 9.78), controlPoint2: CGPoint(x: 51.67, y: -9.78))
        scaleFramePath.addCurve(to: CGPoint(x: -24.73, y: -44.44), controlPoint1: CGPoint(x: 29.18, y: -50.2), controlPoint2: CGPoint(x: -1.07, y: -58.61))
        scaleFramePath.addCurve(to: CGPoint(x: -42.84, y: 25.66), controlPoint1: CGPoint(x: -48.39, y: -30.27), controlPoint2: CGPoint(x: -56.5, y: 1.11))
        scaleFramePath.addLine(to: CGPoint(x: -65.05, y: 38.96))
        scaleFramePath.close()
        UIColor.white.setFill()
        scaleFramePath.fill()

        ////// Scale Frame Inner Shadow
        context.saveGState()
        context.clip(to: scaleFramePath.bounds)
        context.setShadow(offset: CGSize.zero, blur: 0)
        context.setAlpha((StyleKit_Gauge.shadow.shadowColor as! UIColor).cgColor.alpha)
        context.beginTransparencyLayer(auxiliaryInfo: nil)
        let scaleFrameOpaqueShadow = (StyleKit_Gauge.shadow.shadowColor as! UIColor).withAlphaComponent(1)
        context.setShadow(offset: StyleKit_Gauge.shadow.shadowOffset, blur: StyleKit_Gauge.shadow.shadowBlurRadius, color: scaleFrameOpaqueShadow.cgColor)
        context.setBlendMode(.sourceOut)
        context.beginTransparencyLayer(auxiliaryInfo: nil)

        scaleFrameOpaqueShadow.setFill()
        scaleFramePath.fill()

        context.endTransparencyLayer()
        context.endTransparencyLayer()
        context.restoreGState()

        StyleKit_Gauge.strokeColor.setStroke()
        scaleFramePath.lineWidth = 1
        scaleFramePath.stroke()

        context.restoreGState()


        //// Display Drawing
        let displayPath = UIBezierPath()
        displayPath.move(to: CGPoint(x: group.minX + 161.98, y: group.minY + 197.34))
        displayPath.addCurve(to: CGPoint(x: group.minX + 77.56, y: group.minY + 197.34), controlPoint1: CGPoint(x: group.minX + 135, y: group.minY + 211.96), controlPoint2: CGPoint(x: group.minX + 104.54, y: group.minY + 211.96))
        displayPath.addLine(to: CGPoint(x: group.minX + 88.16, y: group.minY + 175.67))
        displayPath.addCurve(to: CGPoint(x: group.minX + 119.11, y: group.minY + 184), controlPoint1: CGPoint(x: group.minX + 97.3, y: group.minY + 181.07), controlPoint2: CGPoint(x: group.minX + 108.01, y: group.minY + 183.96))
        displayPath.addCurve(to: CGPoint(x: group.minX + 151.39, y: group.minY + 175.67), controlPoint1: CGPoint(x: group.minX + 130.4, y: group.minY + 184.05), controlPoint2: CGPoint(x: group.minX + 142.09, y: group.minY + 181.16))
        displayPath.addLine(to: CGPoint(x: group.minX + 161.98, y: group.minY + 197.34))
        displayPath.close()
        limitingColor.setFill()
        displayPath.fill()

        ////// Display Inner Shadow
        context.saveGState()
        context.clip(to: displayPath.bounds)
        context.setShadow(offset: CGSize.zero, blur: 0)
        context.setAlpha((StyleKit_Gauge.shadow.shadowColor as! UIColor).cgColor.alpha)
        context.beginTransparencyLayer(auxiliaryInfo: nil)
        let displayOpaqueShadow = (StyleKit_Gauge.shadow.shadowColor as! UIColor).withAlphaComponent(1)
        context.setShadow(offset: StyleKit_Gauge.shadow.shadowOffset, blur: StyleKit_Gauge.shadow.shadowBlurRadius, color: displayOpaqueShadow.cgColor)
        context.setBlendMode(.sourceOut)
        context.beginTransparencyLayer(auxiliaryInfo: nil)

        displayOpaqueShadow.setFill()
        displayPath.fill()

        context.endTransparencyLayer()
        context.endTransparencyLayer()
        context.restoreGState()

        StyleKit_Gauge.strokeColor.setStroke()
        displayPath.lineWidth = 0.5
        displayPath.stroke()


        //// Arrow Drawing
        context.saveGState()
        context.translateBy(x: group.minX + 119.78, y: group.minY + 120.23)
        context.rotate(by: -(angle + 120) * CGFloat.pi/180)

        let arrowPath = UIBezierPath()
        arrowPath.move(to: CGPoint(x: -8.78, y: 27.06))
        arrowPath.addLine(to: CGPoint(x: -8.78, y: 9.67))
        arrowPath.addLine(to: CGPoint(x: -6.58, y: -9.67))
        arrowPath.addLine(to: CGPoint(x: -6.58, y: -63.79))
        arrowPath.addLine(to: CGPoint(x: 0, y: -71.53))
        arrowPath.addLine(to: CGPoint(x: 6.58, y: -63.79))
        arrowPath.addLine(to: CGPoint(x: 6.58, y: -9.67))
        arrowPath.addLine(to: CGPoint(x: 8.78, y: 9.67))
        arrowPath.addLine(to: CGPoint(x: 8.78, y: 27.06))
        arrowPath.addLine(to: CGPoint(x: -8.78, y: 27.06))
        arrowPath.close()
        context.saveGState()
        context.setShadow(offset: StyleKit_Gauge.shadow.shadowOffset, blur: StyleKit_Gauge.shadow.shadowBlurRadius, color: (StyleKit_Gauge.shadow.shadowColor as! UIColor).cgColor)
        StyleKit_Gauge.needleColor.setFill()
        arrowPath.fill()
        context.restoreGState()

        StyleKit_Gauge.needleColor.setStroke()
        arrowPath.lineWidth = 2
        arrowPath.lineJoinStyle = .round
        arrowPath.stroke()

        context.restoreGState()


        //// Center Oval Drawing
        context.saveGState()
        context.translateBy(x: group.minX + 120.42, y: group.minY + 120.45)

        let centerOvalPath = UIBezierPath(ovalIn: CGRect(x: -11.38, y: -11.38, width: 22.76, height: 22.76))
        context.saveGState()
        context.setShadow(offset: StyleKit_Gauge.shadow.shadowOffset, blur: StyleKit_Gauge.shadow.shadowBlurRadius, color: (StyleKit_Gauge.shadow.shadowColor as! UIColor).cgColor)
        UIColor.white.setFill()
        centerOvalPath.fill()
        context.restoreGState()

        StyleKit_Gauge.strokeColor.setStroke()
        centerOvalPath.lineWidth = 1
        centerOvalPath.stroke()

        context.restoreGState()
    }

}



private extension NSShadow {
    convenience init(color: AnyObject!, offset: CGSize, blurRadius: CGFloat) {
        self.init()
        self.shadowColor = color
        self.shadowOffset = offset
        self.shadowBlurRadius = blurRadius
    }
}