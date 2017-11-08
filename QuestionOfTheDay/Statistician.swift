//
//  Statistician.swift
//  QuestionOfTheDay
//
//  Created by student on 11/7/17.
//

import Foundation
class Statistician{
    
    
    let backendless = Backendless.sharedInstance()!
    var dataStoreQuestionOfTheDay:IDataStore!
    var dataStoreOpinion:IDataStore!
    
    func findPercentage()->[Double]{
        
        let opinions = dataStoreOpinion?.find() as! [Opinion]
        var ans0:Int = 0
        var ans1:Int = 0
        var ans2:Int = 0
        for opinion in opinions {
            if opinion.answer == 0 {
                ans0+=1
            }
            if opinion.answer == 1 {
                ans1+=1
            }
            if opinion.answer == 2 {
                ans2+=1
            }
        }
        
        return [Double((ans0*100)/(ans0+ans1+ans2)),Double((ans1*100)/(ans0+ans1+ans2)),Double((ans2*100)/(ans0+ans1+ans2))]
    }
    
    
    func fetchQuestionOfTheDay()-> QuestionOfTheDay{
        let queryBuilder = DataQueryBuilder()
        let question = self.dataStoreQuestionOfTheDay?.find(queryBuilder) as! QuestionOfTheDay
        return question
    }
    
    
    func saveOpinion(opinion:Opinion){
        let savedOpinion = dataStoreOpinion.save(opinion)
        
    }
    
    
    init(){
        dataStoreQuestionOfTheDay = backendless.data.of(QuestionOfTheDay.ofClass())
        dataStoreOpinion = backendless.data.of(Opinion.ofClass())
    }
    
}
