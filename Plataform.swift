//
//  Objects.swift
//  Sophia
//
//  Created by Italus Rodrigues do Prado on 19/08/16.
//  Copyright © 2016 GAMEPiD. All rights reserved.
//

import Foundation
import SpriteKit


//MARK: Plataform

class Plataform: SKSpriteNode {

    init() {
        let texture = SKTexture(imageNamed: "plataform.png")
        super.init(texture: texture, color: SKColor.clearColor(), size: texture.size())
        self.name = "plataformNode"
        
        /// Setando configurações do PhysicsBody
        
        self.physicsBody = SKPhysicsBody(rectangleOfSize: self.texture!.size())
        self.physicsBody?.dynamic = false
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.friction = 1
        
    }
    
    
    /// Iniciar se plataforma vai se mover ou não
    /// 0 = Nao, 1 = Vertical, 2 = Horizontal
    
    func initPlataform(movimento: Int){
        let distancia: CGFloat = 500
        
        print(self.position)
        if movimento == 1 {
            let posOriginal = self.position
            var pos = self.position
            pos.y = self.position.y+distancia
            print(pos)
            
            self.runAction(SKAction.repeatActionForever(SKAction.sequence([SKAction.moveTo(pos, duration: 2),SKAction.moveTo(posOriginal, duration: 4)])))
        }
        
        if movimento == 2{
            //self.physicsBody?.velocity.dx = 1000
            //self.physicsBody?.dynamic = true
            let posOriginal = self.position
            var pos = self.position
            pos.x = self.position.x+distancia
            print(pos)
            
            self.runAction(SKAction.repeatActionForever(SKAction.sequence([SKAction.moveTo(pos, duration: 2),SKAction.moveTo(posOriginal, duration: 2)])))
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}


