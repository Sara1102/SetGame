//
//  CardIdentifier.swift
//  SetGame
//
//  Created by Ming on 2018/4/13.
//  Copyright © 2018年 zhiming. All rights reserved.
//

import Foundation
struct  CardIdentifier:Equatable{
    static func == (lhs: CardIdentifier, rhs: CardIdentifier) -> Bool {
        return lhs.bgColor == rhs.bgColor&&lhs.number == rhs.number&&lhs.sharp == rhs.sharp&&lhs.color == rhs.color
    }
    
    var number:Int!
    var sharp:Int!
    var color:Int!
    var bgColor:Int!
    
    
    
}
