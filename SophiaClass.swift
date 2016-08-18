//
//  SophiaClass.swift
//  Sophia
//
//  Created by Italus Rodrigues do Prado on 18/08/16.
//  Copyright © 2016 GAMEPiD. All rights reserved.
//

import SpriteKit

class SophiaClass: SKSpriteNode {

    var invaderRow = 0
    var invaderColumn = 0
    
    init() {
        let texture = SKTexture(imageNamed: "Spaceship")
        super.init(texture: texture, color: SKColor.clearColor(), size: texture.size())
        self.name = "invader"
        self.physicsBody = SKPhysicsBody(circleOfRadius: (self.texture?.size().height)!/4)
        self.physicsBody?.affectedByGravity = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func andar(lado: Int) {
        if lado == 2 {
            self.physicsBody?.velocity.dx = 100
        } else {
            self.physicsBody?.velocity.dx = -100
        }
    }
    
    
    func fireBullet(scene: SKScene){
        
    }
}
