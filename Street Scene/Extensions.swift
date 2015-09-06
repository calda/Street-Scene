//
//  SKNode.swift
//  Street Scene
//
//  Created by Cal on 9/6/15.
//  Copyright © 2015 Cal. All rights reserved.
//

import Foundation
import SpriteKit

func randomBetween(first: Int, _ second: Int) -> Int {
    return Int(arc4random_uniform(UInt32(second - first))) + first
}

extension SKSpriteNode {
    
    func moveTo(point: CGPoint) {
        let size = self.size
        self.position = CGPointMake(point.x + size.width / 2, point.y + size.height / 2)
    }
    
    func currentPosition() -> CGPoint {
        let size = self.size
        let position = self.position
        return CGPointMake(position.x - size.width / 2, position.y - size.height / 2)
    }
    
    func resize(size: CGSize) {
        let position = currentPosition()
        self.size = size
        moveTo(position)
    }
    
}

//MARK: - CGPoint

func + (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPointMake(left.x + right.x, left.y + right.y)
}

func + (left: CGPoint, right: CGFloat) -> CGPoint {
    return CGPointMake(left.x + right, left.y + right)
}

func - (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPointMake(left.x - right.x, left.y - right.y)
}

func * (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPointMake(left.x * right.x, left.y * right.y)
}

func / (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPointMake(left.x / right.x, left.y / right.y)
}

func * (left: CGPoint, right: CGFloat) -> CGPoint {
    return CGPointMake(left.x * right, left.y * right)
}

func / (left: CGPoint, right: CGFloat) -> CGPoint {
    return CGPointMake(left.x / right, left.y / right)
}

func / (left: CGFloat, right: CGPoint) -> CGPoint {
    return CGPointMake(left / right.x, left / right.x)
}

func ^ (left: CGPoint, right: CGFloat) -> CGPoint {
    return CGPointMake(pow(left.x, right), pow(left.y, right))
}

func ^ (left: CGFloat, right: CGFloat) -> CGFloat {
    return pow(left, right)
}

extension CGPoint{
    
    func distanceSquaredTo(other: CGPoint) -> CGFloat {
        return abs(pow(self.x - other.x, 2) + pow(self.y - other.y, 2))
    }
    
    func distanceTo(other: CGPoint) -> CGFloat {
        return sqrt(distanceSquaredTo(other))
    }
    
    func distanceVector(other: CGPoint) -> CGVector {
        return CGVectorMake(self.x - other.x, self.y - other.y)
    }
    
    func asVector() -> CGVector {
        return CGVectorMake(x, y)
    }
    
}

//MARK: - CGVector

func + (left: CGVector, right: CGVector) -> CGVector {
    return CGVectorMake(left.dx + right.dx, left.dy + right.dy)
}

func + (left: CGVector, right: CGFloat) -> CGVector {
    return CGVectorMake(left.dx + right, left.dy + right)
}

func - (left: CGVector, right: CGVector) -> CGVector {
    return CGVectorMake(left.dx - right.dx, left.dy - right.dy)
}

func * (left: CGVector, right: CGVector) -> CGVector {
    return CGVectorMake(left.dx * right.dx, left.dy * right.dy)
}

func / (left: CGVector, right: CGVector) -> CGVector {
    return CGVectorMake(left.dx / right.dx, left.dy / right.dy)
}

func * (left: CGVector, right: CGFloat) -> CGVector {
    return CGVectorMake(left.dx * right, left.dy * right)
}

func / (left: CGVector, right: CGFloat) -> CGVector {
    return CGVectorMake(left.dx / right, left.dy / right)
}

func / (left: CGFloat, right: CGVector) -> CGVector {
    return CGVectorMake(left / right.dx, left / right.dx)
}

func ^ (left: CGVector, right: CGFloat) -> CGVector {
    return CGVectorMake(pow(left.dx, right), pow(left.dy, right))
}