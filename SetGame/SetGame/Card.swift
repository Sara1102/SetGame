//
//  Card.swift
//  SetGame
//
//  Created by Ming on 2018/4/12.
//  Copyright © 2018年 zhiming. All rights reserved.
//

import Foundation
struct Card {
    var isSelect = false
    var isSet = false
    var identifier:Array<String>
    private static let randoms = ["0","1","2"]
    private static var identifierFactroy = [Array<String>]()
    static func getUniqueIdentifier() -> Array<String>{
        if identifierFactroy.count == 0 {
            for r0 in randoms {
                for r1 in randoms {
                    for r2 in randoms {
                        for r3 in randoms {
                            var r = Array<String>();
                            r.append(r0)//number
                            r.append(r1)//shap
                            r.append(r2)//color
                            r.append(r3)//bgColor
                            identifierFactroy.append(r)
                        }
                    }
                }
            }
        }
        return identifierFactroy.remove(at: identifierFactroy.randomIndex)
    }
    init() {
        self.identifier = Card.getUniqueIdentifier();
    }
}
extension Array{
    var randomElement:Element{
        let randomIndex = Int(arc4random_uniform(UInt32(count)));
        return self[randomIndex]
    }
    var randomIndex:Int{
        return Int(arc4random_uniform(UInt32(count)));
    }
    func replaceObject(at j:Int,withNewElent newElent:Element) -> Array {
        var array=[Element]()
        for i in self.indices{
            if i == j{
                array.append(newElent);
            }else{
                array.append(self[i]);
            }
        }
        return array
    }
}

