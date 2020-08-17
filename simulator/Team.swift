//
//  File.swift
//  simulator
//
//  Created by Mohammed A.S. Khan on 2/19/20.
//  Copyright © 2020 Mohammed A.S. Khan. All rights reserved.
//

import UIKit
import Foundation


class Team {
    
    
    var name:String
    var rating:Int
    var strength:String
    var weakness:String
    var wins:Int
    var games:Int
    let conference:String
    var image: UIImage
    var seed : Int?
    
    init(myName:String, myRating:Int, myStrength:String, myWeakness:String, myConference:String, myImage:UIImage, mySeed: Int?){
        name = myName
        rating = myRating
        strength = myStrength
        weakness = myWeakness
        conference = myConference
        wins = 0
        games = 0
        image = myImage
        seed = mySeed
    }
    func getName() -> String {
        return name
    }
    func setName(realName: String) {
        name = realName
    }
    func getRating() -> Int{
        return rating
    }
    func setRating(realRating: Int) {
        rating = realRating
    }
    func getStrength()-> String{
        return strength
    }
    func setStrength(realStrength: String){
        strength = realStrength
    }
    func getWeakness()-> String{
        return weakness
    }
    func setWeakness(realWeakness: String){
        weakness = realWeakness
    }
    func getWins() -> Int {
        return wins
    }
    func gameWon() {
        wins = wins+1
    }
    
    func getGames() -> Int {
        return games
    }
    func gamePlayed() {
        games = games+1
    }
    func reset(){
        games = 0
        wins = 0
    }
}
