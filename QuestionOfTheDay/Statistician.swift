//
//  Statistician.swift
//  QuestionOfTheDay
//
//  Created by student on 11/7/17.
//

import Foundation
class Statistician{
    
    let backendless = Backendless.sharedInstance()!
    let APPLICATION_ID = "3E6D3858-D3FA-5A59-FF83-A6383FBCF200"
    let API_KEY = "41F7C781-38D2-5815-FFE5-3730E2BD3A00"
    var dataStoreQuestionOfTheDay:IDataStore!
    var dataStoreOpinion:IDataStore!
    let SERVER_URL = "https://api.backendless.com"
    
    func findPercentage()->[Double]{
        let Allopinions:[Opinion] = GetAllOpinions()
        var answer0:Int = 0
        var answer1:Int = 0
        var answer2:Int = 0
        for opinion in Allopinions {
            if opinion.answer == 0 {
                answer0+=1
            }
            if opinion.answer == 1 {
                answer1+=1
            }
            if opinion.answer == 2 {
                answer2+=1
            }
        }
        
        return [Double((answer0*100)/(answer0+answer1+answer2)),Double((answer1*100)/(answer0+answer1+answer2)),Double((answer2*100)/(answer0+answer1+answer2))]
    }
    
    
   func fetchQuestionOfTheDay()-> QuestionOfTheDay{
        let queryBuilder = DataQueryBuilder()
        let question = self.dataStoreQuestionOfTheDay?.find(queryBuilder) as! [QuestionOfTheDay]
        return question[0]
    }
    
    
    func saveOpinion(opinion:Opinion){
        let savedOpinion = dataStoreOpinion.save(opinion)
        
    }
    
    func GetAllOpinions() ->[Opinion]{
        dataStoreOpinion = backendless.data.of(Opinion.ofClass())
        let TotalOpinions = dataStoreOpinion?.getObjectCount() as! Int
        let pageSize = 10
        let queryBuilder = DataQueryBuilder()
        var TotalOpinionsPulled = 0
        var Opinions:[Opinion] = []
        queryBuilder!.setPageSize(Int32(pageSize)).setOffset(0)
        while TotalOpinionsPulled < TotalOpinions {
            let Opinion = self.dataStoreOpinion?.find(queryBuilder) as! [Opinion]
            Opinions += Opinion
            TotalOpinionsPulled += Opinion.count
            queryBuilder!.prepareNextPage()
        }
        return Opinions
    }
    
    init(){
        backendless.hostURL = SERVER_URL
        backendless.initApp(APPLICATION_ID, apiKey:API_KEY)
        dataStoreQuestionOfTheDay = backendless.data.of(QuestionOfTheDay.ofClass())
        dataStoreOpinion = backendless.data.of(Opinion.ofClass())
    }
    
}
