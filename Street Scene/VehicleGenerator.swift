//
//  BuildingGenerator.swift
//  Street Scene
//
//  Created by Cal on 9/6/15.
//  Copyright © 2015 Cal. All rights reserved.
//

import Foundation
import SpriteKit

struct VehicleGenerator : Generator {
    
    var nodes: [SKSpriteNode] = []
    var owningScene: SKScene
    var yForNewNode: CGFloat = 0.0
    var peoplePictures: [String] = []
    var zPosition: Int = 1
    let imagePrefix: String
    
    var maximumSpacing: CGFloat {
        return imagePrefix == "vehicle-right" ? 700.0 : 400.0
    }
    var minimumSpacing: CGFloat {
        return imagePrefix == "vehicle-right" ? 150.0 : 0.0
    }
    var edgeBufferWidth: CGFloat {
        return 1000.0
    }
    
    init(scene: SKScene, zPosition: Int, withPrefix prefix: String) {
        imagePrefix = prefix
        owningScene = scene
        self.zPosition = zPosition
        
        //get all people image names
        let files = try! NSFileManager.defaultManager().contentsOfDirectoryAtPath(NSBundle.mainBundle().resourcePath!)
        for file in files {
            print(file)
            if file.hasPrefix(imagePrefix) {
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
        let image = UIImage(named: imageName)!
        
        let size = image.size
        let aspect = size.width / size.height
        
        let node = SKSpriteNode(imageNamed: imageName)
        node.name = "\(random())"
        return (node, aspect)
    }
    
}