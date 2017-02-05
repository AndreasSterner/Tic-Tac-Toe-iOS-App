//
//  ViewController.swift
//  Tic Tac Toe iOS App
//
//  Created by Andreas Sterner on 2017-02-05.
//  Copyright © 2017 Andreas Sterner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1 //Cross
    var gameState = [0,0,0,0,0,0,0,0,0]
    var gameIsActive = true
    
    let winningCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    @IBOutlet weak var winner: UILabel!
    
    @IBAction func action(_ sender: UIButton) {
        
        if(gameState[sender.tag-1] == 0 && gameIsActive == true){
            
            gameState[sender.tag-1] = activePlayer
            
        if(activePlayer == 1){
        
            sender.setImage(UIImage(named: "Cross.png"), for: UIControlState())
            activePlayer = 2
            
        } else {
            
            sender.setImage(UIImage(named: "Nought.png"), for: UIControlState())
            activePlayer = 1
            }
        }
        
        for combination in winningCombinations {
        
            if(gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]) {
            gameIsActive = false
                if(gameState[combination[0]] == 1){
                // Cross Wins
                    winner.text = "Kryss vinner"
                } else {
                //Nought Wins
                    winner.text = "Cirkel vinner"
                }
                playAgainButton.isHidden = false
                winner.isHidden = false
            }
        }
        
        gameIsActive = false
        
        for i in gameState {
            
            if i == 0 {
                gameIsActive = true
                break
                
            }
        }
        if gameIsActive == false {
            winner.text = "Draw"
            winner.isHidden = false
            playAgainButton.isHidden = false
        }
    }

    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func playAgain(_ sender: Any) {
        
        activePlayer = 1
        gameState = [0,0,0,0,0,0,0,0,0]
        gameIsActive = true
        
        winner.isHidden = true
        playAgainButton.isHidden = true
        
        for i in 1...9 {
        
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
        
        }
    }
  

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

