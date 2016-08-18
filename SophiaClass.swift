//
//  SophiaClass.swift
//  Sophia
//
//  Created by Italus Rodrigues do Prado on 18/08/16.
//  Copyright © 2016 GAMEPiD. All rights reserved.
//

import SpriteKit

class SophiaClass: SKSpriteNode {
    
    let walkAtlas = SKTextureAtlas(named: "walkSophia")
    let stopAtlas = SKTextureAtlas(named: "stopSophia")
    
    var walkingSprites = [SKTexture]()
    var stopSprites = [SKTexture]()
    
    var walkingAnimation: SKAction? = nil
    var stopAnimation: SKAction? = nil
    
    init() {
        let texture = SKTexture(imageNamed: "stopSophia01.png")
        super.init(texture: texture, color: SKColor.clearColor(), size: texture.size())
        
        initSophiaAnimation()
        self.name = "sophiaNode"
        self.physicsBody = SKPhysicsBody(circleOfRadius: (self.texture?.size().height)!/4)
        self.physicsBody?.affectedByGravity = false
        
        /// Iniciando animação inicial
        
        self.runAction(SKAction.repeatActionForever(stopAnimation!))
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func andar(lado: Int) {
        /// Andar para direita
        if lado == 2 {
            if physicsBody?.velocity.dx <= 0 {
                self.runAction(SKAction.repeatActionForever(walkingAnimation!))
            }
            self.physicsBody?.velocity.dx = 100
            if self.xScale < 0 {
                self.xScale = (self.xScale) * -1;
            }
        } else {
            /// Andar para esquerda
            if physicsBody?.velocity.dx >= 0 {
                self.runAction(SKAction.repeatActionForever(walkingAnimation!))
            }
            if self.xScale > 0 {
                self.xScale = (self.xScale) * -1;
            }
            self.physicsBody?.velocity.dx = -100
        }
    }
    
    
    func initSophiaAnimation(){
        /// Run Animation Sophia
        
        for index in 1...8 {
            let imgName = String(format: "sophiaWalking0%d.png",index)
            walkingSprites += [walkAtlas.textureNamed(imgName)]
        }
        walkingAnimation = SKAction.animateWithTextures(walkingSprites, timePerFrame: 0.1)
        
        /// Stop Animation Sophia
        
        for index in 1...5 {
            let imgName = String(format: "stopSophia0%d.png",index)
            stopSprites += [stopAtlas.textureNamed(imgName)]
        }
        stopAnimation = SKAction.animateWithTextures(stopSprites, timePerFrame: 0.25)
    }
}
