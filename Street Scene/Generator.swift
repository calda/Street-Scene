//
//  Generator.swift
//  Street Scene
//
//  Created by Cal on 9/6/15.
//  Copyright © 2015 Cal. All rights reserved.
//

import Foundation
import SpriteKit

protocol Generator {
    
    var nodes: [SKSpriteNode] { get set }
    var owningScene: SKScene { get set }
    var screenWidth: CGFloat { get }
    var screenHeight: CGFloat { get }
    var yForNewNode: CGFloat { get }
    var zPosition: Int { get }
    
    //to be customized on each generator
    var minimumSpacing: CGFloat { get }
    var maximumSpacing: CGFloat { get }
    
    var edgeBufferWidth: CGFloat { get }
    
    mutating func nodesUpdated()
    mutating func generateNewNode(atFront: Bool)
    func getNewNode() -> (node: SKSpriteNode, aspectRatio: CGFloat)
    mutating func removeNode(_ node: SKSpriteNode)
    
    func borderOfGroup() -> (left: (position: CGFloat, node: SKSpriteNode?), right: (position: CGFloat, node: SKSpriteNode?))
    
}

extension Generator {
    
    var edgeBufferWidth: CGFloat {
        return 500.0
    }
    
    var screenWidth: CGFloat {
        return UIScreen.main.bounds.width * UIScreen.main.scale
    }
    
    var screenHeight: CGFloat {
        return UIScreen.main.bounds.height * UIScreen.main.scale
    }
    
    func borderOfGroup() -> (left: (position: CGFloat, node: SKSpriteNode?), right: (position: CGFloat, node: SKSpriteNode?)) {
        var left: (position: CGFloat, node: SKSpriteNode?) = (0, nil)
        var right: (position: CGFloat, node: SKSpriteNode?) = (0, nil)
        
        for node in nodes {
            let leftBorder = node.currentPosition().x
            let rightBorder = node.currentPosition().x + node.size.width
            
            if leftBorder < left.position {
                left = (leftBorder, node)
            }
            
            if rightBorder > right.position {
                right = (rightBorder, node)
            }
        }
        
        return (left, right)
    }
    
    mutating func nodesUpdated() {
        let (left, right) = self.borderOfGroup()
        
        //check for adding new nodes
        if left.position > -100 { generateNewNode(atFront: false) }
        if right.position < screenWidth + 100 { generateNewNode(atFront: true) }
        
        //check for deleting old nodes
        if let leftNode = left.node, left.position < -edgeBufferWidth { removeNode(leftNode) }
        if let rightNode = right.node, right.position > screenWidth + edgeBufferWidth { removeNode(rightNode) }
    }
    
    mutating func generateNewNode(atFront: Bool) {
        let (node, aspectRatio) = getNewNode()
        let size = CGSize(width: screenHeight * aspectRatio, height: screenHeight)
        let (left, right) = borderOfGroup()
        let position: CGFloat
        
        if atFront {
            position = (right.position) + getSpacingForNode()
        }
        else {
            position = (left.position - size.width) - getSpacingForNode()
        }
        
        addNode(node, position: CGPoint(x: position, y: yForNewNode), size: size)
    }
    
    func getSpacingForNode() -> CGFloat {
        let min = minimumSpacing
        let max = maximumSpacing
        if min == max { return max }
        
        let random = randomBetween(Int(min), Int(max))
        return CGFloat(random)
    }
    
    mutating func addNode(_ node: SKSpriteNode, position: CGPoint, size: CGSize) {
        node.zPosition = CGFloat(self.zPosition)
        node.resize(size)
        node.moveTo(position)
        nodes.append(node)
        owningScene.addChild(node)
    }
    
    mutating func removeNode(_ node: SKSpriteNode) {
        for index in 0 ..< nodes.count {
            if nodes[index].name == node.name {
                //print("Removing \(node.name!) at \(index) (count is currently \(nodes.count))")
                nodes.remove(at: index)
                //print("(count is currently \(nodes.count))")
                break
            }
        }
        node.removeFromParent()
    }
    
}
