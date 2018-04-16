//
//  Set.swift
//  SetGame
//
//  Created by Ming on 2018/4/12.
//  Copyright © 2018年 zhiming. All rights reserved.
//

import Foundation
struct Set {
    private var cards = [Card]()
    private(set) var deskCards = [Card]()
    private(set) var nextCard = 0
    private(set) var score = 0
    
    var numberOfSelectCard  = 0
    var srartCardIndex  = 12
    
    mutating func chooseCard(at index:Int) {
        if deskCards[index].isSelect{
            numberOfSelectCard = numberOfSelectCard - 1
            score = score - 1
            deskCards[index].isSelect = false
        }else{
            numberOfSelectCard = numberOfSelectCard + 1
            deskCards[index].isSelect = true
            if numberOfSelectCard == 3{
                numberOfSelectCard = 0
                if matchSelectCardIfSet(){
                     score = score + 3
                    sendMoreThreeCards(withAuto: true)
                }else{
                    score = score - 5
                    resetfialMatchCard()
                }
            }
        }
    }
    func matchSelectCardIfSet() ->Bool {
        var selectCards = Array<Card>();
        for index in deskCards.indices{
            if deskCards[index].isSelect == true{
                selectCards.append(deskCards[index])
            }
        }
        for index in selectCards[0].identifier.indices{
            if (((selectCards[0].identifier[index] == selectCards[1].identifier[index]) && (selectCards[2].identifier[index] == selectCards[1].identifier[index]))||( (selectCards[0].identifier[index] != selectCards[1].identifier[index]) && (selectCards[2].identifier[index] != selectCards[1].identifier[index]) && (selectCards[2].identifier[index] != selectCards[0].identifier[index]))) {
                continue

            }else{
                return false
            }
        }
        
        return true
    }
    private mutating func resetfialMatchCard() {
        for index in deskCards.indices{
            if deskCards[index].isSelect == true{
                deskCards[index].isSelect = false;
            }
        }
        numberOfSelectCard = 0
    }
   mutating func sendMoreThreeCards(withAuto auto:Bool) {
    if srartCardIndex == 81{
        return
    }
        if auto{
            for index in deskCards.indices{
                if deskCards[index].isSelect == true{
                    deskCards = deskCards.replaceObject(at: index, withNewElent: cards[srartCardIndex])
                    srartCardIndex = srartCardIndex + 1;
                }
            }
        }else{
            if deskCards.count == 24{
                return
            }
            var index = 0
            while(index <= 2){
                deskCards.append(cards[srartCardIndex])
                srartCardIndex += 1
                index += 1
            }
        }
    }
    mutating func setNewPairCard(withNum num:Int) {
        let numOfCard = num > cards.count ? num : cards.count
        cards.removeAll();
        deskCards.removeAll();
        for index in 0..<numOfCard {
            let card = Card();
            cards.append(card)
            if index<12{
                deskCards.append(card);
            }
        }
        numberOfSelectCard = 0;
        score = 0;
    }
    init(numberOfCards:Int){
        setNewPairCard(withNum: numberOfCards);
    }
}
