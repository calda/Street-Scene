//
//  BuildingGenerator.swift
//  Street Scene
//
//  Created by Cal on 9/6/15.
//  Copyright © 2015 Cal. All rights reserved.
//

import Foundation
import SpriteKit

struct BuildingGenerator : Generator {
    
    var nodes: [SKSpriteNode] = []
    var owningScene: SKScene
    var yForNewNode: CGFloat = 0.0
    
    var maximumSpacing: CGFloat {
        return -20.0
    }
    var minimumSpacing: CGFloat {
        return -20.0
    }
    
    init(scene: SKScene) {
        owningScene = scene
        
        for _ in 0...5 {
            nodesUpdated()
        }
    }
    
    func getNewNode() -> SKSpriteNode {
        let number = randomBetween(1, 7)
        let imageName = "building-base-colored\(number)"
        let node = SKSpriteNode(imageNamed: imageName)
        node.name = "\(random())"
        return node
    }
    
}