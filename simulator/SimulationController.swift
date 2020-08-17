//
//  SimulationController.swift
//  simulator
//
//  Created by Mohammed A.S. Khan on 2/23/20.
//  Copyright © 2020 Mohammed A.S. Khan. All rights reserved.
//

import UIKit

class SimulationController: UIViewController {
    var postSeasonTeams : [Team] = []
    var westPlayoffTeams : [Team] = []
    var nonPlayoffWest : [Team] = []
    var eastPlayoffTeams : [Team] = []
    var nonPlayoffEast : [Team] = []
    var NBAteams : [Team] = []
    var pastWinners : [Team] = []
    //MARK: Outlets
    @IBOutlet weak var firstSeedName: UILabel!
    @IBOutlet weak var secondSeedName: UILabel!
    @IBOutlet weak var thirdSeedName: UILabel!
    @IBOutlet weak var fourthSeedName: UILabel!
    @IBOutlet weak var fifthSeedName: UILabel!
    @IBOutlet weak var sixthSeedName: UILabel!
    @IBOutlet weak var seventhSeedName: UILabel!
    @IBOutlet weak var eighthSeedName: UILabel!
    @IBOutlet weak var nonPlayoffWestNames: UILabel!
    
    
    @IBOutlet weak var firstSeedImage: UIImageView!
    @IBOutlet weak var secondSeedImage: UIImageView!
    @IBOutlet weak var thirdSeedImage: UIImageView!
    @IBOutlet weak var fourthSeedImage: UIImageView!
    @IBOutlet weak var fifthSeedImage: UIImageView!
    @IBOutlet weak var sixthSeedImage: UIImageView!
    @IBOutlet weak var seventhSeedImage: UIImageView!
    @IBOutlet weak var eighthSeedImage: UIImageView!
    
    //MARK: Actions
    @IBAction func viewEastStandings(_ sender: Any) {
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = Storyboard.instantiateViewController(withIdentifier: "EastStandingsController") as! EastStandingsController
        vc.eastTeams = eastPlayoffTeams
        vc.nonPlayoffTeams = nonPlayoffEast
        vc.sortedTeams = postSeasonTeams
        vc.pastWinners = pastWinners
        vc.NBAteams = NBAteams
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        schedule(teams: NBAteams)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func toString(obj:Team)-> String{
        let losses = 82 - obj.wins
        let wins = obj.wins
        return ((obj.name) + " " + String(wins) + "-" + String(losses) + "  ")
    }
    
    func standings( NBAteams:[Team]){
        var newList = NBAteams
        var teamsAdded = 0
        newList.sort(by: { (first: Team, second: Team) -> Bool in first.wins > second.wins})
        postSeasonTeams = newList
        for team in newList{
            if((team.conference == "West")&&(teamsAdded < 8)){
                westPlayoffTeams.append(team)
                teamsAdded = teamsAdded+1
            }
            else if((team.conference == "West")&&(teamsAdded >= 8)){
                nonPlayoffWest.append(team)
            }
        }
        
        var seedCounter = 1
        for team in westPlayoffTeams{
            team.seed = seedCounter
            seedCounter = seedCounter + 1
        }
        
        firstSeedName.text = "1. " + toString(obj: westPlayoffTeams[0])
        secondSeedName.text = "2. " + toString(obj: westPlayoffTeams[1])
        thirdSeedName.text = "3. " + toString(obj: westPlayoffTeams[2])
        fourthSeedName.text = "4. " + toString(obj: westPlayoffTeams[3])
        fifthSeedName.text = "5. " + toString(obj: westPlayoffTeams[4])
        sixthSeedName.text = "6. " + toString(obj: westPlayoffTeams[5])
        seventhSeedName.text = "7. " + toString(obj: westPlayoffTeams[6])
        eighthSeedName.text = "8. " + toString(obj: westPlayoffTeams[7])
        
        firstSeedImage.image = westPlayoffTeams[0].image
        secondSeedImage.image = westPlayoffTeams[1].image
        thirdSeedImage.image = westPlayoffTeams[2].image
        fourthSeedImage.image = westPlayoffTeams[3].image
        fifthSeedImage.image = westPlayoffTeams[4].image
        sixthSeedImage.image = westPlayoffTeams[5].image
        seventhSeedImage.image = westPlayoffTeams[6].image
        eighthSeedImage.image = westPlayoffTeams[7].image
        
        nonPlayoffWestNames.text = "9. " + toString(obj: nonPlayoffWest[0])
            + "10. " + toString(obj: nonPlayoffWest[1]) + "11. " + toString(obj: nonPlayoffWest[2]) + "12. " + toString(obj: nonPlayoffWest[3]) + "13. " + toString(obj: nonPlayoffWest[4]) + "14. " + toString(obj: nonPlayoffWest[5]) + "15. " + toString(obj: nonPlayoffWest[6])
        
        teamsAdded = 0
        for team in newList{
            if((team.conference == "East")&&(teamsAdded < 8)){
                eastPlayoffTeams.append(team)
                teamsAdded = teamsAdded+1
            }
            else if((team.conference == "East")&&(teamsAdded >= 8)){
                nonPlayoffEast.append(team)
            }
        }
    }
    
    func simulate(team1: Team, team2: Team){
        var diff:Double
        var factor:Double = 0
        var number:Int
        if(team1.rating > team2.rating){
            diff = Double(team1.rating - team2.rating)
            factor = diff * 2
            if(team1.weakness == team2.strength){
                factor = factor - 5
            }
            if(team2.weakness == team1.strength){
                factor = factor + 5
            }
            // number = drand48() * 100
            number = Int(arc4random_uniform(100)) //raarc4random(255)%100
            if(number <= Int(factor + 50)){
                team1.gameWon()
            }
            else{
                team2.gameWon()
            }
        }
        if(team2.rating > team1.rating){
            diff = Double(team2.rating - team1.rating)
            factor = diff * 2
            if(team1.weakness == team2.strength){
                factor = factor + 5
            }
            if(team2.weakness == team1.strength){
                factor = factor - 5
            }
            // number = drand48() * 100
            number = Int(arc4random_uniform(100))
            if(number <= Int(factor + 50)){
                team2.gameWon()
            }
            else{
                team1.gameWon()
            }
        }
        if(team1.rating == team2.rating){
            
            if(team1.weakness == team2.strength){
                factor = factor - 5
            }
            if(team2.weakness == team1.strength){
                factor = factor + 5
            }
            // number =  Int(arc4random_uniform(UInt32(6)))
            number = Int(arc4random_uniform(100))
            if(number <= Int(factor + 50)){
                team1.gameWon()
            }
            else{
                team2.gameWon()
            }
        }
        
    }
    
    func schedule(teams:[Team]){
        
        for team in teams{
            var i = 0
            while(team.games < 82){
                if(teams[i%30].name != team.name && teams[i%30].games < 82){
                    simulate(team1 : team, team2: teams[i%30])
                    team.gamePlayed()
                    teams[i%30].gamePlayed()
                }
                i = i+1
            }
        }
        standings(NBAteams:teams)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
