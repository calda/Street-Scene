//
//  BuildingGenerator.swift
//  Street Scene
//
//  Created by Cal on 9/6/15.
//  Copyright © 2015 Cal. All rights reserved.
//

import Foundation
import SpriteKit

struct PersonGenerator : Generator {
    
    var nodes: [SKSpriteNode] = []
    var owningScene: SKScene
    var yForNewNode: CGFloat = 0.0
    var peoplePictures: [String] = []
    var zPosition: Int = 1
    
    var maximumSpacing: CGFloat {
        return 50.0
    }
    var minimumSpacing: CGFloat {
        return -100.0
    }
    
    init(scene: SKScene, zPosition: Int) {
        owningScene = scene
        self.zPosition = zPosition
        
        //get all people image names
        let files = try! FileManager.default.contentsOfDirectory(atPath: Bundle.main.resourcePath!)
        for file in files {
            print(file)
            if file.hasPrefix("person-") {
                peoplePictures.append(file)
            }
        }
        
        for _ in 0...5 {
            nodesUpdated()
        }
    }
    
    func getNewNode() -> (node: SKSpriteNode, aspectRatio: CGFloat) {
        let number = randomBetween(0, peoplePictures.count - 1)
        let imageName = peoplePictures[number]
        let node = SKSpriteNode(imageNamed: imageName)
        node.name = "\(arc4random())"
        print(imageName)
        return (node, 0.2694)
    }
    
}
