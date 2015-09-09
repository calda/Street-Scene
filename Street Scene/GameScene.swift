//
//  GameScene.swift
//  Street Scene
//
//  Created by Cal on 9/6/15.
//  Copyright (c) 2015 Cal. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var generators: [Generator] = []
    
    override func didMoveToView(view: SKView) {
        generators.append(BuildingGenerator(scene: self, zPosition: 0))
        generators.append(PersonGenerator(scene: self, zPosition: 1))
        generators.append(VehicleGenerator(scene: self, zPosition: 2, withPrefix: "vehicle-left-"))
        generators.append(VehicleGenerator(scene: self, zPosition: 3, withPrefix: "vehicle-right-"))
    }
    
    //MARK: - Scroll Nodes in View
    
    var previousPosition: CGPoint!
    
    override func touchesBegan(var touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.popFirst()!
        previousPosition = touch.locationInNode(self)
    }
    
    override func touchesMoved(var touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.popFirst()!
        let currentPosition = touch.locationInNode(self)
        
        //move everything
        let delta = previousPosition - currentPosition
        for node in self.children {
            node.position = node.position - CGPointMake(delta.x, 0)
        }
        previousPosition = currentPosition
    }
   
    override func update(currentTime: CFTimeInterval) {
        for i in 0 ..< generators.count {
            var generator = generators[i]
            generator.nodesUpdated()
            generators[i] = generator
        }
    }
}
