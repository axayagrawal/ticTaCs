//
//  ViewController.swift
//  ticTacs
//
//  Created by Student on 01/04/19.
//  Copyright © 2019 axay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var xTurn:Bool = true
    var isGameActive:Bool = true
    var board = [" "," "," "," "," "," "," "," "," "]
    
    @IBOutlet weak var statelbl: UILabel!
    let winningCombos = [ [0,1,2] , [3,4,5] , [6,7,8] , [0,3,6] , [1,4,7] , [2,5,8] , [0,4,8] , [2,4,6] ]
    
    func checkWinner(){
        for combo in winningCombos{
            if(board[combo[0]] != " " && board[combo[0]] == board[combo[1]] && board[combo[0]] == board[combo[2]]){
                isGameActive = false
                if(board[combo[0]] == "X"){
                    statelbl.text = "X Won!!!"
                    statelbl.textColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
                    statelbl.isHidden = false
                }else{
                   statelbl.text = "O Won!!!"
                    statelbl.textColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
                    statelbl.isHidden = false
                }
            }else{
            var count = 0
            for i in 0...8{
                if(board[i] != " "){
                    count += 1
                }
            }
            if(count == 9){
                isGameActive = false
                statelbl.text = "It's A Tie!!!"
                statelbl.textColor = #colorLiteral(red: 0.5101162791, green: 0.9215883613, blue: 0.2478517592, alpha: 1)
                statelbl.isHidden = false
                break
            }
            }
            
        }
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        
        if(isGameActive){
            if(board[sender.tag] == " "){
            
            if(xTurn){
                sender.setImage(#imageLiteral(resourceName: "NeonX"), for: .normal)
                board[sender.tag] = "X"
            }else{
               sender.setImage(#imageLiteral(resourceName: "NeonO"), for: .normal)
                board[sender.tag] = "O"
            }
            checkWinner()
            xTurn = !xTurn
        
        }
    }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

