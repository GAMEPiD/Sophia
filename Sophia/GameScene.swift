//
//  GameScene.swift
//  Sophia
//
//  Created by Gabriela de Carvalho Barros Bezerra on 8/18/16.
//  Copyright (c) 2016 GAMEPiD. All rights reserved.
//

import SpriteKit

var tapGesture: UITapGestureRecognizer = UITapGestureRecognizer()
var panGesture: UIPanGestureRecognizer = UIPanGestureRecognizer()

var previousPosition: CGPoint?

let sophia: SophiaClass = SophiaClass()

class GameScene: SKScene, UIGestureRecognizerDelegate {
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
        
        /// GESTURES
        
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(GameScene.panControl(_:)))
        self.view?.addGestureRecognizer(panGesture)
        
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(GameScene.tapControl(_:)))
        self.view?.addGestureRecognizer(tapGesture)
        
        tapGesture.delegate = self
        panGesture.delegate = self
    }
    
    //    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    //        sophia.andar((Int)(1+arc4random()%2))
    //
    //    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func tapControl(sender: UITapGestureRecognizer){
        print("Pulou")
        sophia.physicsBody?.applyImpulse(CGVectorMake((sophia.physicsBody?.velocity.dx)!, 50))
        
    }
    
    func panControl(sender: UIPanGestureRecognizer){
        if panGesture.locationInView(self.view).x > previousPosition?.x {
            if panGesture.locationInView(self.view).x > previousPosition!.x+200{
                previousPosition!.x = panGesture.locationInView(self.view).x-200
            }
            sophia.andar(2)
        } else if panGesture.locationInView(self.view).x < previousPosition?.x{
            if panGesture.locationInView(self.view).x < previousPosition!.x-200{
                previousPosition!.x = panGesture.locationInView(self.view).x+200
            }
            sophia.andar(1)
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        if panGesture.locationInView(self.view).x < (self.view?.frame.size.width)!/2{
            previousPosition = panGesture.locationInView(self.view)
        }
        print("tocou")
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldReceiveTouch touch: UITouch) -> Bool {
        if gestureRecognizer == panGesture && touch.locationInView(self.view).x > (self.view?.frame.size.width)!/2 {
            return false
        }
        if gestureRecognizer == tapGesture && touch.locationInView(self.view).x < (self.view?.frame.size.width)!/2 {
            return false
        }
        return true
    }
}
