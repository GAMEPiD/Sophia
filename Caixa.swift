//
//  Caixa.swift
//  Sophia
//
//  Created by Italus Rodrigues do Prado on 20/08/16.
//  Copyright © 2016 GAMEPiD. All rights reserved.
//

import Foundation
import SpriteKit

class Caixa: SKSpriteNode{
    
    init(){
        let texture = SKTexture(imageNamed: "caixa")
        super.init(texture: texture, color: SKColor.clearColor(), size: texture.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}