//
//  FirstScreen.swift
//  Sophia
//
//  Created by Gabriela de Carvalho Barros Bezerra on 8/18/16.
//  Copyright © 2016 GAMEPiD. All rights reserved.
//

import SpriteKit

class StartScreen: SKScene, UIGestureRecognizerDelegate {
    
    var starterSwipe: UISwipeGestureRecognizer?
    
    override func didMoveToView(view: SKView) {
        
        /// Swipe
        let starterSwipe = UISwipeGestureRecognizer(target: self, action: #selector(StartScreen.start))
        starterSwipe.direction = UISwipeGestureRecognizerDirection.Left
        self.view?.addGestureRecognizer(starterSwipe)
        
        /// Swipe to Start Label
        let myLabel = SKLabelNode(fontNamed:"Helvetica")
        myLabel.text = "< Swipe"
        myLabel.fontSize = 45
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        
        self.addChild(myLabel)
        
    }
    
    func start(sender: UIGestureRecognizer){
    
            print("transição")
            let nextScreen = GameScene()
            nextScreen.scaleMode = .AspectFill
            self.view?.presentScene(nextScreen, transition: SKTransition.moveInWithDirection(SKTransitionDirection.Right, duration: 0.7))
        
    }
    
}
