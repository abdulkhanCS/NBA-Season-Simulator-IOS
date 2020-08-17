//
//  PlayoffsSimulationController.swift
//  simulator
//
//  Created by Mohammed A.S. Khan on 2/23/20.
//  Copyright © 2020 Mohammed A.S. Khan. All rights reserved.
//

import UIKit

class PlayoffsSimulationController: UIViewController {

    var pastWinners : [Team] = []
    var sortedTeams : [Team] = []
    var NBAteams : [Team] = []
    var winner : Team? = nil
    
    //MARK: Outlets
    @IBOutlet weak var wfirst1: UILabel!
    @IBOutlet weak var wfirst2: UILabel!
    @IBOutlet weak var wfirst3: UILabel!
    @IBOutlet weak var wfirst4: UILabel!
    @IBOutlet weak var wfirst5: UILabel!
    @IBOutlet weak var wfirst6: UILabel!
    @IBOutlet weak var wfirst7: UILabel!
    @IBOutlet weak var wfirst8: UILabel!
    @IBOutlet weak var efirst1: UILabel!
    @IBOutlet weak var efirst2: UILabel!
    @IBOutlet weak var efirst3: UILabel!
    @IBOutlet weak var efirst4: UILabel!
    @IBOutlet weak var efirst5: UILabel!
    @IBOutlet weak var efirst6: UILabel!
    @IBOutlet weak var efirst7: UILabel!
    @IBOutlet weak var efirst8: UILabel!
    @IBOutlet weak var wfirstIMG1: UIImageView!
    @IBOutlet weak var wfirstIMG2: UIImageView!
    @IBOutlet weak var wfirstIMG3: UIImageView!
    @IBOutlet weak var wfirstIMG4: UIImageView!
    @IBOutlet weak var wfirstIMG5: UIImageView!
    @IBOutlet weak var wfirstIMG6: UIImageView!
    @IBOutlet weak var wfirstIMG7: UIImageView!
    @IBOutlet weak var wfirstIMG8: UIImageView!
    @IBOutlet weak var efirstIMG1: UIImageView!
    @IBOutlet weak var efirstIMG2: UIImageView!
    @IBOutlet weak var efirstIMG3: UIImageView!
    @IBOutlet weak var efirstIMG4: UIImageView!
    @IBOutlet weak var efirstIMG5: UIImageView!
    @IBOutlet weak var efirstIMG6: UIImageView!
    @IBOutlet weak var efirstIMG7: UIImageView!
    @IBOutlet weak var efirstIMG8: UIImageView!
    
    
    @IBOutlet weak var wsemis1: UILabel!
    @IBOutlet weak var wsemis2: UILabel!
    @IBOutlet weak var wsemis3: UILabel!
    @IBOutlet weak var wsemis4: UILabel!
    @IBOutlet weak var esemis1: UILabel!
    @IBOutlet weak var esemis2: UILabel!
    @IBOutlet weak var esemis3: UILabel!
    @IBOutlet weak var esemis4: UILabel!
    @IBOutlet weak var wsemisIMG1: UIImageView!
    @IBOutlet weak var wsemisIMG2: UIImageView!
    @IBOutlet weak var wsemisIMG3: UIImageView!
    @IBOutlet weak var wsemisIMG4: UIImageView!
    @IBOutlet weak var esemisIMG1: UIImageView!
    @IBOutlet weak var esemisIMG2: UIImageView!
    @IBOutlet weak var esemisIMG3: UIImageView!
    @IBOutlet weak var esemisIMG4: UIImageView!
    
    @IBOutlet weak var wfinals1: UILabel!
    @IBOutlet weak var wfinals2: UILabel!
    @IBOutlet weak var efinals1: UILabel!
    @IBOutlet weak var efinals2: UILabel!
    @IBOutlet weak var wfinalsIMG1: UIImageView!
    @IBOutlet weak var wfinalsIMG2: UIImageView!
    @IBOutlet weak var efinalsIMG1: UIImageView!
    @IBOutlet weak var efinalsIMG2: UIImageView!
    
    @IBOutlet weak var finals1: UILabel!
    @IBOutlet weak var finals2: UILabel!
    @IBOutlet weak var finalsIMG1: UIImageView!
    @IBOutlet weak var finalsIMG2: UIImageView!
    
