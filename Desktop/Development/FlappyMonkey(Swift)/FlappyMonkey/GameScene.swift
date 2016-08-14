//
//  GameScene.swift
//  FlappyMonkey
//
//  Created by Francisco Maldonado on 4/9/15.
//  Copyright (c) 2015 WeakSauce Apps. All rights reserved.
//
//


import SpriteKit

class GameScene: SKScene {
    
    var monkey = SKSpriteNode()
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        
        let background = SKSpriteNode(imageNamed: "bg")
        background.position = CGPoint(x: self.frame.size.width / 2 , y: self.frame.size.height / 2)
        self.addChild(background)
        
          createPoles()
        
        //Sets up ground texture
        
        let groundTexture = SKTexture(imageNamed: "ground")
        let groundMovingLeft = SKAction.moveByX(-groundTexture.size().width, y: 0, duration: 0.9)
        let resetGround = SKAction.moveByX(groundTexture.size().width, y: 0, duration: 0)
        let groundMovingLeftForever = SKAction.repeatActionForever(SKAction.sequence([groundMovingLeft,resetGround]))
        
        
        //for loop to continuesly display ground image
        
        for var i:CGFloat = 0; i < self.frame.size.width / (groundTexture.size().width); ++i
        {
            let groundPiece = SKSpriteNode(texture: groundTexture)
            groundPiece.position = CGPoint(x: i * groundPiece.size.width, y: groundPiece.size.height / 2)
            groundPiece.runAction(groundMovingLeftForever)
            self.addChild(groundPiece)
        }
        
      
        
        //Sets up monkey texture
        let monkeyTexture1 = SKTexture(imageNamed: "monkey1")
        let monkeyTexture2 = SKTexture(imageNamed: "monkey2")
        let monkeyTexture3 = SKTexture(imageNamed: "monkey3")
        let monkeyTexture4 = SKTexture(imageNamed: "monkey4")
        let monkeyTexture5 = SKTexture(imageNamed: "monkey5")
        self.monkey = SKSpriteNode(texture: monkeyTexture1)
        /*Files through character images passed in Array sets how long it will take to go through images */
        
        let flap = SKAction.animateWithTextures([monkeyTexture1,monkeyTexture2,monkeyTexture3,monkeyTexture4,monkeyTexture5], timePerFrame: 0.1)
        
        //keeps reapting through images continously/adds flap action to monkey
        let flapForever = SKAction.repeatActionForever(flap)
        self.monkey.runAction(flapForever)
        
        //Sets position of image on the screen
        
        self.monkey.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2)
        self.addChild(self.monkey)
     
    }
    
    func createPoles()
    {
        let poles = SKNode()
        
        
        poles.position = CGPoint(x: self.frame.size.width / 2, y: 0)
        
        let topPole = SKSpriteNode(imageNamed: "topPole")
        topPole.position = CGPoint(x: 0, y: self.frame.size.height)
        poles.addChild(topPole)
        
        let bottomPole = SKSpriteNode(imageNamed: "bottomPole")
        bottomPole.position = CGPoint(x: 0, y: 0)
        poles.addChild(bottomPole)
        
        self.addChild(poles)
    }
    
    
    
     override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        
    
    
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
