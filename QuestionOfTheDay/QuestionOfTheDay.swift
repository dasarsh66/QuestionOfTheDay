//
//  QuestionOfTheDay.swift
//  QuestionOfTheDay
//
//  Created by student on 11/7/17.
//

import Foundation
@objcMembers
class QuestionOfTheDay : NSObject {
    var objectId:String?
    var question:String?
    var answer0:String?
    var answer1:String?
    var answer2:String?
    var create:NSDate?
    var update:NSDate?
    
    override init(){
        super.init()
    }
    init(question:String, answer0:String, answer1:String, answer2:String){
        self.question = question
        self.answer0 = answer0
        self.answer1 = answer1
        self.answer2 = answer2
    }
    
}
