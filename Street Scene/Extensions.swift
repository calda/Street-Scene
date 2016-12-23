//
//  SKNode.swift
//  Street Scene
//
//  Created by Cal on 9/6/15.
//  Copyright © 2015 Cal. All rights reserved.
//

import Foundation
import SpriteKit

func randomBetween(_ first: Int, _ second: Int) -> Int {
    return Int(arc4random_uniform(UInt32(second - first))) + first
}

extension SKSpriteNode {
    
    func moveTo(_ point: CGPoint) {
        let size = self.size
        self.position = CGPoint(x: point.x + size.width / 2, y: point.y + size.height / 2)
    }
    
    func currentPosition() -> CGPoint {
        let size = self.size
        let position = self.position
        return CGPoint(x: position.x - size.width / 2, y: position.y - size.height / 2)
    }
    
    func resize(_ size: CGSize) {
        let position = currentPosition()
        self.size = size
        moveTo(position)
    }
    
}

//MARK: - CGPoint

func + (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x + right.x, y: left.y + right.y)
}

func + (left: CGPoint, right: CGFloat) -> CGPoint {
    return CGPoint(x: left.x + right, y: left.y + right)
}

func - (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x - right.x, y: left.y - right.y)
}

func * (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x * right.x, y: left.y * right.y)
}

func / (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x / right.x, y: left.y / right.y)
}

func * (left: CGPoint, right: CGFloat) -> CGPoint {
    return CGPoint(x: left.x * right, y: left.y * right)
}

func / (left: CGPoint, right: CGFloat) -> CGPoint {
    return CGPoint(x: left.x / right, y: left.y / right)
}

func / (left: CGFloat, right: CGPoint) -> CGPoint {
    return CGPoint(x: left / right.x, y: left / right.x)
}

func ^ (left: CGPoint, right: CGFloat) -> CGPoint {
    return CGPoint(x: pow(left.x, right), y: pow(left.y, right))
}

func ^ (left: CGFloat, right: CGFloat) -> CGFloat {
    return pow(left, right)
}

extension CGPoint{
    
    func distanceSquaredTo(_ other: CGPoint) -> CGFloat {
        return abs(pow(self.x - other.x, 2) + pow(self.y - other.y, 2))
    }
    
    func distanceTo(_ other: CGPoint) -> CGFloat {
        return sqrt(distanceSquaredTo(other))
    }
    
    func distanceVector(_ other: CGPoint) -> CGVector {
        return CGVector(dx: self.x - other.x, dy: self.y - other.y)
    }
    
    func asVector() -> CGVector {
        return CGVector(dx: x, dy: y)
    }
    
}

//MARK: - CGVector

func + (left: CGVector, right: CGVector) -> CGVector {
    return CGVector(dx: left.dx + right.dx, dy: left.dy + right.dy)
}

func + (left: CGVector, right: CGFloat) -> CGVector {
    return CGVector(dx: left.dx + right, dy: left.dy + right)
}

func - (left: CGVector, right: CGVector) -> CGVector {
    return CGVector(dx: left.dx - right.dx, dy: left.dy - right.dy)
}

func * (left: CGVector, right: CGVector) -> CGVector {
    return CGVector(dx: left.dx * right.dx, dy: left.dy * right.dy)
}

func / (left: CGVector, right: CGVector) -> CGVector {
    return CGVector(dx: left.dx / right.dx, dy: left.dy / right.dy)
}

func * (left: CGVector, right: CGFloat) -> CGVector {
    return CGVector(dx: left.dx * right, dy: left.dy * right)
}

func / (left: CGVector, right: CGFloat) -> CGVector {
    return CGVector(dx: left.dx / right, dy: left.dy / right)
}

func / (left: CGFloat, right: CGVector) -> CGVector {
    return CGVector(dx: left / right.dx, dy: left / right.dx)
}

func ^ (left: CGVector, right: CGFloat) -> CGVector {
    return CGVector(dx: pow(left.dx, right), dy: pow(left.dy, right))
}
