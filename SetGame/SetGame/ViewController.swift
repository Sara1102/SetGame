//
//  ViewController.swift
//  SetGame
//
//  Created by Ming on 2018/4/12.
//  Copyright © 2018年 zhiming. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var  game = Set(numberOfCards: 81)
    
    @IBOutlet var cardsButton: [UIButton]!
        {
        didSet{
            updateViewFromModel();
        }
    }
    @IBOutlet weak var sorceLabel: UILabel!
    @IBAction func startNewGame(_ sender: UIButton) {
        game.setNewPairCard(withNum: 0);
        updateViewFromModel()
        sorceLabel.text = "sorce:\(game.score)"
    }
    @IBAction func morethreeCards(_ sender: UIButton) {
        game.sendMoreThreeCards(withAuto: false);
         updateViewFromModel()
    }
    @IBAction func clickMoreCard(_ sender: UIButton) {
        if let index = cardsButton.index(of: sender) {
            game.chooseCard(at:index )
            updateViewFromModel()
            sorceLabel.text = "sorce:\(game.score)"
        }
    }
    var shaps = ["▲","●","◼︎"]
    var colors = [UIColor.red,UIColor.black,UIColor.yellow];
    var bgcolors = [UIColor.white,UIColor.gray,UIColor.blue];
    var numbers = [1,2,3]
    func updateViewFromModel() {
        for index  in cardsButton.indices{
            if index < game.deskCards.count{
                cardsButton[index].isHidden = false
                let cardId = game.deskCards[index].identifier
                if game.deskCards[index].isSelect{
                    cardsButton[index].layer.borderWidth = 3.0
                    cardsButton[index].layer.borderColor = UIColor.red.cgColor
                }else{
                    cardsButton[index].layer.borderWidth = 0.0
                    cardsButton[index].layer.borderColor = UIColor.clear.cgColor
                }
                cardsButton[index].setTitle(shaps[Int(cardId[1])!].repeatString(withTime: Int(cardId[0])!), for: UIControlState.normal)
                cardsButton[index].setTitleColor(colors[Int(cardId[2])!], for: UIControlState.normal)
                cardsButton[index].backgroundColor = bgcolors[Int(cardId[3])!]
            }else{
                cardsButton[index].isHidden = true
            }
        }
    }
}
extension String{
    func repeatString(withTime time:Int) -> String {
        var i = 0
        var s = self;
        while i<time {
            s.append(self);
            i += 1
        }
        
        return s
    }
}


