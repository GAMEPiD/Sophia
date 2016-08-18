//
//  GameScene.swift
//  Sophia
//
//  Created by Gabriela de Carvalho Barros Bezerra on 8/18/16.
//  Copyright (c) 2016 GAMEPiD. All rights reserved.
//

import SpriteKit

let sophia: SophiaClass = SophiaClass()

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Hello, World!"
        myLabel.fontSize = 45
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        
        self.addChild(myLabel)
        
        //self.childNodeWithName("sophia")?.position.x = (self.childNodeWithName("sophia")?.position.x)!+100
        
        
        //sophia = SophiaClass()
        sophia.position.x = self.childNodeWithName("sophia")!.position.x+200
        sophia.position.y = self.childNodeWithName("sophia")!.position.y
        
        self.childNodeWithName("sophia")?.removeFromParent()
        self.addChild(sophia)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        sophia.andar(2)
        
//        for touch in touches {
//            let location = touch.locationInNode(self)
//            
//            let sprite = SKSpriteNode(imageNamed:"Spaceship")
//            
//            sprite.xScale = 0.5
//            sprite.yScale = 0.5
//            sprite.position = location
//            
//            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
//            
//            sprite.runAction(SKAction.repeatActionForever(action))
//            
//            self.addChild(sprite)
//        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
