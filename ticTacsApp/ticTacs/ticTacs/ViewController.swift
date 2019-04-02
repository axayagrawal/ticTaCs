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
    var board:Array<String> = [" "," "," "," "," "," "," "," "," "]
    var btnArray:Array<UIButton>!  
    let winningCombos = [ [0,1,2] , [3,4,5] , [6,7,8] , [0,3,6] , [1,4,7] , [2,5,8] , [0,4,8] , [2,4,6] ]
    
    
    @IBOutlet weak var FirstBtn: UIButton!
    @IBOutlet weak var secBtn: UIButton!
    @IBOutlet weak var thirdBtn: UIButton!
    @IBOutlet weak var fourthBtn: UIButton!
    @IBOutlet weak var fifthBtn: UIButton!
    @IBOutlet weak var sixthBtn: UIButton!
    @IBOutlet weak var sevBtn: UIButton!
    @IBOutlet weak var eighBtn: UIButton!
    @IBOutlet weak var ninethBtn: UIButton!
    @IBOutlet weak var statelbl: UILabel!
    @IBOutlet var resetBtn: UIView!
    
    
    
    func checkWinner(){
        for combo in winningCombos{
            if(board[combo[0]] != " " && board[combo[0]] == board[combo[1]] && board[combo[0]] == board[combo[2]]){
                isGameActive = false
                if(board[combo[0]] == "X"){
                    statelbl.text = "X Won!!!"
                    statelbl.textColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
                }else{
                   statelbl.text = "O Won!!!"
                    statelbl.textColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
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
                break
            }
            }
            
        }
    }
    
    
    
    @IBAction func resetBoard(_ sender: Any) {
        board = [" "," "," "," "," "," "," "," "," "]
        for btn in btnArray{
            btn.setImage(nil, for: .normal)
        }
        statelbl.isHidden = true
        resetBtn.isHidden = true
        isGameActive = true
        
    }
    
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        if(isGameActive){
            if(board[sender.tag] == " "){
            
            if(xTurn){
                sender.setImage(UIImage(named: "NeonX"), for: .normal)
                //sender.setImage(#imageLiteral(resourceName: "NeonX"), for: .normal)
                board[sender.tag] = "X"
            }else{
               sender.setImage(#imageLiteral(resourceName: "NeonO"), for: .normal)
                board[sender.tag] = "O"
            }
            checkWinner()
            xTurn = !xTurn
                if(!isGameActive){
                    statelbl.isHidden = false
                    resetBtn.isHidden = false
                }
        
        }
    }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        btnArray = [FirstBtn, secBtn, thirdBtn, fourthBtn, fifthBtn, sixthBtn, sevBtn, eighBtn, ninethBtn]
    }


}

