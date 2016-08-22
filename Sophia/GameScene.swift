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

let myCamera = SKCameraNode()
var spriteCaixa = SKNode()

let sophia: SophiaClass = SophiaClass()
let plataforma2: Plataform = Plataform()
let plataforma3: Plataform = Plataform()

var movimentoEscolhido = 0
var controlandoObjetos = false


class GameScene: SKScene, UIGestureRecognizerDelegate {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Hello, World!"
        myLabel.fontSize = 45
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        
        self.addChild(myLabel)
        
        
        /// Iniciando posicao da sophia
        
        sophia.position = self.childNodeWithName("sophia")!.position
        
        self.childNodeWithName("sophia")?.removeFromParent()
        self.addChild(sophia)
        
        /// Iniciando plataformas e objetos controláveis
        
        plataforma2.position = self.childNodeWithName("plataform2")!.position
        self.childNodeWithName("plataform2")?.removeFromParent()
        self.addChild(plataforma2)
        plataforma2.initPlataform(1)
        
        plataforma3.position = self.childNodeWithName("plataform3")!.position
        self.childNodeWithName("plataform3")?.removeFromParent()
        self.addChild(plataforma3)
        plataforma3.initPlataform(2)
        
        spriteCaixa = self.childNodeWithName("caixa")!
        
        /// GESTURES
        
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(GameScene.panControl(_:)))
        self.view?.addGestureRecognizer(panGesture)
        
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(GameScene.tapControl(_:)))
        self.view?.addGestureRecognizer(tapGesture)
        
        tapGesture.delegate = self
        panGesture.delegate = self
        
        /// Configurando camera
        
        self.camera = myCamera
        myCamera.setScale(2)
        myCamera.position = sophia.position
        
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        myCamera.position = sophia.position
        sophia.andar(movimentoEscolhido)
    }
    
    
    func tapControl(sender: UITapGestureRecognizer){
        print("Pulou")
        sophia.physicsBody?.applyImpulse(CGVectorMake((sophia.physicsBody?.velocity.dx)!, 3500))
        
    }
    
    func panControl(sender: UIPanGestureRecognizer){
        
        /// Controlando objetos na cena
        if controlandoObjetos {
            let position = self.view?.convertPoint(sender.locationInView(sender.view), toScene: self)
            spriteCaixa.runAction(SKAction.moveTo(position!, duration: 0.5))
            
//            if(sender.state == .Ended){
//                spriteCaixa.removeAllActions()
//                spriteCaixa = SKNode()
//            }
        } else {
            
            /// Making Sophia Walk
            if panGesture.locationInView(self.view).x > previousPosition?.x {
                
                /// Fazendo o gesture ficar mais responsivo
                if panGesture.locationInView(self.view).x > previousPosition!.x+200{
                    previousPosition!.x = panGesture.locationInView(self.view).x-200
                }
                movimentoEscolhido = 2
            } else if panGesture.locationInView(self.view).x < previousPosition?.x{
                
                /// Fazendo o gesture ficar mais responsivo
                if panGesture.locationInView(self.view).x < previousPosition!.x-200{
                    previousPosition!.x = panGesture.locationInView(self.view).x+200
                }
                movimentoEscolhido = 1
            }
            
            if panGesture.state == .Ended {
                movimentoEscolhido = 0
            }
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        /// Definindo ponto de toque inicial para gesture de pan ficar mais responsivo
        
        for touch in touches{
            let touchLocation = touch.locationInNode(self)
            if spriteCaixa.containsPoint(touchLocation){
                controlandoObjetos = true
            } else {
                controlandoObjetos = false
            }
        }
        
        if panGesture.locationInView(self.view).x < (self.view?.frame.size.width)!/2{
            previousPosition = panGesture.locationInView(self.view)
        }
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldReceiveTouch touch: UITouch) -> Bool {
        
        /// Definindo onde o Tap e o Pan podem ser executados
        if gestureRecognizer == panGesture && touch.locationInView(self.view).x > (self.view?.frame.size.width)!/2 && controlandoObjetos == false{
            return false
        }
        if gestureRecognizer == tapGesture && touch.locationInView(self.view).x < (self.view?.frame.size.width)!/2 {
            return false
        }
        return true
    }
}
