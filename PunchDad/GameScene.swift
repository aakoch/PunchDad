//
//  GameScene.swift
//  PunchDad
//
//  Created by Adam on 5/18/16.
//  Copyright (c) 2016 Adam. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var i = 0
    let punchLabel = SKLabelNode(fontNamed:"Arial")
    let punchTypeLabel = SKLabelNode(fontNamed:"Arial")
    var startTime = NSDate.timeIntervalSinceReferenceDate()
    let sprite = SKSpriteNode(imageNamed:"angry_adam")
    let timeLabel = SKLabelNode(fontNamed:"Arial")
    
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Arial")
        myLabel.text = "Punch dad!"
        myLabel.fontSize = 60
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y: CGRectGetMaxY(self.frame) - 80)
        myLabel.zPosition = 1
        self.addChild(myLabel)
        
        
        
        sprite.xScale = 1.1
        sprite.yScale = 1.1
        sprite.position = CGPoint(x:CGRectGetMidX(self.frame) - 10, y:CGRectGetMidY(self.frame))
        sprite.zPosition = 0
        self.addChild(sprite)
        
        
        punchLabel.fontSize = 20
        punchLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y: 20)
        punchLabel.zPosition = 1
        self.addChild(punchLabel)
        
        
        punchTypeLabel.fontSize = 30
        punchTypeLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y: 60)
        punchTypeLabel.zPosition = 1
        self.addChild(punchTypeLabel)
        
        
        timeLabel.fontSize = 10
        timeLabel.position = CGPoint(x:CGRectGetMidX(self.frame) + 10, y: 10)
        timeLabel.zPosition = 1
        self.addChild(timeLabel)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        startTime = NSDate.timeIntervalSinceReferenceDate()
        punchTypeLabel.text = "...swing..."
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        debugPrint(touches)
       /* Called when a touch begins */
        
        for touch in touches {
            debugPrint(touch.gestureRecognizers.debugDescription)
            //let location = touch.locationInNode(self)
        }
        let interval = NSDate.timeIntervalSinceReferenceDate() - startTime
        debugPrint(interval)
        timeLabel.text = interval.debugDescription
        var hit = false
        if interval < 0.2 {
            punchTypeLabel.text = "Miss! (too short)"
        }
        else if interval < 0.8 {
            punchTypeLabel.text = "Jab!"
            hit = true
        }
        else if interval < 1 {
            punchTypeLabel.text = "Uppercut!"
            hit = true
        }
        else if interval <= 3 {
            punchTypeLabel.text = "Miss! (too long)"
        }
        else if interval > 3 {
            punchTypeLabel.text = "Reset"
            
            
            sprite.xScale = 1
            sprite.yScale = 1
            sprite.position = CGPoint(x:CGRectGetMidX(self.frame) - 10, y:CGRectGetMidY(self.frame))
            i=0
        }
        
        if hit {
            i += 1
            punchLabel.text = "You've punched dad " + String(i) + " times"
            
            sprite.xScale *= 1.0001
            sprite.yScale *= 1.0001
            
            if i % 10 == 0 {
                sprite.xScale *= 1.2
                sprite.yScale *= 1.2
            }
        }
        
    }
    
//    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        
//        for touch in touches {
////            debugPrint(touch.gestureRecognizers.debugDescription)
//            debugPrint(touch)
//            
//            sprite.position = CGPoint(x: touch.locationInView(nil).x + (sprite.size.width / 2),
//                                      y: sprite.size.height - touch.locationInView(nil).y);
//        }
//    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        debugPrint("Motion ended")
        debugPrint(motion)
        sprite.xScale = 1
        sprite.yScale = 1
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