    @IBOutlet weak var champion: UILabel!
    @IBOutlet weak var championIMG: UIImageView!
    
    //MARK: Actions
    @IBAction func goToNewSeason(_ sender: UIBarButtonItem) {
        
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = Storyboard.instantiateViewController(withIdentifier: "TeamTableViewController") as! TeamTableViewController
        vc.pastWinners = pastWinners
        vc.teamsLoaded = NBAteams
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showPlayoffs(teams: sortedTeams)
        winner = simulatePlayoffs(teams :sortedTeams)
        pastWinners.append(winner!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func reset(NBAteams: [Team]){
        for team in NBAteams{
            team.reset()
        }
    }
    
    func simulateP(team1: Team, team2: Team)->Team {
        var diff:Double
        var factor:Double = 0
        var number:Int
        if(team1.rating > team2.rating){
            diff = Double(team1.rating - team2.rating)
            factor = diff * 1.75 + (3 * Double(team2.seed! - team1.seed!))
            if(team1.weakness == team2.strength){
                factor = factor - 5
            }
            if(team2.weakness == team1.strength){
                factor = factor + 5
            }
            // number = drand48() * 100
            number = Int(arc4random_uniform(100)) //raarc4random(255)%100
            if(number <= Int(factor + 50)){
                return team1
            }
            else{
                return team2
            }
        }
        if(team2.rating > team1.rating){
            diff = Double(team2.rating - team1.rating)
            factor = diff * 1.75 + (3 * Double(team1.seed! - team2.seed!))
            if(team1.weakness == team2.strength){
                factor = factor + 5
            }
            if(team2.weakness == team1.strength){
                factor = factor - 5
            }
            // number = drand48() * 100
            number = Int(arc4random_uniform(100))
            if(number <= Int(factor + 50)){
                return team2
            }
            else{
                return team1
            }
        }
        if(team1.rating == team2.rating){
            
            factor = 3 * Double(team2.seed! - team1.seed!)
            if(team1.weakness == team2.strength){
                factor = factor - 5
            }
            if(team2.weakness == team1.strength){
                factor = factor + 5
            }
            // number =  Int(arc4random_uniform(UInt32(6)))
            number = Int(arc4random_uniform(100))
            if(number <= Int(factor + 50)){
                return team1
            }
            else{
                return team2
            }
        }
        let team3 = Team(myName:"NULL", myRating:0 ,myStrength:"NULL", myWeakness:"NULL", myConference:"NULL", myImage: UIImage(named: "Hawks")!, mySeed:nil)
        return team3
    }
    
    func showPlayoffs(teams:[Team]){
            var west = 0
            var east = 0
            var East : [Team] = []
            var West : [Team] = []
            for team in teams{
                if(team.conference == "West" && west < 8){
                    west = west+1
                    West.append(team)
                }
                if(team.conference == "East" && east < 8){
                    east = east+1
                    East.append(team)
                }
            }
        
        //texts configuration
            efirst1.text = "(1)   vs."
            efirst8.text = "(8) "
            efirst2.text = "(2)   vs."
            efirst7.text = "(7) "
            efirst3.text = "(3)   vs."
            efirst6.text = "(6) "
            efirst4.text = "(4)   vs."
            efirst5.text = "(5) "
        
        
            wfirst1.text = "(1)   vs."
            wfirst8.text = "(8) "
            wfirst2.text = "(2)   vs."
            wfirst7.text = "(7) "
            wfirst3.text = "(3)   vs."
            wfirst6.text = "(6) "
            wfirst4.text = "(4)   vs."
            wfirst5.text = "(5) "
        
        //images configuration
        
            efirstIMG1.image = East[0].image
            efirstIMG8.image = East[7].image
            efirstIMG2.image = East[1].image
            efirstIMG7.image = East[6].image
            efirstIMG3.image = East[2].image
            efirstIMG6.image = East[5].image
            efirstIMG4.image = East[3].image
            efirstIMG5.image = East[4].image
        
        
            wfirstIMG1.image = West[0].image
            wfirstIMG8.image = West[7].image
            wfirstIMG2.image = West[1].image
            wfirstIMG7.image = West[6].image
            wfirstIMG3.image = West[2].image
            wfirstIMG6.image = West[5].image
            wfirstIMG4.image = West[3].image
            wfirstIMG5.image = West[4].image
                    }
    
    func simulatePlayoffs(teams:[Team])->Team?{
       
            var west = 0
            var east = 0
            var East : [Team] = []
            var West : [Team] = []
            for team in teams{
                if(team.conference == "West" && west < 8){
                    west = west+1
                    West.insert(team, at: 0)
                }
                if(team.conference == "East" && east < 8){
                    east = east+1
                    East.insert(team, at: 0)
                }
            }
            var EastSemis: [Team] = []
            var WestSemis: [Team] = []

            EastSemis.insert(simulateP(team1:East[7], team2:East[0]), at: 0)
            EastSemis.insert(simulateP(team1:East[6], team2:East[1]), at: 0)
            EastSemis.insert(simulateP(team1:East[5], team2:East[2]), at: 0)
            EastSemis.insert(simulateP(team1:East[4], team2:East[3]), at: 0)

            WestSemis.insert(simulateP(team1:West[7], team2:West[0]), at: 0)
            WestSemis.insert(simulateP(team1:West[6], team2:West[1]), at: 0)
            WestSemis.insert(simulateP(team1:West[5], team2:West[2]), at: 0)
            WestSemis.insert(simulateP(team1:West[4], team2:West[3]), at: 0)

        
            esemis1.text = "(" + String(EastSemis[3].seed!) + ")   vs."
            esemis4.text = "(" + String(EastSemis[1].seed!) + ")"
            esemis2.text = "(" + String(EastSemis[2].seed!) + ")   vs."
            esemis3.text = "(" + String(EastSemis[0].seed!) + ")"
            esemisIMG1.image = EastSemis[3].image
            esemisIMG4.image = EastSemis[0].image
            esemisIMG3.image = EastSemis[1].image
            esemisIMG2.image = EastSemis[2].image
        
        
            wsemis1.text = "(" + String(WestSemis[3].seed!) + ")   vs."
            wsemis4.text = "(" + String(WestSemis[0].seed!) + ")"
            wsemis2.text = "(" + String(WestSemis[2].seed!) + ")   vs."
            wsemis3.text = "(" + String(WestSemis[1].seed!) + ")"
            wsemisIMG1.image = WestSemis[3].image
            wsemisIMG4.image = WestSemis[0].image
            wsemisIMG2.image = WestSemis[2].image
            wsemisIMG3.image = WestSemis[1].image
        

            var EastFinals: [Team] = []
            var WestFinals: [Team] = []

            EastFinals.insert(simulateP(team1:EastSemis[3], team2:EastSemis[0]), at: 0)
            EastFinals.insert(simulateP(team1:EastSemis[2], team2:EastSemis[1]), at: 0)

            WestFinals.insert(simulateP(team1:WestSemis[3], team2:WestSemis[0]), at: 0)
            WestFinals.insert(simulateP(team1:WestSemis[2], team2:WestSemis[1]), at: 0)

            efinals1.text = "(" + String(EastFinals[1].seed!) + ")   vs."
            efinals2.text = "(" + String(EastFinals[0].seed!) + ")"
            efinalsIMG1.image = EastFinals[1].image
            efinalsIMG2.image = EastFinals[0].image
        
            wfinals1.text = "(" + String(WestFinals[1].seed!) + ")   vs."
            wfinals2.text = "(" + String(WestFinals[0].seed!) + ")"
            wfinalsIMG1.image = WestFinals[1].image
            wfinalsIMG2.image = WestFinals[0].image
        
        
            var Finals: [Team] = []
            Finals.insert(simulateP(team1:EastFinals[1], team2:EastFinals[0]), at: 0)
            Finals.insert(simulateP(team1:WestFinals[1], team2:WestFinals[0]), at: 0)

        
            finals1.text =  "(" + String(Finals[0].seed!) + ")   vs."
            finals2.text =  "(" + String(Finals[1].seed!) + ")"
            finalsIMG1.image = Finals[0].image
            finalsIMG2.image = Finals[1].image
        
            var winner : Team
            winner = simulateP(team1:Finals[1], team2:Finals[0])
            champion.text = "The " + winner.name + " are the NBA Champions"
            championIMG.image = winner.image
        
        
            reset(NBAteams: teams)
            return winner
    
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
